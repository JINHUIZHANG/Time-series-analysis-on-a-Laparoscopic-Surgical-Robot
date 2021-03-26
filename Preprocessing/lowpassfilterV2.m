function lowpass_filterV2(input_data_resample)
fc = 1.6; % cutoff frequency of 1.6 Hz from frequency_analysis
fs = 10; % sampling frequency of 10 Hz
[b,a] = butter(8,fc/(fs/2));
% figure
% freqz(b,a) % plot the filter
for i = 1:length(input_data_resample)
    [~,columns] = size(input_data_resample{i,1});
    data_filter{i,1}(:,1) = input_data_resample{i,1}(:,1);
    for j = 2:columns-1
    data_filter{i,1}(:,j) = filter(b,a,input_data_resample{i,1}(:,j));
    end
    data_filter{i,1}(:,columns) = input_data_resample{i,1}(:,end);
%     temp3 = input_data_resample{i,1}(:,end);
%     data_filter{i,1} = [temp1,temp2,temp3];
%     clear {'temp1','temp2','temp3')
end
[file,name] = uiputfile('E:\Study\Data\','data_filter','*.mat');
save(fullfile(name,file),'data_filter');