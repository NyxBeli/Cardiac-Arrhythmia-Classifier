function RR = getbits(interval)
% change the interval into binary vector

RR = zeros(11,1);
strint = dec2bin(interval,11);
for k = 1:11
    RR(k,1) = str2double(strint(k));
end

end