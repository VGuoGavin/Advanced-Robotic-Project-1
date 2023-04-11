
function theta=Backward(T)
    a=[0,0.42500,0.392,0,0,0];
    d=[0.0892,0,0,0.109,0.095,0.0825];
    nx=T(1,1);ny=T(2,1);nz=T(3,1);
    ox=T(1,2);oy=T(2,2);oz=T(3,2);
    ax=T(1,3);ay=T(2,3);az=T(3,3);
    px=T(1,4);py=T(2,4);pz=T(3,4);
    %1th joint
    m=d(6)*ay-py;  n=ax*d(6)-px; 
    theta1(1,1)=atan2(real(m),real(n))-atan2(real(d(4)),real(sqrt(m^2+n^2-(d(4))^2)));
    theta1(1,2)=atan2(real(m),real(n))-atan2(real(d(4)),real(-sqrt(m^2+n^2-(d(4))^2)));
    %5th joint
    theta5(1,1:2)=acos(ax*sin(theta1)-ay*cos(theta1));
    theta5(2,1:2)=-acos(ax*sin(theta1)-ay*cos(theta1));      
    %6th joint
    mm=nx*sin(theta1)-ny*cos(theta1); nn=ox*sin(theta1)-oy*cos(theta1);
    %theta6=atan2(mm,nn)-atan2(sin(theta5),0);
    theta6(1,1:2)=atan2((mm),(nn))-atan2((sin(theta5(1,1:2))),0);
    theta6(2,1:2)=atan2((mm),(nn))-atan2((sin(theta5(2,1:2))),0);
    %3th joint
    mmm(1,1:2)=d(5)*(sin(theta6(1,1:2)).*(nx*cos(theta1)+ny*sin(theta1))+cos(theta6(1,1:2)).*(ox*cos(theta1)+oy*sin(theta1))) ...
        -d(6)*(ax*cos(theta1)+ay*sin(theta1))+px*cos(theta1)+py*sin(theta1);
    nnn(1,1:2)=pz-d(1)-az*d(6)+d(5)*(oz*cos(theta6(1,1:2))+nz*sin(theta6(1,1:2)));
    mmm(2,1:2)=d(5)*(sin(theta6(2,1:2)).*(nx*cos(theta1)+ny*sin(theta1))+cos(theta6(2,1:2)).*(ox*cos(theta1)+oy*sin(theta1))) ...
        -d(6)*(ax*cos(theta1)+ay*sin(theta1))+px*cos(theta1)+py*sin(theta1);
    nnn(2,1:2)=pz-d(1)-az*d(6)+d(5)*(oz*cos(theta6(2,1:2))+nz*sin(theta6(2,1:2)));
    theta3(1:2,:)=acos((mmm.^2+nnn.^2-(a(2))^2-(a(3))^2)/(2*a(2)*a(3)));
    theta3(3:4,:)=-acos((mmm.^2+nnn.^2-(a(2))^2-(a(3))^2)/(2*a(2)*a(3)));
    %2th joint
    mmm_s2(1:2,:)=mmm;
    mmm_s2(3:4,:)=mmm;
    nnn_s2(1:2,:)=nnn;
    nnn_s2(3:4,:)=nnn;
    s2=((a(3)*cos(theta3)+a(2)).*nnn_s2-a(3)*sin(theta3).*mmm_s2)./ ...
        ((a(2))^2+(a(3))^2+2*a(2)*a(3)*cos(theta3));
    c2=(mmm_s2+a(3)*sin(theta3).*s2)./(a(3)*cos(theta3)+a(2));
    theta2=atan2(real(s2), real(c2));   
    % check 1th 5th 6th 3th 2th joint
    theta(1:4,1)=theta1(1,1);theta(5:8,1)=theta1(1,2);
    theta(:,2)=[theta2(1,1),theta2(3,1),theta2(2,1),theta2(4,1),theta2(1,2),theta2(3,2),theta2(2,2),theta2(4,2)]';
    theta(:,3)=[theta3(1,1),theta3(3,1),theta3(2,1),theta3(4,1),theta3(1,2),theta3(3,2),theta3(2,2),theta3(4,2)]';
    theta(1:2,5)=theta5(1,1);theta(3:4,5)=theta5(2,1);
    theta(5:6,5)=theta5(1,2);theta(7:8,5)=theta5(2,2);
    theta(1:2,6)=theta6(1,1);theta(3:4,6)=theta6(2,1);
    theta(5:6,6)=theta6(1,2);theta(7:8,6)=theta6(2,2); 
    %4th joint
    theta(:,4)=atan2(-sin(theta(:,6)).*(nx*cos(theta(:,1))+ny*sin(theta(:,1)))-cos(theta(:,6)).* ...
     (ox*cos(theta(:,1))+oy*sin(theta(:,1))),oz*cos(theta(:,6))+nz*sin(theta(:,6)))-theta(:,2)-theta(:,3);  
end

