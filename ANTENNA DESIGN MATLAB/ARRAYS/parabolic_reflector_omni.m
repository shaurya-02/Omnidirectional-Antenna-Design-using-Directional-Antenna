clc;
clearvars;
 
numElements=6;
radius = 6 ;
tiltAngle = rad2deg(0);
freq=2.44e9;
y1=2.5;
y2=y1/2;
antennaObject=design(reflectorParabolic,freq);
antennaObject.Radius=y1;
antennaObject.FocalLength=y2;
antennaObject.Tilt=0;
antennaObject.TiltAxis='X';
antennaObject.Exciter.Tilt=90;
antennaObject.Exciter.TiltAxis='Y';
 
Theta = linspace(0,2*pi,numElements+1);
Theta(end) = [ ];
x = radius*cos(Theta);
y = radius*sin(Theta);
z = zeros(1,6);
Positions = [x;y;z;]';
 
tiltedAntennas = cell(1,numElements);
for i = 1:numElements
   tiltedAntennas{i} = copy(antennaObject);
    
   tiltedAntennas{i}.Tilt = rad2deg(tiltAngle);
end
    
circularArray = conformalArray('Element',antennaObject,'ElementPosition',Positions);
 
figure;
pattern(circularArray,freq,0:1:360,0);
title('omnidirectional antenna');
