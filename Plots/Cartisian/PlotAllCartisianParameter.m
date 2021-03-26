%%
clear all
load('data_filter_120_carti.mat');
all_data = data_filter;
close all
for i = 1:length(all_data)
        figure('units','normalized','outerposition',[0 0 1 1])
        subplot(2,2,1);
        plot3(all_data{i,1}(:,2),all_data{i,1}(:,3),all_data{i,1}(:,4));
        title('Left-X-Y-Z');
        subplot(2,2,2);
        plot3(all_data{i,1}(:,7),all_data{i,1}(:,8),all_data{i,1}(:,9));
        title('Right-X-Y-Z');
        subplot(2,2,3);
        plot(all_data{i,1}(:,1),all_data{i,1}(:,5),all_data{i,1}(:,1),all_data{i,1}(:,6));
        title('Left-Roll-Handle');
        legend('Roll','Handle');
        subplot(2,2,4);
        plot(all_data{i,1}(:,1),all_data{i,1}(:,10),all_data{i,1}(:,1),all_data{i,1}(:,11));
        title('Right-Roll-Handle');
        legend('Roll','Handle');
        ID = num2str(i);
        DataType = num2str(length(all_data));
        figurename = strcat('/home/svu/e0343933/Jinhui/results','/Cartisian','_',DataType,'/',ID,'.fig');
        savefig(figure,figurename);
        close;
end
%%
clear all
load('data_filter_180_carti.mat');
all_data = data_filter;
close all
for i = 1:length(all_data)
        figure('units','normalized','outerposition',[0 0 1 1])
        subplot(2,2,1);
        plot3(all_data{i,1}(:,2),all_data{i,1}(:,3),all_data{i,1}(:,4));
        title('Left-X-Y-Z');
        subplot(2,2,2);
        plot3(all_data{i,1}(:,7),all_data{i,1}(:,8),all_data{i,1}(:,9));
        title('Right-X-Y-Z');
        subplot(2,2,3);
        plot(all_data{i,1}(:,1),all_data{i,1}(:,5),all_data{i,1}(:,1),all_data{i,1}(:,6));
        title('Left-Roll-Handle');
        legend('Roll','Handle');
        subplot(2,2,4);
        plot(all_data{i,1}(:,1),all_data{i,1}(:,10),all_data{i,1}(:,1),all_data{i,1}(:,11));
        title('Right-Roll-Handle');
        legend('Roll','Handle');
        ID = num2str(i);
        DataType = num2str(length(all_data));
        figurename = strcat(/home/svu/e0343933/.ssh/Jinhui/results,'/Cartisian','_',DataType,'/',ID,'.fig');
        savefig(figure,figurename);
        close;
end
