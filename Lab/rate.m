%tinh do chinh xac nhan dien tong hop
function result = rate(data)
correct = 0;
for i=1:5
    correct = correct + data(i,i);
end
result = correct/105;
end