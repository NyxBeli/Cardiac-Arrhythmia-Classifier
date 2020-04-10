N=500;
N0 = [];
gqrs('./mitdb/100',N,N0);
ann=rdann('./mitdb/100','qrs',[],N,N0);
[signal,Fs,tm]=rdsamp('./mitdb/100',[],N,N0,2);
sig = signal(:,1);
figure();
plot(tm,sig);hold on;grid on

QRS = zeros(length(ann),3);
QRSPlot = zeros(3*length(ann),1);
XQRSPlot = zeros(3*length(ann),1);
for i=1:1:length(ann)
    count = ann(i)-1;
    j=1;
    upOrDown = 0;
    while j<4 
        
        if j==1 && sig(count+1)>=sig(count)&&sig(count+1)<sig(count+2)% 确保循环开始时位置在q前面
            disp(count)
            count = count - 1;
            upOrDown = 0;
        else
            count = count + 1;
            upOrDown = 1;
        end
        if (sig(count+1)>sig(count)&&sig(count+1)>=sig(count+2))||(sig(count+1)<sig(count)&&sig(count+1)<=sig(count+2))% 选取极大极小值
            QRS(i,j) = sig(count+1);
            QRSPlot((i-1)*3+j,1) = sig(count+1);
            XQRSPlot((i-1)*3+j,1) = tm(count+1);
%             if sig(count+1)==sig(count+2) % && upOrDown~=1
%             	count = count+1;
%             end
            j = j+1;
        end
    end
end
plot(XQRSPlot,QRSPlot,'o');
hold off;
R = zeros(length(QRS),1);
levelInitial = zeros(length(QRS),1);
exception = zeros(length(QRS),1);
count = 1;
for i=1:1:length(QRS)
	R(i,1) = max(QRS(i,1:3));
end
