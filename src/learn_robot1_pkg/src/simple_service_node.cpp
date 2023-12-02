#include "ros/ros.h"
#include "learn_robot1_pkg/simple_program.h"


bool simple(learn_robot1_pkg::simple_program::Request &req, learn_robot1_pkg::simple_program::Response &res){
    res.sum = req.a + req.b;
    return true;
}


int main(int argc, char **argv){
    ros::init(argc, argv, "Service_Node");    // First initialization
    ros::NodeHandle nh;                     // Inisialisasi node
    
    ros::ServiceServer service = nh.advertiseService("simple_program", simple);
    // service          : the name to call the service 
    // simple_program   : the name of the service
    // simple           : callback function

    ros::spin();    
    
    return 0;
}