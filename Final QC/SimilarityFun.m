function [HistDist]=SimilarityFun(image1, image2)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%   image1��image2Ϊ��ƥ�������ͼƬ����Ҫ������������imread�������룬���磺image=imread('123.jpg');
gray1 = rgb2gray(image1);
gray2 = rgb2gray(image2);
[Count1,x]=imhist(gray1);
[Count2,x]=imhist(gray2);
Sum1=sum(Count1);Sum2=sum(Count2);
Sumup = sqrt(Count1.*Count2);
SumDown = sqrt(Sum1*Sum2);
Sumup = sum(Sumup);
HistDist=1-sqrt(1-Sumup/SumDown);
end

