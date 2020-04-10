[vals, freqint, x] = rdsamp('mitdb/100',[],360,1,4);% read data
[vals1, freqint1, x1] = rdsamp('mitdb/100',1,360,1,2);% read data
levelGap = 20/(2^11);% 20/(2^11);% set gap
signal = vals(1:360,1);
[lc,lcTime] = LevelCrossing(signal,x,levelGap);% get level-crossing signal
