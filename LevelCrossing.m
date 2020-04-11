function lc = LevelCrossing(vals,x,levelGap)
% transmit signal from evenly distribute to level-crossing one
% return level-crossing data and time 

% I need the level of the first signal as a parameter to judge whether the
% level-crossing happen or not
level = vals(1);
levelCross = zeros(length(vals),2);% initial
count = 1;% count the length of level-crossing signal
for i=2:1:length(vals)
    if abs(vals(i)-level)>levelGap % if level-crossing happen
        temp = vals(i);% just to make it looks better
        if temp>level
            level = vals(i);% level->current level
            levelCross(count,1) = 1;% for up-crossing
            levelCross(count,2) = x(i);% record time
            count = count+1;% count+1
        else
            level = vals(i);
            levelCross(count,1) = 0;% for down-crossing
            levelCross(count,2) = x(i);
            count = count+1;
        end
        if x==82
            
        end
    end
end

lc = zeros(count-1,2);% get the record
lc(1:count-1,1) = levelCross(1:count-1,1);
lc(1:count-1,2) = levelCross(1:count-1,2);


end