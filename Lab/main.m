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
[r, co] = size(c{idx});
max_cor = 1;
for i=2:r
    if(c{idx}(i,i)>c{idx}(max_cor,max_cor)) 
        max_cor = i;
    end
end
max_wrong = [1,2];
for i = 1:r
    for j =1:co
        if(i~=j)
            if(c{idx}(i,j)>c{idx}(max_wrong(1,1),max_wrong(1,2)))
                max_wrong(1,1) = i;
                max_wrong(1,2) = j;
            end
        end
    end
end
fprintf('Ma tran nham lan cua truong hop co do chinh xac tong hop cao nhat (%dHz):\n',N_FFT(idx));
for i = 1:r
    for j =1:co
        if(i==max_cor&j==max_cor)
            cprintf('*green','%d\t',c{idx}(i,j));
        elseif(i==max_wrong(1,1)&j==max_wrong(1,2))
            cprintf('*red','%d\t',c{idx}(i,j));
        else
            fprintf('%d\t',c{idx}(i,j));
        end
    end
    fprintf('\n');
end


