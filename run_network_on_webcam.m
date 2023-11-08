%%% Function created with help of ChatGPT 

function run_network_on_webcam(netTransfer, probabilityThreshold)
    if nargin < 2
        probabilityThreshold = 0.3; % default probability threshold
    end
    
    % Set up the webcam
    cam = webcam;
    cam.Resolution = '640x480';  % Choose a valid resolution for your webcam
    
    % Set up the figure
    hFig = figure('Name', 'GoogLeNet Webcam', 'NumberTitle', 'off', 'CloseRequestFcn', @closeFigure);
    hImage = image(zeros(str2double(cam.Resolution(2)), str2double(cam.Resolution(1)), 3, 'uint8'));
    axis image off;
    
    % Update the figure in a loop
    keepRunning = true;
    while ishandle(hFig) && keepRunning
        % Take a snapshot
        img = snapshot(cam);
        
        % Resize the image for the network
        img = imresize(img, [224, 224]);  % Resize to 224x224 without cropping
        
        % Classify the image
        [label, score] = classify(netTransfer, img);
        maxScore = max(score);
        
        % Display the image
        set(hImage, 'CData', img);
        
        % Display the label and score if the probability is above the threshold
        if maxScore > probabilityThreshold
            title(sprintf('Label: %s, Score: %.2f', string(label), maxScore));
        else
            title(' ');
        end
        
        drawnow; % Force display to update immediately.
    end

    % Clean up
    clear cam;

    % Function to handle figure close request
    function closeFigure(src, callbackdata)
        % Set flag to break loop
        keepRunning = false;
        delete(gcf); % Close the figure
    end
end

