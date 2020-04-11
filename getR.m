function R = getR(N,N0,recordName)

gqrs(recordName,N);
ann=rdann(recordName,'qrs',[],N);
[signal,~,tm]=rdsamp(recordName,[],N,N0,2);
sig = signal(:,1);
% figure();
% plot(tm,sig);hold on;grid on

QRS = zeros(length(ann),3);
QRSPlot = zeros(3*length(ann),1);
XQRSPlot = zeros(3*length(ann),1);
for i=1:1:length(ann)
    count = ann(i)-1;
    j=1;
    while j<4 
        if j==1 && sig(count+1)>=sig(count)&&sig(count+1)<sig(count+2)% 确保循环开始时位置在q前面
            count = count - 1;
        else
            count = count + 1;
        end
        if (sig(count+1)>sig(count)&&sig(count+1)>=sig(count+2))||(sig(count+1)<sig(count)&&sig(count+1)<=sig(count+2))% 选取极大极小值
            QRS(i,j) = sig(count+1);
            QRSPlot((i-1)*3+j,1) = sig(count+1);
            XQRSPlot((i-1)*3+j,1) = tm(count+1);
            if sig(count+1)==sig(count+2)
            	count = count+1;
            end
            j = j+1;
        end
    end
end
% plot(XQRSPlot,QRSPlot,'o');
R = zeros(length(QRS),2);
for i=1:1:length(QRS)
	R(i,1) = max(QRS(i,1:3));
    if QRS(1) == max(QRS(i,1:3))
        R(i,2) = XQRSPlot(3*(i-1)+1,1);
    elseif QRS(2) == max(QRS(i,1:3))
        R(i,2) = XQRSPlot(3*(i-1)+2,1);
    else
        R(i,2) = XQRSPlot(3*i,1);
    end
end
% plot(R(1:length(R),2),R(1:length(R),1),'ro');
end