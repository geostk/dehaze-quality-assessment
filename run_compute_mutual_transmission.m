clear;

load('images.mat');
load('atm_light.mat');

n = size(images,1);
m = size(images,2);

T = cell(n,m-1);

for i = 1:n
    i
    for j = 2:m
        T{i,j-1} = compute_mutual_transmission(double(images{i,1}),double(images{i,j}),A{i,j});
        fname = sprintf('../transmission/%d-%d.png', i, j-1);
        imwrite(mean(T{i,j-1},3), fname);
    end
end