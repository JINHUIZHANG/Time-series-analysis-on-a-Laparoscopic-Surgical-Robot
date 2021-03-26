function resampling(dataname)
% Require Signal Processing Toolbox, DSP System Toolbox
% clear all;
% f = load('E:\Study\Data\Data_180\rawdata_180');
% data = f.data_carti_180;
for i = [1:length(dataname)]
    % avoid interpolation error between tool 4 and tool 2, use subtasks_label instead
    temp1 = find((dataname{i,1}(:,end))==5);
    temp2 = find((dataname{i,1}(:,end))==3);
    temp3 = find((dataname{i,1}(:,end))==4);
    temp4 = find((dataname{i,1}(:,end))==2);
    label = dataname{i,1}(:,end);
    label(temp1)=1;
    label(temp2)=2;
    label(temp3)=3;
    label(temp4)=4;
    [~,columns] = size(dataname{i,1});
    if columns == 12;
    [data_resample{i,1},timestamp]=resample(dataname{i,1}(:,2:end-1),dataname{i,1}(:,1)/1000,10);
    Timestamp=round(1000*timestamp);
    Label=round(resample(label,dataname{i,1}(:,1)/1000,10));
    Data_resample{i,1}=[Timestamp(:,:),data_resample{i,1}(:,:),Label];
    else
            [data_resample{i,1},timestamp]=resample(dataname{i,1}(:,2:end),dataname{i,1}(:,1)/1000,10);
            Timestamp=round(1000*timestamp);
            Data_resample{i,1}=[Timestamp(:,:),data_resample{i,1}(:,:)];
    end
end
[file,name] = uiputfile('E:\Study\Data\','Data_resample','*.mat');
save(fullfile(name,file),'Data_resample');

