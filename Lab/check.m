%kiem tra va dua ra ket qua nhan dang
function [idx,real] = check(file_kt,folder_hl,frequency)
files = ["a","e","i","o","u"];
file_FFT = get_FFT_vector(file_kt,frequency);
E_Distance = [0,0,0,0,0];
for i = 1:length(files)
    E_Distance(i) = norm(file_FFT - get_vecto_dactrung(folder_hl,frequency,files(i)));
end
min_value = min(E_Distance);
idx = find(abs(E_Distance-min_value)<0.000000001);
[filepath,name,ext] = fileparts(file_kt);
real = find(contains(files,name));
end