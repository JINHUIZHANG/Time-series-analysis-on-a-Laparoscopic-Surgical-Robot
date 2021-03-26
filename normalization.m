load('E:\Study\Data2\Clean\data_clean_160.mat')
min_max_final = [-21, 41, -12, 85, -5.8, 112, -0.20, 4.0, -0.25, 2.2, -76, 9.9, -80, 55, -13, 110, -0.26, 2.6, -0.29, 2.5]; %knowledge-based
min = min_max_final(1:2:end);
max = min_max_final(2:2:end);
data_norm = data_clean_final;
for i = 1:length(data_clean_final)
    for j = 1:10
        data_norm{i,1}(:,j+1) = (data_clean_final{i,1}(:,j+1)-min(j))/(max(j)-min(j));
    end
end
save('E:\Study\Data2\norm\data_norm_160.mat','data_norm')