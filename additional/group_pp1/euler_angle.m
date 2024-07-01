function R_zyz = euler_angle(th_z1, th_y, th_z2)
    %% this function calculate the euler angle for -pi/2, pi, pi/2 (Z-Y-Z)
    r_11 = cos(th_z1).*cos(th_y).*cos(th_z2) - sin(th_z1).*sin(th_z2);
    r_21 = sin(th_z1).*cos(th_y).*cos(th_z2) + cos(th_z1).*sin(th_z2);
    r_31 = -sin(th_y).*cos(th_z2);
    r_12 = -cos(th_z1).*cos(th_y).*sin(th_z2) - sin(th_z1).*cos(th_z2);
    r_22 = -sin(th_z1).*cos(th_y).*sin(th_z2) + cos(th_z1).*cos(th_z2);
    r_32 = sin(th_y).*sin(th_z2);
    r_13 = cos(th_z1).*sin(th_y);
    r_23 = sin(th_z1).*sin(th_y);
    r_33 = cos(th_y);
    R_zyz = [r_11, r_12, r_13;
             r_21, r_22, r_23;
             r_31, r_32, r_33];
