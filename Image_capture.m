Need to download theImage Acquisition Toolbox Support Package for OS Generic Video Interface 作者： MathWorks Image Acquisition Toolbox Team first

Use ‘’macvideo instead of ‘’winvideo if using Mac OS

Use   cam_info = imaqhwinfo('winvideo')   to check if any error occur

%%Take color picture
vid=videoinput('winvideo',1);
preview(vid);
frame=getsnapshot(vid);
figure;
imshow(frame); 

%%Take black and white picture
clear all;
vid=videoinput('macvideo',1);
preview(vid);
set(vid,'ReturnedColorSpace','grayscale');
frame=getsnapshot(vid);

figure;
imshow(frame);
