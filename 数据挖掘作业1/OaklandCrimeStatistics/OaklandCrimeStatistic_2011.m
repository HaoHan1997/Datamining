%% ��������
OaklandCrimeImport_2011;
load CreateDate.mat
load ClosedDate.mat

%% ������Ե�Ƶ��
Agency_t=tabulate(Agency);
Location_t=tabulate(Location);
Beat_t=tabulate(Beat);
InctyTpeId_t=tabulate(IncidentTypeId);
InctyTypeDes_t=tabulate(IncidentTypeDescription);
xlswrite('CrimeTabulate_2011.xls',Agency_t,'Agency');
xlswrite('CrimeTabulate_2011.xls',Location_t,'Location');
xlswrite('CrimeTabulate_2011.xls',Beat_t,'Beat');
xlswrite('CrimeTabulate_2011.xls',InctyTpeId_t,'IncidentTypeId');
xlswrite('CrimeTabulate_2011.xls',InctyTypeDes_t,'IncidentTypeDescription');
%% ��ֵ����AreaId
max_AreaId=nanmax(AreaId);
min_AreaId=nanmin(AreaId);
mean_AreaId=nanmean(AreaId);
median_AreaId=nanmedian(AreaId);
quantile_AreaId_1=quantile(AreaId,0.25,1);
quantile_AreaId3=quantile(AreaId,0.75,1);
miss_AreaId=sum(ismissing(AreaId));
%% ��ֵ���� Priority
max_Priority=nanmax(Priority);
min_Priority=nanmin(Priority);
mean_Priority=nanmean(Priority);
median_Priority=nanmedian(Priority);
quantile_Priority_1=quantile(Priority,0.25,1);
quantile_Priority_3=quantile(Priority,0.75,1);
miss_Priority=sum(ismissing(Priority));
%% ���ݿ��ӻ�
%AreaId
figure;
histogram(AreaId);
title('AreaId-ֱ��ͼ');
xlabel('AreaId');
ylabel('Ƶ��');
figure;
qqplot(AreaId);
title('AreaId-QQͼ');
figure;
boxplot(AreaId);
title('AreaId-��ͼ');
set(gca,'XTickLabel',{' '});
%% Priority
figure;
histogram(Priority);
title('Priority-ֱ��ͼ');
xlabel('Priority');
ylabel('Ƶ��');
figure;
qqplot(Priority);
title('Priority-QQͼ');
figure;
boxplot(Priority);
title('Priority-��ͼ');
set(gca,'XTickLabel',{' '});
%% CreateTime
figure;
histogram(CreateDate);
title('CreateTime-ֱ��ͼ');
xlabel('CreateTime');
ylabel('Ƶ��');
% figure;
% qqplot(CreateDate);
% title('CreateTime-QQͼ');
% figure;
% boxplot(CreateDate);
% title('CreateTime-��ͼ');
% set(gca,'XTickLabel',{' '});
%% ClosedTime
figure;
histogram(ClosedDate);
title('ClosedTime-ֱ��ͼ');
xlabel('ClosedTime');
ylabel('Ƶ��');
% figure;
% qqplot(ClosedDate);
% title('ClosedTime-QQͼ');
% figure;
% boxplot(ClosedDate);
% title('ClosedTime-��ͼ');
% set(gca,'XTickLabel',{' '});
%% �޳�ȱʧ����,���ӻ�
rmAreaId=rmmissing(AreaId);
figure;
histogram(rmAreaId);
title('price-ֱ��ͼ');
xlabel('AreaId');
ylabel('Ƶ��');
figure;
qqplot(rmAreaId);
title('AreaId-QQͼ');
figure;
boxplot(rmAreaId);
title('AreaId-��ͼ');
set(gca,'XTickLabel',{' '});
%% �����Ƶ��ֵ���ȱʧֵ
most_fill_AreaId=AreaId;
most_fill_AreaId(ismissing(AreaId))=mode(AreaId);
figure;
histogram(most_fill_AreaId);
title('AreaId-ֱ��ͼ');
xlabel('AreaId');
ylabel('Ƶ��');
figure;
qqplot(most_fill_AreaId);
title('AreaId-QQͼ');
figure;
boxplot(most_fill_AreaId);
title('AreaId-��ͼ');
set(gca,'XTickLabel',{' '});
%% ͨ�����Ե���ع�ϵ���ȱʧֵ
linear_fill_AreaId=AreaId;
a=polyfit(Priority,AreaId,1);
linear_fill_AreaId(ismissing(AreaId))=polyval(a,Priority(ismissing(AreaId)));
figure;
histogram(linear_fill_AreaId);
title('AreaId-ֱ��ͼ');
xlabel('AreaId');
ylabel('Ƶ��');
figure;
qqplot(linear_fill_AreaId);
title('AreaId-QQͼ');
figure;
boxplot(linear_fill_AreaId);
title('AreaId-��ͼ');
set(gca,'XTickLabel',{' '});
%% ͨ�������������ȱʧֵ
knnAreaId=AreaId;
test_data=Priority(ismissing(AreaId));
train_data=Priority(rmmissing(AreaId));
train_label=rmmissing(AreaId);
knnAreaId(ismissing(AreaId))=knnclassify(test_data,train_data,train_label);
figure;
histogram(knnAreaId);
title('AreaId-ֱ��ͼ');
xlabel('AreaId');
ylabel('Ƶ��');
figure;
qqplot(knnAreaId);
title('AreaId-QQͼ');
figure;
boxplot(knnAreaId);
title('AreaId-��ͼ');
set(gca,'XTickLabel',{' '});

