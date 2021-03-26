## Raw Datasets Description  
Raw datasets includes 120 and 180. 120 (initial preparation groups excluded) and 180 groups (initial preparation groups included) are extracted from .MAT file.

For 120 and 180 groups, both Cartisian and Spherical coordinate systems are included.
For Cartisian, the columns are as follows: Time stamp, X_left, Y_left, Z_left, Roll_left, Handle_left, X_right, Y_right, Z_right, Roll_right, Handle_right, tool_ID;  
For Spherical, the columns are as follows: Time stamp, Pitch_left, Yaw_left, Roll_left, Depth_left, Handle_left, Pitch_right, Yaw_right, Roll_right, Depth_right, Handle_right.

## Plots Description  
The plot results consist of both Cartisian and Spherical. Cartisian_3dPlot includes X-Y-Z 3D-trajectory plots.   

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

## NUS HPC Description
To access NUS High Performance Computing, please refer to "Introduction of using HPC for Deep Learning on Windows.pdf" and "submission_example.pbs".

## Preprocessing Description
Based on 180 groups of raw datasets, the preprocessings are resampling, filtering, cleaning, and normalization. Finally, "data_norm_160.mat" are adopted for further experiments.

Pipeline: "data_raw_180.mat"->"data_resample_180.mat"->"data_filter_180.mat"->"data_clean_160.mat"->"data_norm_160.mat" 
  
