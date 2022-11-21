clear;
path_hl = "C:\Users\ADMIN\Desktop\Lab\data\NguyenAmHuanLuyen-16k";
path_kt = "C:\Users\ADMIN\Desktop\Lab\data\NguyenAmKiemThu-16k";
%thay the duong dan thanh cac folder thich hop, chu y bo dau / o duoi
N_FFT = [512,1024,2048];
c = cell(1,3);
success = [0.0,0.0,0.0];
for i=1:3
    draw_via_fre(path_hl,N_FFT(i));
    c{i} = compare_via_fre(path_kt,path_hl,N_FFT(i));
    success(i) = rate(c{i});
end
fprintf('Do chinh xac nhan dang tong hop nguyen am:\n')
for i=1:3
    fprintf('Tan so %dHz: %0.2f %%\n',N_FFT(i),success(i)*100);
end
max_rate_idx = find(abs(success-min(success))<0.0000001);
idx = max_rate_idx(1);
fprintf('Ma tran nham lan cua truong hop co do chinh xac tong hop cao nhat (%dHz):\n',N_FFT(idx));
[r, co] = size(c{idx});
for i = 1:r
    for j =1:co
        fprintf('%d\t',c{idx}(i,j));
    end
    fprintf('\n');
end



