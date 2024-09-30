clc;
clearvars;
 
freq=2.44e9;
 
d = dielectric('Air');
pm=patchMicrostrip('Substrate',d);
antenna=design(pm,freq);
 
figure;
show(antenna);
 
figure;
pattern(antenna,freq);
title("Radiation Pattern");
 
figure;
pattern(antenna,freq,0,0:1:360);
title("Gain");
 
figure;
pattern(antenna,freq,0:1:360,0);
title("Directivity");
