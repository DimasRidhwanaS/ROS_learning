
## This is the template for

# Robot
<robot name="<name of the robot>">
<link> ..... </link>
<link> ...... </link>
<joint> ....... </joint>
<joint> ........</joint>
</robot>



# Links
<link name="<name of the link>">
    <inertial>...........</inertial>
    <visual> ............</visual>
    <collision>..........</collision>
</link>

Contoh
    <link name = "base_link">
        <inertial>
            <mass value="1"/>
            <inertia ixx="1.0" ixy="0.0" ixz="0.0" iyy="1.0" iyz="0.0" izz="1.0"/>
        </inertial>
        <visual>    
            <geometry>
                <cylinder length="0.1" radius="0.2"/>
            </geometry>
            <origin rpy="0 0 0" xyz="0 0 0"/>
            <material name="yellow_material">
                <color rgba="1 1 0 1"/>
            </material>
        </visual>
        <collision>     
            <geometry>
                <cylinder length="0.03" radius="0.2"/>
            </geometry>
            <origin rpy="0 0 0" xyz="0 0 0"/>
        </collision>
    </link>



# Joint
<joint name="<name of the joint>">
    <parent link="link1"/>
    <child link="link2"/>
    <calibration .... />
    <dynamics damping ..../>
    <limit effort .... />
</joint>

Contoh
    <joint name="first_joint" type="revolute">
        <parent link="base_link"/>
        <child link="pan_link"/>
        <origin xyz="0 0 0.1"/>
        <axis xyz="0 0 1" />
        <limit effort="300" velocity="0.1" lower="-3.14" upper="3.14"/>
        <dynamics damping="50" friction="1"/>
    </joint>


