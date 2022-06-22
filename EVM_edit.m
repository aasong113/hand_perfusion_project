% amplify_spatial_lpyr_temporal_butter(vidFile, outDir, alpha, lambda_c, 
%                                      fl, fh, samplingRate, chromAttenuation)
% 
% Spatial Filtering: Laplacian pyramid
% Temporal Filtering: substraction of two butterworth lowpass filters
%                     with cutoff frequencies fh and fl
% 
% Copyright (c) 2011-2012 Massachusetts Institute of Technology, 
% Quanta Research Cambridge, Inc.
%
% Authors: Hao-yu Wu, Michael Rubinstein, Eugene Shih, 
% License: Please refer to the LICENCE file
% Date: June 2012
%


dataDir = './data';
resultsDir = 'ResultsSIGGRAPH2012';

mkdir(resultsDir);


%% 
inFile = fullfile('nick3.tif');
% inFile = fullfile('IMG_1069.mp4');
fprintf('Processing %s\n', inFile);

%% for tif videos
% last input is frame per second change for each video!!!
fr=30;
for K = 1 :  length(imfinfo(inFile))
         rawframes(:,:,:,K) = imread(inFile, K);
end  
% amplify_butter(inFile, resultsDir, 60, 90, 3.6, 6.2, 30, 0.3, fr);

amplify_spatial_Gdown(inFile,resultsDir, rawframes,  150, 6, 60/60,100/60,30, 1, fr);

%amplify_lpyr_butter(inFile,resultsDir,20,80, 0.5,10,30, 0, 30);

%% for avi videos
% amplify_spatial_lpyr_temporal_butter(inFile, resultsDir, 60, 90, 3.6, 6.2, 30, 0.3)
%amplify_spatial_Gdown_temporal_ideal(inFile,resultsDir,50,4,50/60,60/60,30, 1);

