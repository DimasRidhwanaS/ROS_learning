#include "ros/ros.h"
#include "geometry_msgs/Twist.h"
#include "turtlesim/Pose.h"
#include <sstream>

using namespace std;

ros::Publisher velocity_publisher;
ros::Subscriber pose_subscriber;
turtlesim::Pose actual_pose;

const double PI = 3.14159265359;

void move(float velocity, float distance, bool isforward);
void rotate(float angular_speed, float angle, bool clockwise);
double degrees2radians(float angle_in_degrees);
double set_target_orientation(float target_angle_in_radians);
void poseCallback(const turtlesim::Pose::ConstPtr & pose_message);

double time_0;
double time_1;
int looping_rate = 100;

int main(int argc, char **argv){
    ros::init(argc, argv, "robot_cleaner");
    ros::NodeHandle n;

    float velocity, distance;
    float ang_vel, target_angle;
    bool isforward, isclockwise;

    velocity_publisher  = n.advertise<geometry_msgs::Twist>("/turtle1/cmd_vel", 1000);
    pose_subscriber     = n.subscribe("turtle1/pose", 10, poseCallback);    


    ros::Rate loop_rate(looping_rate);   // rate on Hertz

    ROS_INFO("====== Setting Up pub/sub ======");
    ROS_INFO("Using Looprate    :   %d", looping_rate);
    time_0 = ros::Time::now().toSec();      // Get initial time

    // cout    << "enter velocity  : ";
    // cin     >> velocity;
    // cout    <<"enter distance  : ";
    // cin     >> distance;
    // cout    << "Is forward (1/0): ";
    // cin     >> isforward;

    // move(velocity, distance, isforward);

    // cout    << "enter angular velocity (degree/sec) : ";
    // cin     >> ang_vel;
    // cout    <<"enter target angle (degree)         : ";
    // cin     >> target_angle;
    // cout    << "Is Clockwise (1/0): ";
    // cin     >> isclockwise;
    // rotate(degrees2radians(ang_vel), degrees2radians(target_angle), isclockwise);


    set_target_orientation(degrees2radians(60));
    ROS_INFO("Target 10 Achieved");
	loop_rate.sleep();
	// set_target_orientation(degrees2radians(-60));
    // ROS_INFO("Target -60 Achieved");
	// loop_rate.sleep();
	// set_target_orientation(degrees2radians(0));
    // ROS_INFO("Target 0 Achieved");

    // rotate(degrees2radians(30), degrees2radians(90), 0);

    // set_target_orientation(degrees2radians(-60));
    // loop_rate.sleep();
    // set_target_orientation(degrees2radians(0));
    // loop_rate.sleep();

    // ROS_INFO("t0    : %f >>>>>> t1  : %f", t0, t1);
    time_1 = ros::Time::now().toSec();
    double time = time_1-time_0;
    ROS_INFO("Elapsed Time is   :   %f", time);
    ROS_INFO("====== Program has been Executed ======");
    
    ros::spin();
}

void move(float velocity, float distance, bool isforward){
    geometry_msgs::Twist vel_msg;
    
    if (isforward){
        vel_msg.linear.x = (velocity);
    } else{
        vel_msg.linear.x = -(velocity);
    }
    vel_msg.linear.y = 0;
    vel_msg.linear.z = 0;

    vel_msg.angular.x = 0;
    vel_msg.angular.y = 0;
    vel_msg.angular.z = 0;

    // get the time
    double t0       = ros::Time::now().toSec();
    double cur_dis  = 0;
    ros::Rate loop_rate(10);        // 10 messages per second

    // move until reaces the point
    // distance = velocity*time
    while (cur_dis < distance){
        velocity_publisher.publish(vel_msg);
        double t1 = ros::Time::now().toSec();
        cur_dis = (t1-t0)*velocity;
        ROS_INFO("t0    : %f >>>>>> t1  : %f", t0, t1);
        ros::spinOnce();
        loop_rate.sleep();
    }

    // t0 = t1;
    vel_msg.linear.x = 0;
    velocity_publisher.publish(vel_msg);
}

void rotate(float angular_speed, float angle, bool clockwise){
    /*=======================================================
    Description

    angular_speed       = rad/s
    angle               = rad

    the formula is
        cur_angle   = angular_speed * t

    The code should run and looping until the angle is equal with cur_angle
    
    =======================================================*/
    
    geometry_msgs::Twist vel_msg;
    vel_msg.linear.x = 0;
    vel_msg.linear.y = 0;
    vel_msg.linear.z = 0;
    
    vel_msg.angular.x = 0;
    vel_msg.angular.y = 0;
    
    if (clockwise){
        vel_msg.angular.z = -abs(angular_speed);
    } else {
        vel_msg.angular.z = abs(angular_speed);
    }

    int counting_rate;
    float cur_ang;
    double t0 = ros::Time::now().toSec();
    ros::Rate loop_rate(looping_rate);


    while(cur_ang < abs(angle)){
        velocity_publisher.publish(vel_msg);
        double t1 = ros::Time::now().toSec();
        cur_ang = angular_speed*(t1-t0);

        counting_rate++;
        // ROS_INFO("Cur   : %f >>>>>> Tar : %f", cur_ang, angle);
        ROS_INFO("t0    : %f >>>>>> t1  : %f <<<<<<< count  : %d", t0, t1, counting_rate);

        ros::spinOnce();
        loop_rate.sleep();
    }

    vel_msg.angular.z = 0;
    velocity_publisher.publish(vel_msg);
}

double degrees2radians(float angle_in_degrees){
    return angle_in_degrees*PI/180.0;
}

double set_target_orientation(float target_angle_in_radians){
    double relative_angle_radians = target_angle_in_radians - actual_pose.theta;
    bool clockwise = ((relative_angle_radians<0)?true:false);
    // cout << target_angle_in_radians << "," << actual_pose.theta << "," << relative_angle_radians;
    rotate(degrees2radians(30), abs(relative_angle_radians), clockwise);
}

void poseCallback(const turtlesim::Pose::ConstPtr & pose_message){
    actual_pose.x       = pose_message->x;
    actual_pose.y       = pose_message->y;
    actual_pose.theta   = pose_message->theta;

    // ROS_INFO("%f", (actual_pose.theta*180/PI));
}




/*====================================================================
By creating this code, I learn

How does ros::Rate works
    ros rate will determine how fast the program will PUBLISH/SUBSCRIBE 
    the message

How does publishing message by topics works
    In this code, publishing and subscribing message works by using 
    ros-made msg such as Twist and Pose. To determine what type of 
    topic we are using, use
    "rostopic info {node_name}"

How to get time 
    use ROS::Time::now().tosec()

Some basic C++ Syntax
    to print in Serial Monitor
        cout << target_angle_in_radians << "," << actual_pose.theta << "," << relative_angle_radians;
    
====================================================================*/