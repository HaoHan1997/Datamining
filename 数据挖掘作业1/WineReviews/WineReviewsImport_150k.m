%% �����ı��ļ��е����ݡ�
%    E:\MyWorkplace\DataMining\wine-reviews\winemag-data_first150k.csv

%% ��ʼ��������
filename = 'E:\MyWorkplace\DataMining\wine-reviews\winemag-data_first150k.csv';
delimiter = ',';
startRow = 2;

%% ÿ���ı��еĸ�ʽ:
%   ��1: ˫����ֵ (%f)
%	��2: ���� (%C)
%   ��3: �ı� (%q)
%	��4: �ı� (%q)
%   ��5: ˫����ֵ (%f)
%	��6: ˫����ֵ (%f)
%   ��7: ���� (%C)
%	��8: ���� (%C)
%   ��9: ���� (%C)
%	��10: ���� (%C)
%   ��11: �ı� (%q)
formatSpec = '%f%C%q%q%f%f%C%C%C%C%q%[^\n\r]';

%% ���ı��ļ���
fileID = fopen(filename,'r');

%% ���ݸ�ʽ��ȡ�����С�
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines' ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');

%% �ر��ı��ļ���
fclose(fileID);

%% ����������������б�������
VarName1 = dataArray{:, 1};
country = dataArray{:, 2};
description = cellstr(dataArray{:, 3});
designation = cellstr(dataArray{:, 4});
points = dataArray{:, 5};
price = dataArray{:, 6};
province = dataArray{:, 7};
region_1 = dataArray{:, 8};
region_2 = dataArray{:, 9};
variety = dataArray{:, 10};
winery = cellstr(dataArray{:, 11});

%% �����ʱ����
clearvars filename delimiter startRow formatSpec fileID dataArray ans;