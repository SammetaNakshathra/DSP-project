clc; clear; close all;

inputFile = 'input.mp4';

vidReader = VideoReader(inputFile);
outputFile = 'output_gray.avi';
vidWriter = VideoWriter(outputFile);
open(vidWriter);

% Display figure
figure('Name', 'Color and Grayscale Video', 'NumberTitle', 'off');

% Process each frame
while hasFrame(vidReader)
    % Read one frame
    colorFrame = readFrame(vidReader);

    % Convert RGB to Grayscale
    grayFrame = rgb2gray(colorFrame);

    % Write the grayscale frame to new video
    writeVideo(vidWriter, grayFrame);

    subplot(2,1,1);
    imshow(colorFrame);
    title('Original Color Video');

    subplot(2,1,2);
    imshow(grayFrame);
    title('Converted Grayscale Video');

    drawnow; % Refresh the display
    pause(1/vidReader.FrameRate);
end

% Step 5: Close writer
close(vidWriter);

disp('Grayscale video conversion complete!');