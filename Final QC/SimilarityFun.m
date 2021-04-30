function [HistDist]=SimilarityFun(image1, image2)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
%   image1和image2为待匹配的两张图片，需要在主程序中由imread（）读入，例如：image=imread('123.jpg');
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

