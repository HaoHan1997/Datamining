%% ��������
clear
clc
WineReviewsImport_130k_v2;
%% ������Ե�Ƶ��
coun=tabulate(country);
prov=tabulate(province);
reg1=tabulate(region_1);
reg2=tabulate(region_2);
vari=tabulate(variety);
name=tabulate(taster_name);
twitter=tabulate(taster_twitter_handle);
xlswrite('frequency.xls',coun,'country');
xlswrite('frequency.xls',prov,'province');
xlswrite('frequency.xls',reg1,'region1');
xlswrite('frequency.xls',reg2,'region2');
xlswrite('frequency.xls',vari,'variety');
xlswrite('frequency.xls',name,'taster_name');
xlswrite('frequency.xls',twitter,'taster_twitter');
%% ��ֵ����price
max_price=nanmax(price);
min_price=nanmin(price);
mean_price=nanmean(price);
median_price=nanmedian(price);
quantile_price1=quantile(price,0.25,1);
quantile_price3=quantile(price,0.75,1);
miss_price=sum(ismissing(price));
%% ��ֵ���� points
max_points=nanmax(points);
min_points=nanmin(points);
mean_points=nanmean(points);
median_points=nanmedian(points);
quantile_points1=quantile(points,0.25,1);
quantile_points3=quantile(points,0.75,1);
miss_points=sum(ismissing(points));
%% ���ݿ��ӻ�
%% points
figure;
histogram(points);
title('points-ֱ��ͼ');
xlabel('point');
ylabel('Ƶ��');
figure;
qqplot(points);
title('points-QQͼ');
figure;
boxplot(points);
title('points-��ͼ');
set(gca,'XTickLabel',{' '});
%% price
figure;
histogram(price);
title('price-ֱ��ͼ');
xlabel('price');
ylabel('Ƶ��');
figure;
qqplot(price);
title('price-QQͼ');
figure;
boxplot(price);
title('price-��ͼ');
set(gca,'XTickLabel',{' '});
%% �޳�ȱʧ����,���ӻ�
rmprice=rmmissing(price);
figure;
histogram(rmprice);
title('price-ֱ��ͼ');
xlabel('price');
ylabel('Ƶ��');
figure;
qqplot(rmprice);
title('price-QQͼ');
figure;
boxplot(rmprice);
title('price-��ͼ');
set(gca,'XTickLabel',{' '});
%% �����Ƶ��ֵ���ȱʧֵ
most_fill_price=price;
most_fill_price(ismissing(price))=mode(price);
figure;
histogram(most_fill_price);
title('price-ֱ��ͼ');
xlabel('price');
ylabel('Ƶ��');
figure;
qqplot(most_fill_price);
title('price-QQͼ');
figure;
boxplot(most_fill_price);
title('price-��ͼ');
set(gca,'XTickLabel',{' '});
%% ͨ�����Ե���ع�ϵ���ȱʧֵ
linear_fill_price=price;
a=polyfit(points,price,1);
linear_fill_price(ismissing(price))=polyval(a,points(ismissing(price)));
figure;
histogram(linear_fill_price);
title('price-ֱ��ͼ');
xlabel('price');
ylabel('Ƶ��');
figure;
qqplot(linear_fill_price);
title('price-QQͼ');
figure;
boxplot(linear_fill_price);
title('price-��ͼ');
set(gca,'XTickLabel',{' '});
%% ͨ�������������ȱʧֵ
knnprice=price;
test_data=points(ismissing(price));
train_data=points(rmmissing(price));
train_label=rmmissing(price);
knnprice(ismissing(price))=knnclassify(test_data,train_data,train_label);
figure;
histogram(knnprice);
title('price-ֱ��ͼ');
xlabel('price');
ylabel('Ƶ��');
figure;
qqplot(knnprice);
title('price-QQͼ');
figure;
boxplot(knnprice);
title('price-��ͼ');
set(gca,'XTickLabel',{' '});

