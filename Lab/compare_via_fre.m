%tong hop bang ma tran nham lan
function result = compare_via_fre(folder_kt,folder_hl,frequency)
files = ["a","e","i","o","u"];
array = zeros(5,5);
folders = get_folder(folder_kt);
for i=1:length(folders)
    for j=1:length(files)
        [idx,real] = check(folder_kt + "\" + folders(i) + "\" + files(j) + ".wav",folder_hl,frequency);
        array(real,idx) = array(real,idx) + 1;
    end
end
result = array;
end