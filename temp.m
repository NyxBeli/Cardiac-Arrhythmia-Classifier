clc;clear;
N = 5000;
N0 = [];
recordName = 'mitdb/100';
[vals, freqint, x] = rdsamp(recordName,[],N,N0,2);% read data
% [vals1, freqint1, x1] = rdsamp('mitdb/100',1,360,1,2);% read data
levelGap = 20/(2^11);% 20/(2^11);% set gap
signal = vals(1:N,1);
lc = LevelCrossing(signal,x,levelGap);% get level-crossing signal
R = getR(N,N0,recordName);
bits = zeros(96,length(R)-2);
for i=2:1:length(R)-1
    interval01 = (R(i,2)-R(i-1,2))/0.001;
    interval12 = (R(i+1,2)-R(i,2))/0.001;
    RR1 = getbits(interval01);
    RR2 = getbits(interval12);
    j = 1;
    match = 1;
    while j<=length(lc) && match
        if lc(j,2) == R(i,2)
            for count = 1:37
                bits(22+count,i-1) = lc(j-38+count,1);
                bits(59+count,i-1) = lc(j+count,1);
            end
        end
        j = j+1;
    end
end