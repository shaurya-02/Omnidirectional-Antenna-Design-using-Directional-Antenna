clear all;
close all;
 
freq = 2.4e9;
 
 
ParabolicAntenna = reflectorParabolic('Radius',2.50,'focalLength',1.25);
 
figure;
show(ParabolicAntenna);
title('omnidirectional antenna ');
 
figure;
pattern(ParabolicAntenna,freq);
title('omnidirectional antenna ');
 
figure;
pattern(ParabolicAntenna,freq,0,0:1:360);
title('omnidirectional antenna');
 
figure;
pattern(ParabolicAntenna,freq,0:1:360,0);
title('omnidirectional antenna');
