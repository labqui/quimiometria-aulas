function [analysis, images] = redgim_reader(pathInput)
%REDGIM_READER Summary of this function goes here
%   Detailed explanation goes here
destination = './red_temp';

if exist(destination, 'dir')
    rmdir(destination, 's');
end

mkdir(destination);

unzip(pathInput, './red_temp');
% JSON
fname = sprintf('%s/%s', destination, 'data.json'); 
fid = fopen(fname); 
raw = fread(fid,inf); 
str = char(raw'); 
fclose(fid);
analysis = jsondecode(str);

images = {}; 

for nameImage = {analysis.images.name}
    pathImage = sprintf('%s/%s', destination, char(nameImage));
    
    if exist(pathImage, 'file')
       images{size(images, 1) + 1} = char(pathImage);
    end
end

end

