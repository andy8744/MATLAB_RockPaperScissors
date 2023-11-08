function [predictedLabel, confidence] = inferImage(netTransfer, imagePath)
    % Load the image
    originalImg = imread(imagePath);
    
    % Preprocess the image
    inputSize = netTransfer.Layers(1).InputSize(1:2); % Get input size from the first layer of the network
    resizedImg = imresize(originalImg, inputSize); % Resize image to required input size
    
    % Perform inference
    [label, scores] = classify(netTransfer, resizedImg); % Classify the image using the fine-tuned network
    
    % Get the label and confidence of the prediction
    predictedLabel = string(label); % Convert the label to string for easier reading
    confidence = max(scores) * 100; % Get the confidence of the prediction
    
    % Display the result
    fprintf('The image is classified as: %s with a confidence of %.2f%%\n', predictedLabel, confidence);
    
    % Show the original image with the prediction and confidence level as title
    figure; % Create a new figure
    imshow(originalImg); % Show the original image
    title(sprintf('Predicted: %s, Confidence: %.2f%%', predictedLabel, confidence)); % Show the title with label and confidence
end
