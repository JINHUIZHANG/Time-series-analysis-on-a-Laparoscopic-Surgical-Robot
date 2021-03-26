clear all
close all
load('E:\Study\Data\Data_180\data_filter_180_carti')
%% period-based cleaning
for i = 1:180
    len(i) = length(data_filter{i,1});
end
[len_sort,ID] = sort(len);
% data_filter_sort = cell(size(data_filter));
for i =1:180
    data_filter_sort{i,1} = data_filter{ID(i),1};
end
figure
histogram (len_sort,180) 
savefig('E:\Study\Data\Clean\histogram.fig')
% select (last 1 before first 2) to (first 1 after last 2) (3:end-10)
for i = 3:170
    data_clean{i-2,1} = data_filter_sort{i,1};
end
save('E:\Study\Data\Clean\data_sort.mat','data_filter_sort','ID')
save('E:\Study\Data\Clean\data_clean.mat','data_clean')
%% feature-based cleaning
% data_clean plot and output
method = 'spline'; % If x is not slowly varying, consider using interp1 with the 'pchip' interpolation method
num = length(data_clean{end,1});
set(0,'DefaultFigureWindowStyle','docked')
for j = 1:10
    figure;
    for i = 1:length(data_clean)
        x = data_clean{i,1}(:,1);
        y = data_clean{i,1}(:,j+1);
        xi = linspace(data_clean{i,1}(1,1),data_clean{i,1}(end,1),num);
        yi{i,1}(:,j) = interp1(x,y,xi,method);
        plot(yi{i,1}(:,j))
        hold on
    end
    name = strcat('E:\Study\Data\Plots\Plot_Parameters_aligned\',num2str(j),'.fig');
    data_align = yi;
    save('E:\Study\Data\Clean\data_align.mat','data_align')
    savefig(name);
end
% find outliers ID
outliers = [4,2973,5.8101;5,1093,3.2895;5,2251,2.9785;6,3282,29.7506;10,3282,-2.4546;...
            1,418,47.9485;1,1233,46.9188;1,1783,-45.366;1,4340,-46.7893;1,4847,-40.942;1,5094,-32.4564;...
            2,1143,105.5996;7,502,76.8839;9,2780,-0.79018];
ID_outliers = [];
for i = 1:length(data_align)
    for j = 1: length(outliers)
        if abs(data_align{i,1}(outliers(j,2),outliers(j,1))-outliers(j,3)) < 0.0001
            ID_outliers = [ID_outliers,i];
        end
    end
end
% feature-based cleaning
Temp = 0;
for i = 1:length(data_clean)
    if not(ismember(i,ID_outliers))
        Temp = Temp+1;
        data_clean_final{Temp,1} = data_clean{i,1}(1:end-1,:); %remove the last row due to previous resampling
    end
end
save('E:\Study\Data\Clean\data_clean_160.mat','data_clean_final','ID_outliers')
% data_clean_final plot and output
method = 'spline'; % If x is not slowly varying, consider using interp1 with the 'pchip' interpolation method
num = length(data_clean_final{end,1});
set(0,'DefaultFigureWindowStyle','docked')
for j = 1:10
    figure;
    for i = 1:length(data_clean_final)
        x_final = data_clean_final{i,1}(:,1);
        y_final = data_clean_final{i,1}(:,j+1);
        xi_final = linspace(data_clean_final{i,1}(1,1),data_clean_final{i,1}(end,1),num);
        yi_final{i,1}(:,j) = interp1(x_final,y_final,xi_final,method);
        plot(yi_final{i,1}(:,j))
        hold on
    end
    name = strcat('E:\Study\Data\Plots\Plot_Parameters_aligned\',num2str(j),'_final.fig');
    data_align_final = yi_final;
    save('E:\Study\Data\Clean\data_align_final.mat','data_align_final')
    savefig(name);
end
% % recover plot
% set(0,'DefaultFigureWindowStyle','normal')