## Deployment
To access NUS High Performance Computing (HPC), please refer to "Introduction of using HPC for Deep Learning on Windows.pdf" and "submission_example.pbs".

## Datasets  
This datasets are extracted from IRAS trajectory replay data. To use this dataset, please cite "T. Yang, W. Huang, C. K. Chui, Z. Jiang and L. Jiang, "Stacked hidden Markov model for motion intention recognition," 2017 IEEE 2nd International Conference on Signal and Image Processing (ICSIP), Singapore, 2017, pp. 266-271, doi: 10.1109/SIPROCESS.2017.8124546."     
The extracted datasets includes both 120 groups and 180 groups. 120 (initial preparation groups excluded) and 180 groups (initial preparation groups included) are extracted from .MAT file.
For 120 and 180 groups, both Cartisian and Spherical coordinate systems are included.
For Cartisian, the columns are as follows: Time stamp, X_left, Y_left, Z_left, Roll_left, Handle_left, X_right, Y_right, Z_right, Roll_right, Handle_right, tool_ID;  
For Spherical, the columns are as follows: Time stamp, Pitch_left, Yaw_left, Roll_left, Depth_left, Handle_left, Pitch_right, Yaw_right, Roll_right, Depth_right, Handle_right.
Run "extract_data.m" to extract both 120 groups and 180 groups of raw datasets.

## Plots  
The plot results consist of both Cartisian and Spherical. Cartisian_3dPlot includes X-Y-Z 3D-trajectory plots.   
### Cartisian
For Cartisian, the plots results are as follows:  
(2,5,1): X_left-timestamp;  
(2,5,2): Y_left-timestamp;   
(2,5,3): Z_left-timestamp;   
(2,5,4): Roll_left-timestamp;   
(2,5,5): Handle_left-timestamp;   
(2,5,6): X_right-timestamp;   
(2,5,7): Y_right-timestamp;   
(2,5,8): Z_right-timestamp;     
(2,5,9): Roll_right-timestamp;   
(2,5,10): Handle_right-timestamp;   
### Spherical
For Spherical, the plots results are as follows:  
(2,5,1): Pitch_left-timestamp;   
(2,5,2): Yaw_left-timestamp;   
(2,5,3): Roll_left-timestamp;   
(2,5,4): Depth_left-timestamp;   
(2,5,5): Handle_left-timestamp;   
(2,5,6): Pitch_right-timestamp;   
(2,5,7): Yaw_right-timestamp;   
(2,5,8): Roll_right-timestamp;   
(2,5,9): Depth_right-timestamp;   
(2,5,10): Handle_right-timestamp;

## Preprocessing 
Based on 180 groups of raw datasets, the preprocessings are resampling, filtering, clean, and normalization. Finally, "data_norm_160.mat" are adopted for further experiments.
   
### Resampling
Run "resampling.m"  
Input: "data_raw_180.mat"  
Output: "data_resample_180.mat"  
### Filtering
Run "lowpassfilterV2.m"  
Input: "data_resample_180.mat"  
Output: "data_filter_180.mat"  
### Clean
Run "clean.m"  
Input: "data_filter_180.mat"  
Output: "data_clean_160.mat"  
### Normalization
Run "normalization.m"  
Input: "data_clean_160.mat"  
Output: "data_norm_160.mat"  

## Classification
Run "classification_LSTM.m"  
Input: "data_norm.mat"
Result: ![alt text](https://github.com/JINHUIZHANG/Time-series-analysis-on-a-Laparoscopic-Surgical-Robot/blob/main/Classification/classification_lstm.png)

## Prediction
Run "prediction_LSTM.py"  
Input: "data_norm_160.mat"  
Result: ![alt text](https://github.com/JINHUIZHANG/Time-series-analysis-on-a-Laparoscopic-Surgical-Robot/blob/main/Prediction/prediction_train_validation_loss_lstm.PNG)
