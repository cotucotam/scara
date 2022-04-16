function plot_robot(handles)
%% DH Table
global plotdata;
global Scara;
axes(handles.axes1);
cla(handles.axes1,'reset')

Scara.theta1 = str2num(get(handles.DisplayTheta1,'String'))*pi/180;
Scara.theta2 = str2num(get(handles.DisplayTheta2,'String'))*pi/180;
Scara.d3     = str2num(get(handles.DisplayD3,'String'));
Scara.theta4 = str2num(get(handles.DisplayTheta4,'String'))*pi/180;

[ p, o, A]=Scara.forward_kinnematic(Scara,Scara.theta1,Scara.theta2,Scara.theta4,Scara.d3);  
p0 = [0;0;0.372];
A0=[1 0 0 0;
      0 1 0 0;
      0 0 1 p0(3);
      0 0 0 1];
p1 = p(:,1);
p2 = p(:,2);
p3 = p(:,3);
p4 = p(:,4);
o1 = o(:,1);
o2 = o(:,2);
o3 = o(:,3);
o4 = o(:,4);

px1=p1(1);
py1=p1(2);
pz1=p1(3);

px2=p2(1);
py2=p2(2);
pz2=p2(3);

px3=p3(1);
py3=p3(2);
pz3=p3(3);

px4=p4(1);
py4=p4(2);
pz4=p4(3);


%% Plot
hold on
grid on
p0 = [0;0;0.372];
Con =[p0,p1,p2,p3,p4];

xlabel('x');
ylabel('y');
zlabel('z');
xlim([-1.2 1.2]);
ylim([-1.2 1.2]);
zlim([0 1.2]);
RobotColor=[172/255 172/255 172/255];

         
picker(p4(1),p4(2),p4(3),o4(3),0.1,0.1);
%% RObot que
% define links
base_plot=plot3([0 0],[ 0 0 ],[0 0.372],'color',RobotColor,'LineWidth',10);
base_plot.Color(4)=1;
plot3(0,0,-0.5,'rx')
line1=[[p0(1) p1(1)];[p0(2) p1(2)];[p0(3) p1(3)]];
line2=[[p1(1) p2(1)];[p1(2) p2(2)];[p1(3) p2(3)]];
line3=[[p2(1) p3(1)];[p2(2) p3(2)];[p2(3) p3(3)]];
line4=[[p3(1) p4(1)];[p3(2) p4(2)];[p3(3) p4(3)]];

%link1
line1_plot=plot3(line1(1,:),line1(2,:),line1(3,:),'color',RobotColor,'LineWidth',10);
line1_plot.Color(4)=0.5;
%link2
line2_plot=plot3(line2(1,:),line2(2,:),line2(3,:),'color',RobotColor,'LineWidth',10);
line2_plot.Color(4)=0.5;
%link3
line3_plot=plot3(line3(1,:),line3(2,:),line3(3,:),'color',RobotColor,'LineWidth',10);
line3_plot.Color(4)=0.5;
%link4
line4_plot=plot3(line4(1,:),line4(2,:),line4(3,:),'color',RobotColor,'LineWidth',10);
line4_plot.Color(4)=0.5;
plot3(Con(1,:),Con(2,:),Con(3,:),'rx')

if handles.checkboxCo0.Value
    plot_coordinate(p0(1),p0(2),p0(3),A0);%% 0.1 là ofset cai de
end
if handles.checkboxCo1.Value
    plot_coordinate(px1,py1,pz1,A(:,:,1));
end
if handles.checkboxCo2.Value
    plot_coordinate(px2,py2,pz2,A(:,:,2));
end
if handles.checkboxCo3.Value
    plot_coordinate(px3,py3,pz3,A(:,:,3));
end
if handles.checkboxCo4.Value
    plot_coordinate(px4,py4,pz4,A(:,:,4));
end

%% position view
set(handles.SliderX,'value',p4(1));
set(handles.SliderY,'value',p4(2));
set(handles.SliderZ,'value',p4(3));
set(handles.SliderYaw,'value',o4(3)/pi*180);
set(handles.DisplayX,'string',num2str(round(p4(1),4)));
set(handles.DisplayY,'string',num2str(round(p4(2),4)));
set(handles.DisplayZ,'string',num2str(round(p4(3),4)));
set(handles.DisplayYaw,'string',num2str(o4(3)/pi*180));

data1 = [round(p1(1),4) round(p1(2),4) round(p1(3),4) round(o1(1)/pi*180,4) round(o1(2)/pi*180,4) round(o1(3)/pi*180,4);
         round(p2(1),4) round(p2(2),4) round(p2(3),4) round(o2(1)/pi*180,4) round(o2(2)/pi*180,4) round(o2(3)/pi*180,4);
         round(p3(1),4) round(p3(2),4) round(p3(3),4) round(o3(1)/pi*180,4) round(o3(2)/pi*180,4) round(o3(3)/pi*180,4);
         round(p4(1),4) round(p4(2),4) round(p4(3),4) round(o4(1)/pi*180,4) round(o4(2)/pi*180,4) round(o4(3)/pi*180,4)];
set(handles.TablePosition,'data',data1);

plotdata = [plotdata;p4(1) p4(2) p4(3)];
plot3(plotdata(:,1),plotdata(:,2),plotdata(:,3),'Color','r','MarkerSize',10);
%% view 
Az = str2num(get(handles.edit_AZ,'String'));
Et = str2num(get(handles.edit_ET,'String'));;
rotate3d on;
view(Az,Et);
end
%%
