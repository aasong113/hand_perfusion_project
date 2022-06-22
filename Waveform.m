% clear all
%%
%save_path = 'GrayVersionVideo';
%Focus on patients 42 41 39
%path_EVM = 'ResultsSIGGRAPH2012';
path_EVM = '/Users/Durr Lab/Desktop/Naomi/EVM_Matlab/ResultsSIGGRAPH2012';
% file_name_EVM = '06061-ideal-from-0.83333-to-1-alpha-50-level-6-chromAtn-1.avi';
file_name_EVM = 'nick3-ideal-from-1-to-1.6667-alpha-150-level-6-chromAtn-1.avi';
% file_name_EVM = 'Mason-iir-r1-0.4-r2-0.05-alpha-10-lambda_c-16-chromAtn-0.1.avi';
disp("Input the EVM video")


full_file_name_EVM = fullfile(path_EVM,file_name_EVM);
% full_file_name_EVM= 'ResultsSIGGRAPH2012/nick2-ideal-from-1-to-1.6667-alpha-50-level-6-chromAtn-1.avi';
disp(full_file_name_EVM)

vid = VideoReader(full_file_name_EVM);
vid_dup = VideoReader(full_file_name_EVM);

frameVector = read(vid);
height = vid.height;
width = vid.width; 
numberOfFrames = vid.NumberOfFrames;
    
% Loop through the movie, writing all frames out.
% Each frame will be in a separate file with unique name.
%meanGrayLevels = zeros(numberOfFrames, 1);
%meanRedLevels = zeros(numberOfFrames, 1);
%meanGreenLevels = zeros(numberOfFrames, 1);
%meanBlueLevels = zeros(numberOfFrames, 1);
%grayFrame = zeros(height, width, numberOfFrames);

% for frame = 1 : numberOfFrames
%     thisFrame = read(vid, frame);
%     grayImage = rgb2gray(thisFrame);
%     grayFrame(:, :, frame) = grayImage;
% end

%v = VideoWriter('GrayVersionVideo/Gray032 ischemia_clip#0+1i_ROI_0_0-ideal-from-0.83333-to-1-alpha-50-level-4-chromAtn-1.avi');
%open(v);
%%
numFrame = numberOfFrames; %10 seconds, 290 frames
timeAxis = [0:1:numFrame - 1]; 
averageR_Pixel = zeros(1, numFrame);
averageG_Pixel = zeros(1, numFrame);
averageB_Pixel = zeros(1, numFrame);
%%
for frame = 1 : numberOfFrames
    %Original gray
     %movie(frame).cdata = rgb2gray(frameVector(:, :, :, frame));
     %movie(frame).colormap = gray;
     %averagePixel(frame) = mean(movie(frame).cdata, 'all');
     %movie(frame).cdata = imgaussfilt(movie(frame).cdata);
     
    %
    %frame
    thisFrame = read(vid, frame);
    %grayFrame = rgb 2gray(thisFrame);
    %imshow(grayFrame);
    %blurFrame = imgaussfilt(grayFrame, 8);
    %imshow(blurFrame)
    averageR_Pixel(frame) = mean(thisFrame(:,:,1), 'all');
    averageG_Pixel(frame) = mean(thisFrame(:,:,2), 'all');
    averageB_Pixel(frame) = mean(thisFrame(:,:,3), 'all');
    %edgedFrame = edge(blurFrame, 'sobel');
    %movie(frame).cdata = edgedFrame * 255;
    %averagePixel(frame) = mean(movie(frame).cdata, 'all');
    %newVid(frame)
    %imshow(edgedFrame);
end

%%
%Get Max Peak
figure(4)
plot(timeAxis, averageR_Pixel, 'r')
%title('CH048Ischemia 1 time vs. R,G,B')
xlabel('time')
ylabel('Value')
hold on
plot(timeAxis, averageG_Pixel, 'g')
hold on
plot(timeAxis, averageB_Pixel, 'b')
legend('Red','Green', 'Blue', 'Location', 'northeastoutside')
hold off
% saveas(gcf,'./PubRGBPlot/Patient 55_Perfusion01_0025_0035.png')