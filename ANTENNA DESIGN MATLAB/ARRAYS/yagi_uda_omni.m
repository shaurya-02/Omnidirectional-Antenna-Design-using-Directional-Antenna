numElements=8;
radius=5;
TiltAngle=rad2deg(0);
freq=2.44e9;
 
yogi=yagiUda('numDirectors',20);
yagi=design(yogi,freq);
yagi.Tilt=90;
yagi.TiltAxis='Y';
 
Theta=linspace(0,2*pi,numElements+1);
Theta(end)=[];
x=radius*cos(Theta);
y=radius*sin(Theta);
z=zeros(1,numElements);
Positions=[x;y;z;]';
tiltedAntennas = cell(1,numElements);
for i = 1:numElements
   tiltedAntennas{i} = copy(yagi);
   tiltedAntennas{i}.Tilt = rad2deg(TiltAngle);
end
circularArray= conformalArray('Element',tiltedAntennas,'ElementPosition',Positions);
 
figure;
show(circularArray);
title("Omnidirectional Antenna using Yagi-Uda Antennae");
 
figure;
pattern(circularArray,freq);
title("Radiation Pattern");
 
figure;
pattern(circularArray,freq,0,0:1:360);
title("Gain");
figure;
pattern(circularArray,freq,0:1:360,0);
title("Directivity");
