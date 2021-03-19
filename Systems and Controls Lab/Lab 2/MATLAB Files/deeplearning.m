clear variables
clc

camera = webcam; % connect to camera
net = alexnet; % load neural net

while true
    im = snapshot(camera);
    image(im);
    im = imresize(im, [227 227]);
    label = classify(net, im);
    title(char(label));
    drawnow
end