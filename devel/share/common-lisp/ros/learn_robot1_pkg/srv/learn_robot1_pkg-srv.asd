
(cl:in-package :asdf)

(defsystem "learn_robot1_pkg-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "simple_program" :depends-on ("_package_simple_program"))
    (:file "_package_simple_program" :depends-on ("_package"))
  ))