%Science Computing HW4
%kmeansClustering 
%2016/11/7 tom ho

%using the tool box of ML
addpath('/Users/tomho/Desktop/ScienceComputing/hw4/machineLearning')
X = imread('/Users/tomho/Desktop/ScienceComputing/hw4/machineLearning/dataSet/annie19980405.jpg'); image(X)

blocksize = 8;
[m, n, p]=size(X); 
index=reshape(1:m*n*p, m*n, 3)'; 
data=double(X(index));
maxI=10;   %1 to 1024 kinds of colors
for i=1:maxI
centerNum=2^i;
fprintf('i=%d/%d: no. of centers=%d\n', i, maxI, centerNum); 
center=kMeansClustering(data, centerNum); 
distMat=distPairwise(center, data);
[minValue, minIndex]=min(distMat);
X2=reshape(minIndex, m, n);
map=center'/255;
figure; image(X2); colormap(map); colorbar; axis image;
end
