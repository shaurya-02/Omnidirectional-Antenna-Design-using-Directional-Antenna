clc;
clearvars;
freq=2.44e9;
 
yogi=yagiUda('numDirectors',15);
yagi=design(yogi,freq);
 
figure;
show(yagi);
 
figure;
pattern(yagi,freq);
title("Radiation Pattern");
 
figure;
pattern(yagi,freq,0,0:1:360);
title("Gain");
 
figure;
pattern(yagi,freq,0:1:360,0);
title("Directivity");

