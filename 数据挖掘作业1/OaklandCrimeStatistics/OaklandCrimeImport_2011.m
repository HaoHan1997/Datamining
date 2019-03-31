%% �����ı��ļ��е����ݡ�
%
%    E:\MyWorkplace\DataMining\oakland-crime-statistics-2011-to-2016\records-for-2011.csv
%

%% ��ʼ��������
filename = 'E:\MyWorkplace\DataMining\oakland-crime-statistics-2011-to-2016\records-for-2011.csv';
delimiter = ',';
startRow = 2;
endRow = 180016;

%% ÿ���ı��еĸ�ʽ:
%   ��1: ���� (%C)
%	��2: �ı� (%s)
%   ��3: ���� (%C)
%	��4: ˫����ֵ (%f)
%   ��5: ���� (%C)
%	��6: ˫����ֵ (%f)
%   ��7: ���� (%C)
%	��8: ���� (%C)
%   ��9: ���� (%C)
%	��10: �ı� (%s)
formatSpec = '%C%s%C%f%C%f%C%C%C%s%[^\n\r]';

%% ���ı��ļ���
fileID = fopen(filename,'r');

%% ���ݸ�ʽ��ȡ�����С�
dataArray = textscan(fileID, formatSpec, endRow-startRow+1, 'Delimiter', delimiter, 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines', startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');

%% �ر��ı��ļ���
fclose(fileID);

%% ����������������б�������
Agency = dataArray{:, 1};
CreateTime = cellstr(dataArray{:, 2});
Location = dataArray{:, 3};
AreaId = dataArray{:, 4};
Beat = dataArray{:, 5};
Priority = dataArray{:, 6};
IncidentTypeId = dataArray{:, 7};
IncidentTypeDescription = dataArray{:, 8};
EventNumber = dataArray{:, 9};
ClosedTime = cellstr(dataArray{:, 10});


%% �����ʱ����
clearvars filename delimiter startRow endRow formatSpec fileID dataArray ans;