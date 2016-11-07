%Science Computing HW4
%kmeansClustering 
%2016/11/7 tom ho

%using the tool box of ML
addpath('/Users/tomho/Desktop/ScienceComputing/hw4/machineLearning')
X = imread('/Users/tomho/Desktop/ScienceComputing/hw4/machineLearning/dataSet/annie19980405.jpg');




b = 8;   %block length
[m, n, p]=size(X); 
data_origin=double(myReshape(X, b));
maxI=10;   %1 to 1024 kinds of colors

for i=4:9
data = data_origin;
centerNum=2^i;
fprintf('i=%d/%d: no. of centers=%d\n', i, maxI, centerNum); 
center=kMeansClustering(data, centerNum); 
distMat=distPairwise(center, data);
[minValue, minIndex]=min(distMat);
for j = 1:(m/b)*(n/b)
    data(:,j) = center(:,minIndex(j));
end
X2=invshape(data, m, n, p, b);
result = uint8(X2);
subplot(3,3,i); image(result); %colormap(map); colorbar; axis image;
end




%{
[m, n, p]=size(X); 
index=reshape(1:m*n*p, m*n, 3)'; 
data=double(X(index));
maxI=4;   %1 to 1024 kinds of colors
for i=3:3
centerNum=2^i;
fprintf('i=%d/%d: no. of centers=%d\n', i, maxI, centerNum); 
center=kMeansClustering(data, centerNum); 
distMat=distPairwise(center, data);    %distMat = distance matrix
[minValue, minIndex]=min(distMat);
X2=reshape(minIndex, m, n);
map=center'/255;
%figure; image(X2); colormap(map); colorbar; axis image;
end
%}