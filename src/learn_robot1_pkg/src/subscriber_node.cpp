#include "ros/ros.h"
#include "learn_robot1_pkg/person_data.h"
// #include "std_msgs/String.h"     //----Commented for custom msg testing


// void callme(const std_msgs::String::ConstPtr& msg){      //----Commented for custom msg testing
//     ROS_INFO("We received : %s", msg->data.c_str());
//     // Print info in the console
// }


void callme(const learn_robot1_pkg::person_data &person_data){
    ROS_INFO("Name  : %s", person_data.name.c_str());
    ROS_INFO("Age   : %i", person_data.age);
    ROS_INFO("Color : %s", person_data.color.c_str());
    // Print info in the console
}

int main(int argc, char **argv){
    ros::init(argc, argv, "Subscriber");    // First initialization
    ros::NodeHandle nh;                     // Inisialisasi node
    

    ros::Subscriber topic_sub = nh.subscribe("attempt", 1000, callme); 
    // std_msgs::String     -> Type of message we want to use for publisher
    // "attempt"            -> name of the topic
    // 1000                 -> Queue Size : Length of the data  
    // callme               -> Callback function -> fungsi yang akan dipanggil setiap subscribe

    ros::spin(); // run continously until receive interrupt input ctrl-C
    
    return 0;
}