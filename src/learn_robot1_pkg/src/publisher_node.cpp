#include "ros/ros.h"
// #include "std_msgs/String.h" //----Commented for custom msg testing
#include "learn_robot1_pkg/person_data.h"


int main(int argc, char **argv){
    ros::init(argc, argv, "Publisher");     // First initialization
    ros::NodeHandle nh;                     // Inisialisasi node
    
    // ros::Publisher topic_pub = nh.advertise<std_msgs::String>("attempt", 1); //----Commented for custom msg testing
    ros::Publisher topic_pub = nh.advertise<learn_robot1_pkg::person_data>("attempt", 1);
    // std_msgs::String     -> Type of message we want to use for publisher
    // "attempt"            -> name of the topic
    // 1000                 -> Queue Size : Length of the data  

    ros::Rate loop_rate(1);                 // How often we want to publish our message in Hz

    while(ros::ok()){                       // sama kaya while(1) atau while(TRUE) 
        // std_msgs::String msg;            // mirip kaya int number -> tapi langsung berupa string //----Commented for custom msg testing
        learn_robot1_pkg::person_data person_data;
        learn_robot1_pkg::person_data person_data_2;
        // msg.data = "Hello World";        //----Commented for custom msg testing
        person_data.name = "Dimas Ridhwana";  
        person_data.age = 20;  
        person_data.color = "Blue";  
    
        person_data_2.name = "Arif Sasongki";  
        person_data_2.age = 20;  
        person_data_2.color = "Blue";

        // topic_pub.publish(msg);          //----Commented for custom msg testing
        topic_pub.publish(person_data_2); 
        ros::spinOnce();                    // Check callback or anything new happen, only run once
        loop_rate.sleep(); 
    }
    
    return 0;
}