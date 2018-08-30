clc;clear;
x(:,:,1) = [ 0.28  1.31  -6.2;
             0.07  0.58  -0.78;
             1.54  2.01  -1.63;
            -0.44  1.18  -4.32;
            -0.81  0.21   5.73;
             1.52  3.16   2.77;
             2.20  2.42  -0.19;
             0.91  1.94   6.21;
             0.65  1.93   4.38;
            -0.26  0.82  -0.96];

x(:,:,2) = [0.011  1.03  -0.21;
             1.27  1.28   0.08;
             0.13  3.12   0.16;
            -0.21  1.23  -0.11;
            -2.18  1.39  -0.19;
             0.34  1.96  -0.16;
            -1.38  0.94   0.45;
            -0.12  0.82   0.17;
            -1.44  2.31   0.14;
             0.26  1.94   0.08];

x(:,:,3) = [ 1.36  2.17  0.14;
             1.41  1.45 -0.38;
             1.22  0.99  0.69;
             2.46  2.19  1.31;
             0.68  0.79  0.87;
             2.51  3.22  1.35;
             0.60  2.44  0.92;
             0.64  0.13  0.97;
             0.85  0.58  0.99;
             0.66  0.51  0.88];
         x1 = [-0.41,0.82,0.88];
         k = 3;
    %(a)    
        pn=zeros(2,301);
dis1=zeros(10,1);
for t=0:300
    dis1(:,1) = abs(x(:,1,3)-t/100);
    act_dis1=sort(dis1);
    pn(1,t+1)=t/100;
    pn(2,t+1)=(k/10)/(2*act_dis1(k,1));
end

hold on;
figure(1);
plot(pn(1,:),pn(2,:),'r.',pn(1,:),pn(2,:),'b-');


%(b)

dis2=zeros(10,2);
W=zeros(501,401);
for i=-300:200
    for j=0:400
        dis2(:,1) = abs(x(:,1,2)-i/100);
        dis2(:,2) = abs(x(:,2,2)-j/100);
        act_dis2=sort(sqrt(dis2(:,1).^2+dis2(:,2).^2));
        W(i+301,j+1)=(k/10)/(pi*act_dis2(k,1)^2);
    end
end

P=zeros(401,1);
for j=0:400
    P(j+1)=j/100;
end
Q=zeros(501,1);
for i=-300:200
    Q(i+301)=i/100;
end
figure(2);
mesh(P,Q,W);

% (c)
%x_t=[-0.41,0.82,0.88];
%x_t=[0.14,0.72,4.1];
x_t=[-0.81 0.61 -0.38];
dis3=zeros(10,3);
act_dis3=zeros(10,3);
p_3=zeros(1,3);
for i=1:3
    dis3(:,1,i) = abs(x(:,1,i)-x_t(1));
    dis3(:,2,i) = abs(x(:,2,i)-x_t(2));
    dis3(:,3,i) = abs(x(:,3,i)-x_t(3));
act_dis3(:,i)=sort(sqrt(dis3(:,1,i).^2+dis3(:,2,i).^2+dis3(:,3,i).^2));
p_3(1,i)=(k/10)/((4/3)*pi*act_dis3(k,i)^3);
end




        
        
        
