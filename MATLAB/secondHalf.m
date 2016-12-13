function imgOut = secondHalf(filename)
    img = imread(filename);
    height = length(img);
    h = floor(height/2);
    imgOut = img( h+1:height ,:,:);
end