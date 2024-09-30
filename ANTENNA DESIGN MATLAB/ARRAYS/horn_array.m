clc;
clearvars;
numElements=8;
radius=10;
freq=2.44e9;
 
h=horn('FlareLength',0.634,'FlareWidth',0.532,'FlareHeight',0.355,'Length',0.104,'width',0.0921,'Height',0.0461,'FeedHeight',0.0269);
antenna=design(h,freq);
 
Theta=linspace(0,2*pi,numElements+1);
Theta(end)=[];
x=radius*cos(Theta);
y=radius*sin(Theta);
z=zeros(1,numElements);
Positions=[x;y;z;]';
tiltedAntennas = cell(1,numElements);
 
for i = 1:numElements
   tiltedAntennas{i} = copy(antenna);
   tiltedAntennas{i}.TiltAxis=[1 0 0;0 0 1];
   tiltedAntennas{i}.Tilt=[90 rad2deg(Theta(i)+(2*pi))];
end
 circularArray= conformalArray('Element',tiltedAntennas,'ElementPosition',Positions);
 
figure;
show(circularArray);
title("Omnidirectional Antenna using Horn Antennae");
 figure;
pattern(circularArray,freq);
title("Radiation Pattern");
 figure;
pattern(circularArray,freq,0,0:1:360);
title("Gain");
 figure;
pattern(circularArray,freq,0:1:360,0);
title("Directivity");
