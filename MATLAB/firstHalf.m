function imgOut = firstHalf(filename)
    img = imread(filename);
    height = length(img);
    h = floor(height/2);
    imgOut = img( 1:h ,:,:);
end