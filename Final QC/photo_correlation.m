clear all;
%%%%%%%%%%%%%��������ͼ�����㹤����Ƭ��������Ƭ֮����pause_time��%%%%%%%%%%
pause_time=1;  %������Ƭ������ʱ��
Sm_0=0.8;  %�Ͽɵ���Ƭ���ƶ���ֵ
vid=videoinput('winvideo',1);
for jj=1:6
    Fm{jj}=getsnapshot(vid); %������Ƭ��
    pause(pause_time); %��ͣpause_time�룬��������һ����Ƭ��������6��
end
%%%%%%%%%%���빤��������ı�׼��Ƭ��ǰ���������£�����Im{}�ṹ�������%%%%%%%%
Im{1}=imread('front.jpg');
Im{2}=imread('back.jpg');
Im{3}=imread('up.jpg');
Im{4}=imread('down.jpg');
Im{5}=imread('right.jpg');
Im{6}=imread('left.jpg');
%%%%%%%%%%%%����SimilarityFun�������������ƶȼ���%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:6
    for j=1:6
       [Dm(i,j)]=SimilarityFun(Fm{i},Im{j});
    end
    Sm(i)=max(Dm(i,:));
end
%%%%���������������ƶ���ֵ�����ڸ������ƶ�ֵ����Ϊ�����ϸ�%%%%%%%%%%%%%%%%%
temp=(Sm>Sm_0);
Judge=1;
for kk=1:6
    Judge=Judge*temp(kk);
end
if Judge==1
    display('The product is ok!');
else
    display('The product is not ok!');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
