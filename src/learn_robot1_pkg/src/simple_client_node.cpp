#include "ros/ros.h"
#include "learn_robot1_pkg/simple_program.h"


int main(int argc, char **argv){
    ros::init(argc, argv, "Client_Node");    // First initialization
    ros::NodeHandle nh;                     // Inisialisasi node
    
    ros::ServiceClient client = nh.serviceClient<learn_robot1_pkg::simple_program>("simple_program");
    // learn_robot1_pkg::simple_program     = what kind of service you want to use (can be seen at the beginning of include file)
    // "simple_program"                     = name of service (the same with the name in the service node)

    learn_robot1_pkg::simple_program srv;
    srv.request.a = 2;
    srv.request.b = 4;

    if (client.call(srv)){
        ROS_INFO("The sum of two integers is : %ld", srv.response.sum);
    } else {
        ROS_INFO("Failed to call Service");
        return 1;
    }
    
    ros::spin();    
    
    return 0;
}