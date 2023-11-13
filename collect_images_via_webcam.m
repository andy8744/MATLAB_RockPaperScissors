%thanks gpt
function collect_images_via_webcam
    % Create a figure and set up the webcam
    hFig = figure('Name', 'Webcam Image Capture', ...
                  'NumberTitle', 'Off', ...
                  'MenuBar', 'none', ...
                  'ToolBar', 'none', ...
                  'CloseRequestFcn', @closeFigure);

    webcamObj = webcam(1); % Connect to the first webcam
    
    % Initialize counters for each category
    counters = struct('rock', 0, 'paper', 0, 'scissors', 0, 'null', 0);

    % Update counters based on existing files
    categories = fieldnames(counters);
    for i = 1:length(categories)
        action = categories{i};
        dataFolder = fullfile(pwd, 'data', action);
        if exist(dataFolder, 'dir')
            files = dir(fullfile(dataFolder, '*.jpg'));
            counters.(action) = length(files);
        end
    end

    % Display counters on the UI
    hCounterText = uicontrol('Style', 'text', 'String', getCountersString(), ...
                             'Units', 'normalized', 'Position', [0.1, 0.9, 0.8, 0.05], ...
                             'BackgroundColor', [0.9, 0.9, 0.9], ...
                             'FontSize', 14); % Increase font size

    % Create an axes object to show the live webcam video
    ax = axes('Parent', hFig, ...
              'Units', 'normalized', ...
              'Position', [0.1, 0.3, 0.8, 0.6]);
    hImage = imshow(zeros(224, 224, 3, 'uint8'), 'Parent', ax);
    axis(ax, 'image');

    % Create buttons for "Rock", "Paper", "Scissors", and "Null"
    createButton('Rock', 0.1);
    createButton('Paper', 0.3);
    createButton('Scissors', 0.5);
    createButton('Null', 0.7);

    % Start showing the webcam before button press
    timerWebcam = timer('TimerFcn', @updateWebcamImage, 'Period', 0.05, ...
                        'ExecutionMode', 'fixedRate', 'BusyMode', 'drop');
    start(timerWebcam);

    % Function to create a button
    function createButton(action, position)
        uicontrol('Parent', hFig, 'Units', 'normalized', ...
            'Position', [position, 0.05, 0.15, 0.1], 'String', action, ...
            'Callback', @(~, ~) startCapture(lower(action)));
    end
    
    % Function to update webcam image on GUI
    function updateWebcamImage(~, ~)
        img = snapshot(webcamObj);
        set(hImage, 'CData', img);
    end
    
    % Function to start capture
    function startCapture(action)
        % Ensure the data directory exists
        dataFolder = fullfile(pwd, 'data', action);
        if ~exist(dataFolder, 'dir')
            mkdir(dataFolder);
        end

        % Capture and save the image
        img = snapshot(webcamObj);
        resizedImg = imresize(img, [224, 224]);
        filename = fullfile(dataFolder, sprintf('%s_%s.jpg', action, datestr(now, 'yyyy-mm-dd_HH-MM-SS_FFF')));
        imwrite(resizedImg, filename);

        % Update counter
        counters.(action) = counters.(action) + 1;
        set(hCounterText, 'String', getCountersString());
    end
    
    % Function to get counters string
    function countersStr = getCountersString()
        countersStr = '';
        for i = 1:length(categories)
            action = categories{i};
            countersStr = [countersStr, sprintf('%s: %d ', action, counters.(action))];
        end
    end
    
    % Function to close the figure and release the webcam and timers
    function closeFigure(~, ~)
        if isvalid(timerWebcam)
            stop(timerWebcam);
            delete(timerWebcam);
        end
        
        clear webcamObj; % Release the webcam
        delete(hFig);    % Close the figure
    end
end
