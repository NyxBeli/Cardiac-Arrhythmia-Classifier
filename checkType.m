PATH = 'E:\final_project\material\type counts.xls';
[num,txt,raw]=xlsread(PATH);
fileDir = 'E:\final_project\code\FinalProject2020\ANNOT';
nameList = dir([fileDir '\*ANNOT.mat']);
counts = zeros(length(nameList), 6);
for i = 1:length(nameList)
    fileName = nameList(i).name;
    beats = load([fileDir '\' fileName]);
    ANNOT = beats.ANNOT;
    ATRTIME = beats.ATRTIME;
    N = 0;  % N=N+R+L+j
    S = 0;  % S=A+a+J+S
    V = 0;  % V=V+E
    F = 0;  % F=F
    Q = 0;  % Q=Q
    for j = 1:length(ANNOT)
        if ANNOT(j) == 1 || ANNOT(j) == 2 || ANNOT(j) == 3 || ANNOT(j) == 11
            N = N + 1;
        elseif ANNOT(j) == 4 || ANNOT(j) == 7 || ANNOT(j) == 8 || ANNOT(j) == 9
            S = S + 1;
        elseif ANNOT(j) == 5 || ANNOT(j) == 10
            V = V + 1;
        elseif ANNOT(j) == 6
            F = F + 1;
        elseif ANNOT(j) == 13
            Q = Q + 1;
        end
    end
    counts(i,1) = str2num(fileName(1:3));
    counts(i,2) = N;
    counts(i,3) = S;
    counts(i,4) = V;
    counts(i,5) = F;
    counts(i,6) = Q;
    filename = (['E:\final_project\code\FinalProject2020\ANNOT\typeCounts']);
    save(filename,'counts');
end
 