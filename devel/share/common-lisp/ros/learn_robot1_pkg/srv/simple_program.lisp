; Auto-generated. Do not edit!


(cl:in-package learn_robot1_pkg-srv)


;//! \htmlinclude simple_program-request.msg.html

(cl:defclass <simple_program-request> (roslisp-msg-protocol:ros-message)
  ((a
    :reader a
    :initarg :a
    :type cl:integer
    :initform 0)
   (b
    :reader b
    :initarg :b
    :type cl:integer
    :initform 0))
)

(cl:defclass simple_program-request (<simple_program-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <simple_program-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'simple_program-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name learn_robot1_pkg-srv:<simple_program-request> is deprecated: use learn_robot1_pkg-srv:simple_program-request instead.")))

(cl:ensure-generic-function 'a-val :lambda-list '(m))
(cl:defmethod a-val ((m <simple_program-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader learn_robot1_pkg-srv:a-val is deprecated.  Use learn_robot1_pkg-srv:a instead.")
  (a m))

(cl:ensure-generic-function 'b-val :lambda-list '(m))
(cl:defmethod b-val ((m <simple_program-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader learn_robot1_pkg-srv:b-val is deprecated.  Use learn_robot1_pkg-srv:b instead.")
  (b m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <simple_program-request>) ostream)
  "Serializes a message object of type '<simple_program-request>"
  (cl:let* ((signed (cl:slot-value msg 'a)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'b)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <simple_program-request>) istream)
  "Deserializes a message object of type '<simple_program-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'a) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'b) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<simple_program-request>)))
  "Returns string type for a service object of type '<simple_program-request>"
  "learn_robot1_pkg/simple_programRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'simple_program-request)))
  "Returns string type for a service object of type 'simple_program-request"
  "learn_robot1_pkg/simple_programRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<simple_program-request>)))
  "Returns md5sum for a message object of type '<simple_program-request>"
  "6a2e34150c00229791cc89ff309fff21")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'simple_program-request)))
  "Returns md5sum for a message object of type 'simple_program-request"
  "6a2e34150c00229791cc89ff309fff21")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<simple_program-request>)))
  "Returns full string definition for message of type '<simple_program-request>"
  (cl:format cl:nil "# Request~%int64 a~%int64 b~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'simple_program-request)))
  "Returns full string definition for message of type 'simple_program-request"
  (cl:format cl:nil "# Request~%int64 a~%int64 b~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <simple_program-request>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <simple_program-request>))
  "Converts a ROS message object to a list"
  (cl:list 'simple_program-request
    (cl:cons ':a (a msg))
    (cl:cons ':b (b msg))
))
;//! \htmlinclude simple_program-response.msg.html

(cl:defclass <simple_program-response> (roslisp-msg-protocol:ros-message)
  ((sum
    :reader sum
    :initarg :sum
    :type cl:integer
    :initform 0))
)

(cl:defclass simple_program-response (<simple_program-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <simple_program-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'simple_program-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name learn_robot1_pkg-srv:<simple_program-response> is deprecated: use learn_robot1_pkg-srv:simple_program-response instead.")))

(cl:ensure-generic-function 'sum-val :lambda-list '(m))
(cl:defmethod sum-val ((m <simple_program-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader learn_robot1_pkg-srv:sum-val is deprecated.  Use learn_robot1_pkg-srv:sum instead.")
  (sum m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <simple_program-response>) ostream)
  "Serializes a message object of type '<simple_program-response>"
  (cl:let* ((signed (cl:slot-value msg 'sum)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <simple_program-response>) istream)
  "Deserializes a message object of type '<simple_program-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sum) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<simple_program-response>)))
  "Returns string type for a service object of type '<simple_program-response>"
  "learn_robot1_pkg/simple_programResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'simple_program-response)))
  "Returns string type for a service object of type 'simple_program-response"
  "learn_robot1_pkg/simple_programResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<simple_program-response>)))
  "Returns md5sum for a message object of type '<simple_program-response>"
  "6a2e34150c00229791cc89ff309fff21")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'simple_program-response)))
  "Returns md5sum for a message object of type 'simple_program-response"
  "6a2e34150c00229791cc89ff309fff21")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<simple_program-response>)))
  "Returns full string definition for message of type '<simple_program-response>"
  (cl:format cl:nil "# Response~%int64 sum~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'simple_program-response)))
  "Returns full string definition for message of type 'simple_program-response"
  (cl:format cl:nil "# Response~%int64 sum~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <simple_program-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <simple_program-response>))
  "Converts a ROS message object to a list"
  (cl:list 'simple_program-response
    (cl:cons ':sum (sum msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'simple_program)))
  'simple_program-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'simple_program)))
  'simple_program-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'simple_program)))
  "Returns string type for a service object of type '<simple_program>"
  "learn_robot1_pkg/simple_program")