## Experimental Datasets
After twice clean (period-based and features-based) based on 180 groups, 160 groups are finally used for experiments. To adapt for training, normalization is performed using "Min_Max_Scale". The "min" and "max" are delibrately settled based on knowledge and statistics.

## Data description  
Dataset includes three folders: 117, 120, and 180. 117 groups are directly extracted from replaydata of trajectory (3 replaydatas are missed); 120 (initial preparation groups excluded) and 180 groups (initial preparation groups included) are extracted from .MAT file.
For 120 and 180 groups, both Cartisian and Spherical coordinate systems are considerated.  
For Cartisian, the columns are as follows: Time stamp, X_left, Y_left, Z_left, Roll_left, Handle_left, X_right, Y_right, Z_right, Roll_right, Handle_right, tool_ID;  
For Spherical, the columns are as follows: Time stamp, Pitch_left, Yaw_left, Roll_left, Depth_left, Handle_left, Pitch_right, Yaw_right, Roll_right, Depth_right, Handle_right.

## Plot description  
The plot results consist of both Cartisian and Spherical. Cartisian_3dPlot includes X-Y-Z 3D-trajectory plots.   

For Cartisian,the plots results are as follows:  
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

For Spherical,the plots results are as follows:  
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
