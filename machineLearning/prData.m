function [DS, TS]=prData(dataName, showPlot)
% prData: Various test datasets for pattern recognition
%
%	Usage:
%		DS=prData(dataName)
%		[DS, TS]=prData(dataName)
%
%	Description:
%		DS=prData(dataName) generate different dataset for classification.
%			dataName: 'iris', 'wine', 'abalone', 'taiji', 'random2', 'random6'
%
%	Example:
%		subplot(2,3,1);
%		DS=prData('random2'); dsScatterPlot(DS);
%		subplot(2,3,2);
%		DS=prData('taiji'); dsScatterPlot(DS);
%		subplot(2,3,3);
%		DS=prData('linSeparable'); dsScatterPlot(DS);
%		subplot(2,3,4);
%		DS=prData('peaks'); dsScatterPlot(DS);
%		subplot(2,3,5);
%		DS=prData('3classes'); dsScatterPlot(DS);
%		subplot(2,3,6);
%		DS=prData('nonlinearSeparable'); dsScatterPlot(DS);
%
%	See also dcData.

%	Category: Dataset generation
%	Roger Jang, 20100731, 20101231

if nargin<1, selfdemo; return; end
if nargin<2, showPlot=0; end

switch lower(dataName)
	case 'digit'
		DS.dataName='digit';
		load(sprintf('%s/dataSet/mnist_uint8.mat', mltRoot));
		DS.input=double(train_x');		% 60000 entries
		[p, q]=find(train_y');
		DS.output=p';
		DS.outputName={'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
		TS=DS;
		TS.input=double(test_x');		% 10000 entries
		[p, q]=find(test_y');
		TS.output=p';
	case 'iris'
		DS.dataName='iris';
		load(sprintf('%s/dataSet/iris.dat', mltRoot));
		DS.inputName={'sepal length', 'sepal width', 'petal length', 'petal width'};
		DS.outputName={'Setosa', 'Versicolour', 'Virginica'};
		DS.input=iris(:, 1:end-1)';
		DS.output=iris(:, end)';
	case 'wine'
		DS.dataName='wine';
		load(sprintf('%s/dataSet/wine.dat', mltRoot));
		DS.inputName={'Alcohol', 'Malic acid', 'Ash', 'Alcalinity of ash', 'Magnesium', 'Total phenols', 'Flavanoids', 'Nonflavanoid phenols', 'Proanthocyanins', 'Color intensity', 'Hue', 'OD280/OD315 of diluted wines', 'Proline'};
		DS.outputName={'Class 1', 'Class 2', 'Class 3'};
		DS.input=wine(:, 2:end)';
		DS.output=wine(:, 1)';
	case 'abalone'
		DS.dataName='abalone';
		load(sprintf('%s/dataSet/abalone.dat', mltRoot));
		DS.inputName={'Sex', 'Length', 'Diameter', 'Height', 'Whole weight', 'Shucked weight', 'Viscera weight', 'Shell weight'};
		DS.input=abalone(:, 1:end-1)';
		age=abalone(:, end);
		uniqueAge=unique(age);
		for i=1:length(uniqueAge)
			DS.outputName{i}=sprintf('%d', uniqueAge(i));
		end
		for i=1:length(age)
			DS.output(i)=find(uniqueAge==age(i));
		end
	case 'random2'		% 2D random data
		DS.dataName='random2';
		n=100;
		dim=2;
		c1 = [0.125 0.25]'; data1 = randn(dim,n)/8 + c1*ones(1,n); out1 = 1*ones(1,n);
		c2 = [0.625 0.25]'; data2 = randn(dim,n)/8 + c2*ones(1,n); out2 = 2*ones(1,n);
		c3 = [0.375 0.75]'; data3 = randn(dim,n)/8 + c3*ones(1,n); out3 = 3*ones(1,n);
		c4 = [0.875 0.75]'; data4 = randn(dim,n)/8 + c4*ones(1,n); out4 = 4*ones(1,n);
		data = [data1, data2, data3, data4];
		out = [out1, out2, out3, out4];
		DS.input=data;
		DS.output=out;
	case 'nonlinearseparable'		% 2D random data
		DS.dataName='nonlinearSeparable';
		n=100;
		dim=2;
		c1 = [0.125 0.25]'; data1 = randn(dim,n)/8 + c1*ones(1,n); out1 = 1*ones(1,n);
		c2 = [0.625 0.25]'; data2 = randn(dim,n)/8 + c2*ones(1,n); out2 = 2*ones(1,n);
		c3 = [0.155 0.75]'; data3 = randn(dim,n)/8 + c3*ones(1,n); out3 = 2*ones(1,n);
		c4 = [0.875 0.75]'; data4 = randn(dim,n)/8 + c4*ones(1,n); out4 = 1*ones(1,n);
		c5 = [1.011 0.12]'; data5 = randn(dim,n)/20+ c5*ones(1,n); out5 = 1*ones(1,n);
		data = [data1, data2, data3, data4 data5];
		out = [out1, out2, out3, out4 out5];
		DS.input=data;
		DS.output=out;
	case 'random3'		% 3D random data
		DS.dataName='random3';
		dataNum=100;
		mean1=[0 0 0]';
		input1=randn(3, dataNum)+mean1*ones(1,dataNum);
		output1=1*ones(1, dataNum);
		mean2=[0 5 5]';
		input2=randn(3, dataNum)+mean2*ones(1,dataNum);
		output2=2*ones(1, dataNum);
		mean3=[3 2 4]';
		input3=randn(3, dataNum)+mean3*ones(1,dataNum);
		output3=3*ones(1, dataNum);
		DS.input=[input1, input2, input3];
		DS.output=[output1, output2, output3];
	case 'random6'		% 6D random data
		DS.dataName='random6';
		n=50;
		dim=6;
		c1 = [1 0 0 0 0 0]'; data1 = randn(dim,n)/4 + c1*ones(1,n); out1 = 1*ones(1,n);
		c2 = [0 1 0 0 0 0]'; data2 = randn(dim,n)/4 + c2*ones(1,n); out2 = 2*ones(1,n);
		c3 = [0 0 1 0 0 0]'; data3 = randn(dim,n)/4 + c3*ones(1,n); out3 = 3*ones(1,n);
		c4 = [0 0 0 1 0 0]'; data4 = randn(dim,n)/4 + c4*ones(1,n); out4 = 4*ones(1,n);
		data = [data1, data2, data3, data4];
		out = [out1, out2, out3, out4];
		DS.input=data;
		DS.output=out;
	case 'taiji'
		DS.dataName='taiji';
		temp=2*rand(2, 1000)-1;
		x=temp(1,:)+j*temp(2,:);
		index=abs(x)<1;
		x=x(:, index);
		DS.input=[real(x); imag(x)];
		DS.output=ones(1, length(x));
		index=abs(x-j*0.5)<0.5;
		DS.output(index)=2;
		index=real(x)>0;
		DS.output(index)=2;
		index=abs(x+j*0.5)<0.5;
		DS.output(index)=1;
	case 'linseparable'
		DS.dataName='linseparable';
		dataNum=100;
		DS.input=2*rand(2, dataNum)-1;
		DS.output=1+(DS.input(1,:)+DS.input(2,:)>0);	% 1 or 2
	case 'peaks'
		DS.dataName='peaks';
		dataNum=1000;
		x=rand(1, dataNum)*6-3;
		y=rand(1, dataNum)*6-3;
		z=peaks(x,y);
		DS.input=[x; y];
		DS.output=1+(z>0.5);
	case '3classes'
		DS.dataName='3classes';
		dataNum=100;
		DS.input=rand(2, dataNum);
		DS.output=zeros(1, dataNum);
		x=DS.input(1,:);
		y=DS.input(2,:);
		DS.output(y>x)=1;
		DS.output(y<=x & y>=-x+1)=2;
		DS.output(DS.output==0)=3;
	case 'ltr1d'	% 1D data for LTR (learning to rank)
		% ====== Create the dataset
		n=50;		% No. of data for each rank
		rank=1:5;	% 5 ranks
		DS.input=[];
		DS.output=[];
		for i=rank
			DS.input=[DS.input, randn(1,n)/3+i];
			DS.output=[DS.output, i*ones(1,n)];
		end
		% ====== Sort the input part
		[DS.input, index]=sort(DS.input);
		DS.output=DS.output(index);
		DS.inputName={'input'};
		DS.outputName={'rank1', 'rank2', 'rank3', 'rank4', 'rank5'};
	case '2spirals'
		DS.dataName='2spirals';
% The following is to calculate y (curve length) w.r.t t 
%syms tt
%t = 0:0.1:96;
%for i = 1:length(t),
%	fprintf('t = %g\n', t(i));
%	y(i)=eval(int(sqrt((6.5/104)^2+6.5^2*(1-tt/104)^2*(pi/16)^2), 0, t(i)));
%end
%plot(t, y);
%save length t y
		k=1;
		t=[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2 2.1 2.2 2.3 2.4 2.5 2.6 2.7 2.8 2.9 3 3.1 3.2 3.3 3.4 3.5 3.6 3.7 3.8 3.9 4 4.1 4.2 4.3 4.4 4.5 4.6 4.7 4.8 4.9 5 5.1 5.2 5.3 5.4 5.5 5.6 5.7 5.8 5.9 6 6.1 6.2 6.3 6.4 6.5 6.6 6.7 6.8 6.9 7 7.1 7.2 7.3 7.4 7.5 7.6 7.7 7.8 7.9 8 8.1 8.2 8.3 8.4 8.5 8.6 8.7 8.8 8.9 9 9.1 9.2 9.3 9.4 9.5 9.6 9.7 9.8 9.9 10 10.1 10.2 10.3 10.4 10.5 10.6 10.7 10.8 10.9 11 11.1 11.2 11.3 11.4 11.5 11.6 11.7 11.8 11.9 12 12.1 12.2 12.3 12.4 12.5 12.6 12.7 12.8 12.9 13 13.1 13.2 13.3 13.4 13.5 13.6 13.7 13.8 13.9 14 14.1 14.2 14.3 14.4 14.5 14.6 14.7 14.8 14.9 15 15.1 15.2 15.3 15.4 15.5 15.6 15.7 15.8 15.9 16 16.1 16.2 16.3 16.4 16.5 16.6 16.7 16.8 16.9 17 17.1 17.2 17.3 17.4 17.5 17.6 17.7 17.8 17.9 18 18.1 18.2 18.3 18.4 18.5 18.6 18.7 18.8 18.9 19 19.1 19.2 19.3 19.4 19.5 19.6 19.7 19.8 19.9 20 20.1 20.2 20.3 20.4 20.5 20.6 20.7 20.8 20.9 21 21.1 21.2 21.3 21.4 21.5 21.6 21.7 21.8 21.9 22 22.1 22.2 22.3 22.4 22.5 22.6 22.7 22.8 22.9 23 23.1 23.2 23.3 23.4 23.5 23.6 23.7 23.8 23.9 24 24.1 24.2 24.3 24.4 24.5 24.6 24.7 24.8 24.9 25 25.1 25.2 25.3 25.4 25.5 25.6 25.7 25.8 25.9 26 26.1 26.2 26.3 26.4 26.5 26.6 26.7 26.8 26.9 27 27.1 27.2 27.3 27.4 27.5 27.6 27.7 27.8 27.9 28 28.1 28.2 28.3 28.4 28.5 28.6 28.7 28.8 28.9 29 29.1 29.2 29.3 29.4 29.5 29.6 29.7 29.8 29.9 30 30.1 30.2 30.3 30.4 30.5 30.6 30.7 30.8 30.9 31 31.1 31.2 31.3 31.4 31.5 31.6 31.7 31.8 31.9 32 32.1 32.2 32.3 32.4 32.5 32.6 32.7 32.8 32.9 33 33.1 33.2 33.3 33.4 33.5 33.6 33.7 33.8 33.9 34 34.1 34.2 34.3 34.4 34.5 34.6 34.7 34.8 34.9 35 35.1 35.2 35.3 35.4 35.5 35.6 35.7 35.8 35.9 36 36.1 36.2 36.3 36.4 36.5 36.6 36.7 36.8 36.9 37 37.1 37.2 37.3 37.4 37.5 37.6 37.7 37.8 37.9 38 38.1 38.2 38.3 38.4 38.5 38.6 38.7 38.8 38.9 39 39.1 39.2 39.3 39.4 39.5 39.6 39.7 39.8 39.9 40 40.1 40.2 40.3 40.4 40.5 40.6 40.7 40.8 40.9 41 41.1 41.2 41.3 41.4 41.5 41.6 41.7 41.8 41.9 42 42.1 42.2 42.3 42.4 42.5 42.6 42.7 42.8 42.9 43 43.1 43.2 43.3 43.4 43.5 43.6 43.7 43.8 43.9 44 44.1 44.2 44.3 44.4 44.5 44.6 44.7 44.8 44.9 45 45.1 45.2 45.3 45.4 45.5 45.6 45.7 45.8 45.9 46 46.1 46.2 46.3 46.4 46.5 46.6 46.7 46.8 46.9 47 47.1 47.2 47.3 47.4 47.5 47.6 47.7 47.8 47.9 48 48.1 48.2 48.3 48.4 48.5 48.6 48.7 48.8 48.9 49 49.1 49.2 49.3 49.4 49.5 49.6 49.7 49.8 49.9 50 50.1 50.2 50.3 50.4 50.5 50.6 50.7 50.8 50.9 51 51.1 51.2 51.3 51.4 51.5 51.6 51.7 51.8 51.9 52 52.1 52.2 52.3 52.4 52.5 52.6 52.7 52.8 52.9 53 53.1 53.2 53.3 53.4 53.5 53.6 53.7 53.8 53.9 54 54.1 54.2 54.3 54.4 54.5 54.6 54.7 54.8 54.9 55 55.1 55.2 55.3 55.4 55.5 55.6 55.7 55.8 55.9 56 56.1 56.2 56.3 56.4 56.5 56.6 56.7 56.8 56.9 57 57.1 57.2 57.3 57.4 57.5 57.6 57.7 57.8 57.9 58 58.1 58.2 58.3 58.4 58.5 58.6 58.7 58.8 58.9 59 59.1 59.2 59.3 59.4 59.5 59.6 59.7 59.8 59.9 60 60.1 60.2 60.3 60.4 60.5 60.6 60.7 60.8 60.9 61 61.1 61.2 61.3 61.4 61.5 61.6 61.7 61.8 61.9 62 62.1 62.2 62.3 62.4 62.5 62.6 62.7 62.8 62.9 63 63.1 63.2 63.3 63.4 63.5 63.6 63.7 63.8 63.9 64 64.1 64.2 64.3 64.4 64.5 64.6 64.7 64.8 64.9 65 65.1 65.2 65.3 65.4 65.5 65.6 65.7 65.8 65.9 66 66.1 66.2 66.3 66.4 66.5 66.6 66.7 66.8 66.9 67 67.1 67.2 67.3 67.4 67.5 67.6 67.7 67.8 67.9 68 68.1 68.2 68.3 68.4 68.5 68.6 68.7 68.8 68.9 69 69.1 69.2 69.3 69.4 69.5 69.6 69.7 69.8 69.9 70 70.1 70.2 70.3 70.4 70.5 70.6 70.7 70.8 70.9 71 71.1 71.2 71.3 71.4 71.5 71.6 71.7 71.8 71.9 72 72.1 72.2 72.3 72.4 72.5 72.6 72.7 72.8 72.9 73 73.1 73.2 73.3 73.4 73.5 73.6 73.7 73.8 73.9 74 74.1 74.2 74.3 74.4 74.5 74.6 74.7 74.8 74.9 75 75.1 75.2 75.3 75.4 75.5 75.6 75.7 75.8 75.9 76 76.1 76.2 76.3 76.4 76.5 76.6 76.7 76.8 76.9 77 77.1 77.2 77.3 77.4 77.5 77.6 77.7 77.8 77.9 78 78.1 78.2 78.3 78.4 78.5 78.6 78.7 78.8 78.9 79 79.1 79.2 79.3 79.4 79.5 79.6 79.7 79.8 79.9 80 80.1 80.2 80.3 80.4 80.5 80.6 80.7 80.8 80.9 81 81.1 81.2 81.3 81.4 81.5 81.6 81.7 81.8 81.9 82 82.1 82.2 82.3 82.4 82.5 82.6 82.7 82.8 82.9 83 83.1 83.2 83.3 83.4 83.5 83.6 83.7 83.8 83.9 84 84.1 84.2 84.3 84.4 84.5 84.6 84.7 84.8 84.9 85 85.1 85.2 85.3 85.4 85.5 85.6 85.7 85.8 85.9 86 86.1 86.2 86.3 86.4 86.5 86.6 86.7 86.8 86.9 87 87.1 87.2 87.3 87.4 87.5 87.6 87.7 87.8 87.9 88 88.1 88.2 88.3 88.4 88.5 88.6 88.7 88.8 88.9 89 89.1 89.2 89.3 89.4 89.5 89.6 89.7 89.8 89.9 90 90.1 90.2 90.3 90.4 90.5 90.6 90.7 90.8 90.9 91 91.1 91.2 91.3 91.4 91.5 91.6 91.7 91.8 91.9 92 92.1 92.2 92.3 92.4 92.5 92.6 92.7 92.8 92.9 93 93.1 93.2 93.3 93.4 93.5 93.6 93.7 93.8 93.9 94 94.1 94.2 94.3 94.4 94.5 94.6 94.7 94.8 94.9 95 95.1 95.2 95.3 95.4 95.5 95.6 95.7 95.8 95.9 96];
		y=[0 0.12771885776958 0.255315144242104 0.382788859700774 0.510140004429623 0.637368578713392 0.764474582837785 0.891458017089278 1.01831888175515 1.14505717712353 1.27167290348344 1.39816606112463 1.5245366503378 1.6507846714144 1.77691012464687 1.90291301032834 2.0287933287529 2.15455108021546 2.28018626501184 2.40569888343864 2.53108893579341 2.65635642237455 2.78150134348133 2.90652369941388 3.03142349047326 3.15620071696137 3.28085537918105 3.40538747743598 3.52979701203078 3.65408398327098 3.77824839146292 3.90229023691399 4.02620951993237 4.15000624082727 4.27368039990867 4.39723199748764 4.52066103387602 4.64396750938673 4.76715142433348 4.89021277903102 5.01315157379501 5.13596780894204 5.25866148478967 5.38123260165639 5.50368115986168 5.62600715972594 5.74821060157056 5.8702914857179 5.99224981249129 6.11408558221499 6.23579879521431 6.35738945181553 6.47885755234585 6.60020309713357 6.72142608650788 6.84252652079905 6.96350440033827 7.08435972545785 7.20509249649101 7.32570271377206 7.44619037763627 7.56655548841994 7.68679804646049 7.80691805209621 7.92691550566657 8.04679040751204 8.16654275797409 8.28617255739529 8.40567980611925 8.52506450449061 8.64432665285514 8.76346625155963 8.8824833009519 9.00137780138094 9.12014975319674 9.23879915675043 9.35732601239418 9.47573032048133 9.59401208136619 9.71217129540432 9.83020796295228 9.9481220843678 10.0659136600097 10.1835826902379 10.3011291754135 10.4185531158986 10.5358545120568 10.6530333642523 10.7700896728509 10.8870234382192 11.0038346607253 11.1205233407382 11.2370894786282 11.3535330747667 11.4698541295262 11.5860526432806 11.7021286164048 11.8180820492749 11.9339129422683 12.0496212957636 12.1652071101403 12.2806703857797 12.3960111230636 12.5112293223757 12.6263249841003 12.7412981086235 12.8561486963323 12.9708767476149 13.085482262861 13.1999652424613 13.314325686808 13.4285635962942 13.5426789713147 13.6566718122653 13.7705421195432 13.8842898935467 13.9979151346756 14.1114178433309 14.2247980199149 14.3380556648312 14.4511907784848 14.5642033612819 14.67709341363 14.7898609359382 14.9025059286165 15.0150283920765 15.1274283267313 15.239705732995 15.3518606112833 15.4638929620131 15.5758027856029 15.6875900824723 15.7992548530426 15.9107970977361 16.0222168169768 16.13351401119 16.2446886808024 16.3557408262421 16.4666704479386 16.5774775463229 16.6881621218274 16.798724174886 16.9091637059339 17.0194807154078 17.1296752037459 17.2397471713878 17.3496966187747 17.4595235463492 17.5692279545552 17.6788098438385 17.788269214646 17.8976060674264 18.0068204026296 18.1159122207072 18.2248815221125 18.3337283073 18.4424525767258 18.5510543308478 18.6595335701252 18.7678902950188 18.876124505991 18.9842362035058 19.0922253880287 19.2000920600268 19.3078362199689 19.4154578683254 19.5229570055681 19.6303336321706 19.7375877486081 19.8447193553573 19.9517284528968 20.0586150417065 20.1653791222683 20.2720206950655 20.3785397605832 20.4849363193082 20.5912103717288 20.6973619183352 20.8033909596192 20.9092974960744 21.0150815281958 21.1207430564806 21.2262820814274 21.3316986035367 21.4369926233105 21.5421641412529 21.6472131578694 21.7521396736677 21.856943689157 21.9616252048481 22.0661842212541 22.1706207388895 22.2749347582708 22.3791262799162 22.4831953043458 22.5871418320816 22.6909658636474 22.7946673995687 22.8982464403731 23.00170298659 23.1050370387506 23.2082485973881 23.3113376630375 23.4143042362358 23.5171483175218 23.6198699074365 23.7224690065224 23.8249456153244 23.9272997343891 24.029531364265 24.1316405055027 24.2336271586549 24.3354913242761 24.4372330029228 24.5388521951537 24.6403489015293 24.7417231226122 24.8429748589672 24.944104111161 25.0451108797623 25.1459951653421 25.2467569684732 25.3473962897306 25.4479131296916 25.5483074889354 25.6485793680433 25.7487287675989 25.8487556881878 25.9486601303977 26.0484420948187 26.1481015820429 26.2476385926646 26.3470531272804 26.446345186489 26.5455147708913 26.6445618810905 26.743486517692 26.8422886813035 26.9409683725349 27.0395255919985 27.1379603403086 27.2362726180822 27.3344624259383 27.4325297644983 27.530474634386 27.6282970362274 27.7259969706511 27.8235744382877 27.9210294397705 28.0183619757351 28.1155720468195 28.212659653664 28.3096247969114 28.4064674772071 28.5031876951987 28.5997854515364 28.6962607468729 28.7926135818632 28.8888439571651 28.9849518734387 29.0809373313466 29.1768003315542 29.272540874729 29.3681589615416 29.4636545926648 29.5590277687741 29.6542784905476 29.7494067586661 29.8444125738129 29.939295936674 30.0340568479381 30.1286953082966 30.2232113184435 30.3176048790754 30.411875990892 30.5060246545952 30.6000508708901 30.6939546404843 30.7877359640883 30.8813948424152 30.9749312761812 31.0683452661051 31.1616368129086 31.2548059173161 31.3478525800551 31.4407768018559 31.5335785834515 31.6262579255781 31.7188148289747 31.8112492943831 31.9035613225482 31.9957509142178 32.0878180701428 32.179762791077 32.2715850777772 32.3632849310033 32.4548623515182 32.5463173400879 32.6376498974814 32.7288600244709 32.8199477218316 32.910912990342 33.0017558307836 33.0924762439411 33.1830742306025 33.2735497915587 33.3639029276041 33.4541336395362 33.5442419281558 33.6342277942671 33.7240912386772 33.8138322621969 33.9034508656402 33.9929470498243 34.0823208155699 34.171572163701 34.2607010950452 34.3497076104332 34.4385917106994 34.5273533966814 34.6159926692206 34.7045095291615 34.7929039773524 34.8811760146451 34.9693256418947 35.0573528599603 35.1452576697042 35.2330400719925 35.3207000676948 35.4082376576845 35.4956528428385 35.5829456240376 35.6701160021662 35.7571639781124 35.844089552768 35.9308927270287 36.017573501794 36.104131877967 36.190567856455 36.2768814381689 36.3630726240234 36.4491414149374 36.5350878118335 36.6209118156383 36.7066134272824 36.7921926477004 36.8776494778308 36.9629839186164 37.0481959710037 37.1332856359436 37.218252914391 37.3030978073048 37.3878203156482 37.4724204403886 37.5568981824976 37.6412535429509 37.7254865227286 37.809597122815 37.8935853441986 37.9774511878725 38.061194654834 38.1448157460847 38.2283144626307 38.3116908054826 38.3949447756552 38.4780763741681 38.5610856020451 38.6439724603149 38.7267369500105 38.8093790721694 38.891898827834 38.9742962180512 39.0565712438725 39.1387239063543 39.2207542065574 39.3026621455478 39.3844477243959 39.466110944177 39.5476518059714 39.6290703108642 39.7103664599453 39.7915402543095 39.8725916950568 39.953520783292 40.0343275201249 40.1150119066704 40.1955739440486 40.2760136333846 40.3563309758085 40.4365259724557 40.516598624467 40.5965489329881 40.6763768991702 40.7560825241697 40.8356658091483 40.9151267552732 40.9944653637169 41.0736816356573 41.1527755722778 41.2317471747675 41.3105964443207 41.3893233821374 41.4679279894233 41.5464102673896 41.6247702172533 41.703007840237 41.781123137569 41.8591161104837 41.9369867602208 42.0147350880263 42.0923610951519 42.1698647828553 42.2472461524 42.3245052050557 42.401641942098 42.4786563648087 42.5555484744755 42.6323182723926 42.7089657598601 42.7854909381845 42.8618938086784 42.9381743726609 43.0143326314573 43.0903685863995 43.1662822388256 43.2420735900804 43.317742641515 43.3932893944872 43.4687138503614 43.5440160105086 43.6191958763066 43.6942534491397 43.7691887303992 43.8440017214832 43.9186924237966 43.9932608387511 44.0677069677657 44.142030812266 44.2162323736849 44.2903116534624 44.3642686530455 44.4381033738885 44.5118158174529 44.5854059852075 44.6588738786283 44.732219499199 44.8054428484104 44.878543927761 44.9515227387566 45.024379282911 45.0971135617451 45.1697255767879 45.2422153295759 45.3145828216535 45.3868280545729 45.4589510298943 45.5309517491856 45.602830214023 45.6745864259905 45.7462203866804 45.817732097693 45.889121560637 45.9603887771293 46.031533748795 46.1025564772678 46.1734569641897 46.2442352112113 46.3148912199918 46.3854249921989 46.4558365295091 46.5261258336075 46.5962929061882 46.666337748954 46.7362603636167 46.8060607518972 46.8757389155252 46.9452948562398 47.0147285757891 47.0840400759305 47.1532293584307 47.2222964250658 47.2912412776213 47.3600639178923 47.4287643476835 47.497342568809 47.5657985830929 47.634132392369 47.7023439984809 47.7704334032821 47.8384006086363 47.906245616417 47.9739684285081 48.0415690468034 48.1090474732074 48.1764037096345 48.24363775801 48.3107496202694 48.3777392983589 48.4446067942353 48.5113521098662 48.5779752472301 48.6444762083163 48.7108549951251 48.777111609668 48.8432460539673 48.9092583300569 48.9751484399818 49.0409163857985 49.106562169575 49.1720857933908 49.237487259337 49.3027665695165 49.3679237260441 49.4329587310464 49.4978715866621 49.5626622950419 49.6273308583488 49.6918772787579 49.7563015584569 49.8206036996459 49.8847837045373 49.9488415753566 50.0127773143417 50.0765909237435 50.1402824058259 50.2038517628656 50.2672989971527 50.3306241109905 50.3938271066957 50.4569079865982 50.5198667530417 50.5827034083834 50.6454179549946 50.70801039526 50.7704807315787 50.8328289663636 50.8950551020419 50.9571591410553 51.0191410858596 51.0810009389254 51.1427387027379 51.204354379797 51.2658479726175 51.3272194837292 51.3884689156772 51.4495962710216 51.5106015523381 51.5714847622176 51.632245903267 51.6928849781085 51.7534019893806 51.8137969397376 51.8740698318498 51.9342206684039 51.994249452103 52.0541561856668 52.1139408718314 52.1736035133499 52.2331441129923 52.2925626735456 52.351859197814 52.4110336886192 52.4700861488002 52.5290165812138 52.5878249887344 52.6465113742546 52.7050757406848 52.7635180909538 52.8218384280087 52.8800367548152 52.9381130743576 52.9960673896392 53.0538997036822 53.1116100195279 53.169198340237 53.2266646688899 53.2840090085862 53.3412313624458 53.3983317336083 53.4553101252335 53.5121665405017 53.5689009826135 53.6255134547903 53.6820039602743 53.7383725023289 53.7946190842386 53.8507437093093 53.9067463808686 53.9626271022657 54.018385876872 54.0740227080809 54.1295375993083 54.1849305539925 54.2402015755948 54.2953506675991 54.3503778335127 54.4052830768663 54.4600664012141 54.514727810134 54.5692673072281 54.6236848961225 54.6779805804677 54.7321543639392 54.7862062502369 54.8401362430861 54.8939443462374 54.9476305634667 55.0011948985759 55.054637355393 55.107957937772 55.1611566495934 55.2142334947647 55.2671884772202 55.3200216009213 55.3727328698571 55.4253222880442 55.4777898595275 55.5301355883799 55.5823594787029 55.6344615346266 55.6864417603104 55.7383001599429 55.7900367377423 55.8416514979566 55.893144444864 55.9445155827732 55.9957649160236 56.0468924489855 56.0978981860606 56.1487821316821 56.1995442903154 56.2501846664578 56.3007032646393 56.3511000894226 56.4013751454037 56.4515284372119 56.5015599695106 56.5514697469971 56.6012577744031 56.6509240564952 56.7004685980753 56.7498914039805 56.7991924790839 56.8483718282947 56.8974294565587 56.9463653688587 56.9951795702145 57.0438720656838 57.0924428603622 57.1408919593838 57.1892193679213 57.2374250911868 57.2855091344318 57.3334715029478 57.3813122020668 57.4290312371613 57.4766286136454 57.5241043369745 57.5714584126462 57.6186908462005 57.6658016432203 57.7127908093319 57.7596583502055 57.8064042715554 57.8530285791406 57.8995312787656 57.94591237628 57.9921718775801 58.0383097886085 58.0843261153549 58.1302208638568 58.1759940401996 58.2216456505175 58.2671757009936 58.3125841978609 58.3578711474024 58.403036555952 58.4480804298948 58.4930027756677 58.5378035997599 58.5824829087137 58.6270407091249 58.6714770076434 58.7157918109736 58.7599851258756 58.804056959165 58.8480073177141 58.8918362084525 58.9355436383672 58.9791296145039 59.0225941439673 59.0659372339218 59.1091588915921 59.1522591242642 59.1952379392856 59.2380953440664 59.2808313460799 59.323445952863 59.3659391720175 59.4083110112105 59.4505614781749 59.4926905807107 59.5346983266855 59.5765847240352 59.6183497807648 59.6599935049495 59.701515904735 59.7429169883389 59.784196764051 59.8253552402347 59.8663924253272 59.907308327841 59.9481029563644 59.9887763195626 60.0293284261785 60.0697592850337 60.1100689050292 60.1502572951469 60.1903244644499 60.2302704220841 60.2700951772787 60.3097987393475 60.3493811176898 60.3888423217916 60.4281823612265 60.4674012456568 60.5064989848346 60.545475588603 60.5843310668973 60.6230654297456 60.6616786872708 60.700170849691 60.7385419273214 60.7767919305748 60.8149208699634 60.8529287560998 60.8908155996985 60.9285814115766 60.9662262026559 61.0037499839638 61.0411527666348 61.0784345619115 61.1155953811466 61.1526352358039 61.1895541374602 61.2263520978059 61.2630291286475 61.2995852419085 61.3360204496311 61.3723347639778 61.408528197233 61.4446007618047 61.4805524702257 61.5163833351561 61.552093369384 61.5876825858283 61.6231509975395 61.6584986177021 61.6937254596361 61.7288315367992 61.7638168627882 61.7986814513413 61.8334253163401 61.868048471811 61.9025509319279 61.9369327110141 61.9711938235438 62.0053342841452 62.0393541076017 62.0732533088548 62.107031903006 62.1406899053191 62.1742273312226 62.2076441963119 62.240940516352 62.2741163072797 62.3071715852059 62.3401063664187 62.3729206673853 62.4056145047553 62.4381878953627 62.4706408562292 62.5029734045664 62.5351855577793 62.5672773334685 62.5992487494334 62.6310998236755 62.6628305744007 62.694441020023 62.7259311791676 62.7573010706737 62.7885507135982 62.8196801272186 62.8506893310369 62.8815783447826 62.9123471884166 62.9429958821344 62.97352444637 63.0039329017996 63.0342212693455 63.0643895701795 63.0944378257276 63.1243660576734 63.1541742879625 63.1838625388066 63.2134308326877 63.2428791923628 63.2722076408677 63.3014162015222 63.3305048979344 63.3594737540054 63.3883227939342 63.4170520422225 63.4456615236797 63.4741512634284 63.502521286909 63.5307716198855 63.5589022884506 63.5869133190316 63.6148047383958 63.6425765736563 63.670228852278 63.6977616020836 63.7251748512598 63.7524686283634 63.7796429623279 63.8066978824701 63.8336334184965 63.8604496005107 63.8871464590198 63.9137240249419 63.9401823296131 63.9665214047955 63.9927412826843 64.0188419959157 64.0448235775752 64.0706860612054 64.0964294808143 64.1220538708843 64.1475592663802 64.1729457027588 64.1982132159774 64.2233618425036 64.2483916193246 64.2733025839571 64.2980947744569 64.3227682294296 64.3473229880409 64.3717590900271 64.3960765757062 64.4202754859892 64.4443558623912 64.4683177470437 64.4921611827062 64.5158862127786 64.539492881314 64.5629812330312 64.5863513133286 64.609603168297 64.6327368447341 64.6557523901584 64.6786498528238 64.7014292817346 64.7240907266611 64.7466342381548 64.7690598675646 64.7913676670539 64.8135576896166 64.8356299890952 64.8575846201984 64.8794216385189 64.901141100553 64.9227430637192 64.9442275863778 64.9655947278518 64.986844548447 65.0079771094738 65.0289924732688 65.0498907032174 65.0706718637768 65.0913360204996 65.1118832400585 65.132313590271 65.1526271401249 65.1728239598052 65.1929041207208 65.2128676955323 65.2327147581811 65.2524453839183 65.2720596493352 65.2915576323943 65.3109394124616 65.3302050703389 65.3493546882981 65.368388350116 65.3873061411095 65.4061081481734 65.4247944598174 65.4433651662056 65.4618203591964 65.4801601323841 65.4983845811412 65.5164938026622 65.5344878960091 65.5523669621572 65.5701311040437 65.5877804266164 65.6053150368848 65.6227350439727 65.6400405591716 65.6572316959966 65.674308570244 65.6912713000499 65.7081200059516 65.7248548109503 65.741475840576 65.757983222954 65.7743770888747 65.7906575718641 65.8068248082576 65.8228789372758 65.8388201011027 65.8546484449667 65.870364117224 65.8859672694446 65.9014580565014 65.9168366366622 65.9321031716846 65.947257826914 65.9623007713852 65.9772321779269 65.99205222327 66.0067610881597 66.0213589574711 66.0358460203284 66.0502224702294 66.0644885051724 66.0786443277891 66.0926901454813 66.1066261705623 66.1204526204029 66.1341697175837 66.147777690051 66.1612767712794 66.1746672004394 66.187949222571 66.2011230887638 66.2141890563425 66.2271473890602 66.2399983572971 66.2527422382673 66.2653793162325 66.2779098827228 66.2903342367666 66.3026526851269 66.3148655425475 66.3269731320069 66.3389757849817 66.3508738417192 66.3626676515195 66.3743575730278];
		yi = linspace(min(y), max(y), k*96+1);
		ti = interp1(y, t, yi, 'cubic');
		DS.input=zeros(2, k*96+1);
		DS.output=zeros(1, k*96+1);
		for i = 1:k*96+1
			angle = ti(i)*pi/(16.0);
			radius = 6.5*(104-ti(i))/(104.0);
			input = radius*[sin(angle); cos(angle)];
			DS.input(:,i)=input;
			DS.output(:,i)=2
		end
		DS.input=[DS.input, -DS.input];
		DS.output=[DS.output, ones(1, k*96+1)];
	otherwise
		error(sprintf('Unknown data name: %s', dataName));
end

if ~isfield(DS, 'inputName')
	for i=1:size(DS.input,1)
		DS.inputName{i}=['input-', int2str(i)];
	end
end

if ~isfield(DS, 'outputName')
	outputNum=length(unique(DS.output));
	for i=1:outputNum
		DS.outputName{i}=['output-', int2str(i)];
	end
end

if nargout==2
	if ~strcmp(DS.dataName, 'digit')
		cvOpt=cvDataGen('defaultOpt');
		cvOpt.foldNum=2;
		cvOpt.cvDataType='full';
		cvData=cvDataGen(DS, cvOpt);	% Create CV data
		DS=cvData(1).TS;
		TS=cvData(1).VS;
	end
end

if showPlot
	if nargout==1, dsScatterPlot(DS); end
	if nargin==2
		subplot(211), dsScatterPlot(DS);
		subplot(212), dsScatterPlot(TS);
	end
end

% ======= Self demo
function selfdemo
mObj=mFileParse(which(mfilename));
strEval(mObj.example);
