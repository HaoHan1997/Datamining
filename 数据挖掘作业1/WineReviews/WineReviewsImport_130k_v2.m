%% �����ı��ļ��е����ݡ�
%    E:\MyWorkplace\DataMining\wine-reviews\winemag-data-130k-v2.csv
%% ��ʼ��������
filename = 'E:\MyWorkplace\DataMining\wine-reviews\winemag-data-130k-v2.csv';
delimiter = ',';
startRow = 2;

%% ÿ���ı��еĸ�ʽ:
%   ��1: ��� ˫����ֵ (%f)
%	��2: ���� ���� (%C)
%   ��3: ���� �ı� (%q)
%	��4: Ʒ�� �ı� (%q)
%   ��5: �÷� ˫����ֵ (%f)
%	��6: �۸� ˫����ֵ (%f)
%   ��7: ���� (%C)
%	��8: ���� (%C)
%   ��9: ���� (%C)
%	��10: ���� (%C)
%   ��11: ���� (%C)
%	��12: �ı� (%q)
%   ��13: ���� (%C)
%	��14: �ı� (%q)
formatSpec = '%f%C%q%q%f%f%C%C%C%C%C%q%C%q%[^\n\r]';

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
taster_name = dataArray{:, 10};
taster_twitter_handle = dataArray{:, 11};
title1 = cellstr(dataArray{:, 12});
variety = dataArray{:, 13};
winery = cellstr(dataArray{:, 14});

%% �����ʱ����
clearvars filename delimiter startRow formatSpec fileID dataArray ans;