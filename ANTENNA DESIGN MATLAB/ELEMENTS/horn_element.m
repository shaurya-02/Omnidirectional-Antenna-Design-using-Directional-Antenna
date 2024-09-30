clc;
clearvars;
 
freq=2.44e9;
 
h=horn('FlareLength',0.634,'FlareWidth',0.532,'FlareHeight',0.355,'Length',0.104,'Width',0.0921,'Height',0.0461,'FeedHeight',0.0269);
antenna=design(h,freq);
 
figure;
show(antenna);
 
figure;
pattern(antenna,freq);
title("Radiation Pattern");
 
figure;
title("Gain");
pattern(antenna,freq,0,0:1:360);

 
figure;
title("Directivity");
pattern(antenna,freq,0:1:360,0);

