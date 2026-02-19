function output = uniformQuant(imageFileName, rgbBitDepth)
%UNIFORMQUANT Uniform quantization of an image via truncation
%   This function uses truncation to uniformly quantize an image.
%   The method used was provided from our textbook. And is quite simple.

% Use imread to get image data
% I would use im2double and im2uint8 but that requires addons 
img = imread(imageFileName);

% Set our bit indexes
rBits = 256 / (2^rgbBitDepth(1));
gBits = 256 / (2^rgbBitDepth(2));
bBits = 256 / (2^rgbBitDepth(3));

% Truncate by bit index
r = floor(double(img(:,:,1)) / rBits);
g = floor(double(img(:,:,2)) / gBits);
b = floor(double(img(:,:,3)) / bBits);

% Scale back to uint8 and adjust image channels
img(:,:,1) = uint8(r * rBits);
img(:,:,2) = uint8(g * gBits);
img(:,:,3) = uint8(b * bBits);

output = img;
end

