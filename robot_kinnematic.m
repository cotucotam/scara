classdef robot_kinnematic
       methods(Static)
           function A = get_DHmatrix(paramsDH)
                a= paramsDH(1);
                alpha=paramsDH(2);
                d=paramsDH(3);
                theta=paramsDH(4);
                A= [cos(theta) ,-cos(alpha)*sin(theta) , sin(alpha)*sin(theta) , a*cos(theta)    ;
                    sin(theta) , cos(alpha)*cos(theta) ,-sin(alpha)*cos(theta) , a*sin(theta)    ;
                        0      , sin(alpha)            , cos(alpha)            , d               ;
                        0      , 0                     , 0                     , 1              ];
           end
           function [P,O] = cal_pose(A,p0)
            %% position
                p_extended  = [p0;1];
                P_temp =  A*p_extended;
                P = P_temp(1:3);
            %% Orientation
                O(1)  = atan2(A(2,3),A(3,3));%roll
                O(2)  = asin(A(1,3));%%pitch
                O(3)  = atan2(A(1,2),A(1,1));%yaw
            end
       end
end
             