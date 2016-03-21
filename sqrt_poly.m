Skip to content
This repository  
Search
Pull requests
Issues
Gist
 @rahul1608
 Watch 1
  Star 0
  Fork 0 Prats08/AWGN-RTL-Design
 Code  Issues 0  Pull requests 0  Wiki  Pulse  Graphs
Branch: master Find file Copy pathAWGN-RTL-Design/SQRT_poly.m
b9c3f79  7 hours ago
@Prats08 Prats08 Added files via upload
1 contributor
RawBlameHistory     55 lines (43 sloc)  1.22 KB
%%a simple example for polyfit to approximate cosine function
%% Kiran Gunnam

clear all
clc
close all

ns=2^7; %%number of segments
nr=2^6; %%number of points in each segment
np=1; %% polynomial order used
arg_max = pi/2;

for i=1:(ns)

    xsegment_start = (i-1)/ns*arg_max;
    xsegment_end   = i/ns*arg_max;
    xsegment_step  = 1/(ns*nr)*arg_max;
        
    x(i,:)  =  xsegment_start:xsegment_step:xsegment_end;
    y(i,:)  =  cos(x(i,:));
    p(i,:)  =  polyfit(x(i,:),y(i,:),np);

    y1(i,:) = polyval(p(i,:),x(i,:));

        %%polynomial

        Cc1(i,:) = ( -1 * p(i,1));
        C1fi(i,1) = fi(Cc1(i,1), 0, 12, 11);
        C1Binary (i,:) = bin(C1fi(i,1));
    
        C0fi(i,1) = fi(p(i,2), 0, 19, 18);
        C0Binary (i,:) = bin(C0fi(i,1));
    
    e(i)  = max(abs(y(i,:)- y1(i,:)));
end
figure
plot(reshape(x',1,[]),reshape(y',1,[]),'b')
hold on
plot(reshape(x',1,[]),reshape(y1',1,[]),'r')
title('cos');
hold off
figure;

plot(e)
title('error vs segment number');
xlabel('segment number')
ylabel('error');
max_error=max(e)
spec_error=2^-15

if(max_error<=spec_error)
    disp('error specification is satisfied')
else
    disp('error specification is not satisfied')
end
Status API Training Shop Blog About
© 2016 GitHub, Inc. Terms Privacy Security Contact Help