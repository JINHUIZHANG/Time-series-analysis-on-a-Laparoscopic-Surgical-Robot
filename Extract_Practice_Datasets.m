%Extract practice datasets
close all
test = [1,2,3,4,5];
Test = [];
for i = 0:11
    temp = test + 15*i;
    Test = [Test,temp];
end
for i = 1:length(Test)
    ID = num2str(Test(i));
    open(strcat(ID,'.fig'))
    path = 'E:\Study\Data\Plots\PlotAll_Practice\'
    filename = strcat(path,num2str(i),'.fig');
    save(filename);
end
