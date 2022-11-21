%tinh toan vecto FFT cua 1 file bat ki
function FFT_vector=get_FFT_vector(file,frequency)
[x,Fs]=audioread(file);
N=length(x);	%do dai tin hieu
%Cai dat frame
frame_d = 0.02;
frame_s = round(frame_d*Fs);
frame_N = floor(N/frame_s);
%chia frame
temp = 0;
for k = 1:frame_N
	frames(k,:)=x(temp+1:temp+frame_s);
	temp=temp+frame_s;
end
%goi ham tinh ste
[loca_sp] = ste(x,0.007,frame_d,frame_s,frame_N,frames);
star_=loca_sp(1)-frame_d;
end_=loca_sp(length(loca_sp));
center_1=star_+(end_-star_)/3;
center_2=star_+2*(end_-star_)/3;
M(:)=round(center_2/frame_d)-round(center_1/frame_d);
tong = 0;
for k=round(center_1/frame_d):round(center_2/frame_d)-1
        x1=frames(k,:);
        var_fft(:)=fft(x1,frequency);
        tong = tong + var_fft(:);
end
res_vector(:) = tong(:)/M(:);
FFT_vector = res_vector;
end