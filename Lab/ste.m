function [loca_sp]=ste(x,nguong,frame_d,frame_s,frame_N,frames)
%% tinh ste
ste=zeros(1,frame_N); 
for i=1:frame_N
    ste(i)=sum(frames(i,:).^2);
end 

%% phan biet speech va slience
% nguong phan biet speech va slience
id=find(ste>=nguong);   % cac khung thoa man la tieng noi
id_sp=id(1);                          % vi tri cua khung bat dau tieng noi
n=2;
for i=2:length(id)
    if(id(i)-id(i-1)>=0.3)                
         id_sp(n)=id(i-1);              % vi tri cua khung ket thuc doan tieng noi truoc     
         id_sp(n+1)=id(i);              % vi tri cua khung bat dau doan tieng noi sau
         n=n+2;
    end
 end
id_sp(n)=id(i);                         % vi tri cua khung ket thuc doan tieng noi cuoi cung
loca_sp=frame_d/1*id_sp;                % vi tri khung speech theo thoi gian

















