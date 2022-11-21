%ve vector tren do thi
function draw_via_fre(folders, frequency)
files=["a","e","i","o","u"];
color=['r','y','g','m','c'];
array = get_vecto_dactrung(folders,frequency,files(1));
for i = 2:length(files)
    array = cat(1,array,get_vecto_dactrung(folders,frequency,files(i)));
end
figure('Name',frequency + "Hz",'NumberTitle','off');
hold on;
for i=1:length(files)
    plot(abs(array(i,:)),color(i));
end
hold off;
legend("a","e","i","o","u");
end