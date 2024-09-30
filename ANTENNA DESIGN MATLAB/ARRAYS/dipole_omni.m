clearvars;
numElements=8;
radius=0.5;
Tilt=rad2deg(0);
freq=2.44e9;
 
antenna=design(dipole,freq);
antenna.Tilt=90;
antenna.TiltAxis='Y';
 
Theta=linspace(0,2*pi,numElements+1);
Theta(end)=[];
x=radius*cos(Theta);
y=radius*sin(Theta);
z=zeros(1,numElements);
Positions=[x;y;z;]';
tiltedAntennaTemplate=copy(antenna);
tiltedAntennaTemplate.Tilt=rad2deg(Tilt);
 
tiltedAntennas= repmat({tiltedAntennaTemplate},1,numElements);
 circularArray= conformalArray('Element',tiltedAntennas,'ElementPosition',Positions);
 
figure;
show(circularArray);
title("Omnidirectional Antenna using Dipole Antennae");
 
figure;
pattern(circularArray,freq);
title("Radiation Pattern");
 
figure;
pattern(circularArray,freq,0,0:1:360);
title("Gain");
 
figure;
pattern(circularArray,freq,0:1:360,0);
title("Directivity");
