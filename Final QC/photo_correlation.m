clear all;
%%%%%%%%%%%%%启动摄像图，拍摄工件照片，两次照片之间间隔pause_time秒%%%%%%%%%%
pause_time=1;  %两张照片拍摄间隔时间
Sm_0=0.8;  %认可的照片相似度数值
vid=videoinput('winvideo',1);
for jj=1:6
    Fm{jj}=getsnapshot(vid); %拍摄照片，
    pause(pause_time); %暂停pause_time秒，接着拍下一张照片，共拍摄6张
end
%%%%%%%%%%读入工件六个面的标准照片，前后左右上下，存入Im{}结构体变量中%%%%%%%%
Im{1}=imread('front.jpg');
Im{2}=imread('back.jpg');
Im{3}=imread('up.jpg');
Im{4}=imread('down.jpg');
Im{5}=imread('right.jpg');
Im{6}=imread('left.jpg');
%%%%%%%%%%%%调用SimilarityFun函数，进行相似度计算%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:6
    for j=1:6
       [Dm(i,j)]=SimilarityFun(Fm{i},Im{j});
    end
    Sm(i)=max(Dm(i,:));
end
%%%%输出结果，六个相似度数值均大于给定相似度值，认为工件合格%%%%%%%%%%%%%%%%%
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
