#include "ros/ros.h"
#include "geometry_msgs/Twist.h"
ros::Publisher velocity_publisher;

using namespace std;

void move(float velocity, float distance, bool isforward);

int main(int argc, char **argv){
    ros::init(argc, argv, "robot_cleaner");
    ros::NodeHandle n;

    float velocity, distance, rotate;
    bool isforward;


    velocity_publisher = n.advertise<geometry_msgs::Twist>("/turtle1/cmd_vel", 1000);
    cout    << "enter velocity  : ";
    cin     >> velocity;
    cout    <<"enter distance  : ";
    cin     >> distance;
    cout    << "Is forward (1/0): ";
    cin     >> isforward;

    cout    << "enter rotation";
    cin     >> rotate;

    move(velocity, distance, isforward);
}

void move(float velocity, float distance, bool isforward){
    geometry_msgs::Twist vel_msg;
    
    if (isforward){
        vel_msg.linear.x = abs(velocity);
    } else{
        vel_msg.linear.x = -abs(velocity);
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
        ros::spinOnce();
        loop_rate.sleep();
    }

    vel_msg.linear.x = 0;
    velocity_publisher.publish(vel_msg);
}