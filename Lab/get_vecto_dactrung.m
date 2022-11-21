%tinh toan vecto dac trung tu nguyen am HL
function VT_dactrung = get_vecto_dactrung(folder,frequency,filename)
HL_folders = get_folder(folder); %lay cac folder con
tong = 0;
for i = 1:length(HL_folders)
    FFT_vt = get_FFT_vector(folder + '\' + HL_folders(i) + '\' + filename + '.wav',frequency);
    tong = tong + FFT_vt;
end
res_dt(:) = tong / length(HL_folders);
VT_dactrung = res_dt;
end
