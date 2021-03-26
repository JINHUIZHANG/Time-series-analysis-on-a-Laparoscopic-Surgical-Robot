clear all;
load('data_norm.mat');
% data preparation
for k =1
    epoch_test = [180];
A = [1:97];
idx_test = randi([1,97],1,10);
Lia = ismember(A,idx_test);
t = ~Lia;
answer = A.*t;
idx_train = [answer(find(answer~=0)),101:120];
for i = 1:10
    data_test{i,1}=[Left_norm{idx_test(i),1}(:,2:end),-Right_norm{idx_test(i),1}(:,2:end)];
    data_test{i,1}=data_test{i,1}';
    label_test{i,1}=Tool_ID_right{idx_test(i),1}';
    label_test{i,1} = categorical(label_test{i,1},[1 2 3 4],{'subtask1' 'subtask2' 'subtask3' 'subtask4'});
end
for i = 1:107
    data_train{i,1}=[Left_norm{idx_train(i),1}(:,2:end),-Right_norm{idx_train(i),1}(:,2:end)];
    data_train{i,1}=data_train{i,1}';
    label_train{i,1}=Tool_ID_right{idx_train(i),1}';
    label_train{i,1} = categorical(label_train{i,1},[1 2 3 4],{'subtask1' 'subtask2' 'subtask3' 'subtask4'});
end
save('data_LTSM','data_train','label_train','data_test','label_test')
% Network Architecture
numFeatures = 10;
numHiddenUnits = 200;
numClasses = 4;

layers = [ ...
    sequenceInputLayer(numFeatures)
    lstmLayer(numHiddenUnits,'OutputMode','sequence')
    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer];
% Network training
options = trainingOptions('adam', ...
    'MaxEpochs',epoch_test(k), ...
    'GradientThreshold',1, ...
    'InitialLearnRate',0.005, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropPeriod',125, ...
    'LearnRateDropFactor',0.2, ...
    'Verbose',0, ...
    'MiniBatchSize',120,...
    'ExecutionEnvironment','cpu',...
    'Plots','training-progress');
    disp('LSTM architect successfully created.');
net = trainNetwork(data_train,label_train,layers,options);
%% LSTM evaluation
Pred = classify(net,data_test);
for i = 1:10
    acc(i) = sum(Pred{i,1} == label_test{i,1})./numel(label_test{i,1});
    figure(i+30)
    plot(Pred{i,1},'.-')
    hold on
    plot(label_test{i,1})
    hold off
    xlabel('Time Step')
    ylabel('Activity')
    title('Predicted Activities')
    legend(['Predicted','Test Data'])
    str = num2str(i+10*k);
    savefig(strcat('FigureV5',str));
end
mu_test(k) = mean(acc)
std_test(k) = std(acc)
save(strcat('LTSM_classificationV5',num2str(k)));
end