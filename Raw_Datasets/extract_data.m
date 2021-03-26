% Extract data from .MAT
clear all
path = 'F:\OneDrive\HMM\to NUS student Jinhui\data\Raw data_yangtao\';
idx1{1,1}='A01';
idx1{2,1}='A02';
idx1{3,1}='A03';
idx1{4,1}='A04';
idx1{5,1}='A05';
idx1{6,1}='A06';
idx1{7,1}='B01';
idx1{8,1}='B02';
idx1{9,1}='B03';
idx1{10,1}='B04';
idx1{11,1}='B05';
idx1{12,1}='B06';
idx2{1,1} = 'featuresP01.mat';
idx2{2,1} = 'featuresP02.mat';
idx2{3,1} = 'featuresP03.mat';
idx2{4,1} = 'featuresP04.mat';
idx2{5,1} = 'featuresP05.mat';
idx2{6,1} = 'featuresT01.mat';
idx2{7,1} = 'featuresT02.mat';
idx2{8,1} = 'featuresT03.mat';
idx2{9,1} = 'featuresT04.mat';
idx2{10,1} = 'featuresT05.mat';
idx2{11,1} = 'featuresT06.mat';
idx2{12,1} = 'featuresT07.mat';
idx2{13,1} = 'featuresT08.mat';
idx2{14,1} = 'featuresT09.mat';
idx2{15,1} = 'featuresT10.mat';

% 180 groups (practice included)
num = 0;
for m = 1:length(idx1)
    for n = 1:length(idx2)
        file = strcat(path,idx1{m,1},'\',idx2{n,1});
        f = load(file);
        num = num+1;
        data_carti_180{num,1} = [f.carti_left(:,:),f.carti_right(:,2:end),f.tool_ID_right(:,1)];
        data_spherical_180{num,1} = [f.spherical_left(:,:),f.spherical_right(:,2:6)];
        m,n,size(data_carti_180{num,1}),size(data_spherical_180{num,1})
        clear ('f','file');
    end
end
save('E:\Study\Data\data_raw_180.mat','data_carti_180','data_spherical_180');

% 120 groups (practice excluded)
num = 0;
for m = 1:length(idx1)
    for n = 6:length(idx2)
        file = strcat(path,idx1{m,1},'\',idx2{n,1});
        f = load(file);
        num = num+1;
        data_carti_120{num,1} = [f.carti_left(:,:),f.carti_right(:,2:end),f.tool_ID_right(:,1)];
        data_spherical_120{num,1} = [f.spherical_left(:,:),f.spherical_right(:,2:6)];
        m,n,size(data_carti_120{num,1}),size(data_spherical_120{num,1})
        clear ('f','file');
    end
end
save('E:\Study\Data\data_raw_120.mat','data_carti_120','data_spherical_120');
                
                




