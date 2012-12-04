clear all
close all
clc

I = imread('a1.jpg');
figure, imshow(I), title('I');

I = rgb2gray(I);
figure, imshow(I), title('Gray');

I = 255-I;
figure, imshow(I),title('Invert');

H = fspecial('average',5);
I = imfilter(I,H,'replicate');

figure, imshow(I), title('average');


I = im2bw (I, 130/255);
figure, imshow(I),title('BW');

J = bwareaopen(I,700,4);
figure, imshow(J),title('J');

%[L, num] = bwlabel(I, 4);
%figure, imshow(L), title('L');

for i=1:985
    areax = sum(sum(L==i))
    waitforbuttonpress
end

break

I = bwmorph(I,'skel',5);
figure,imshow(I),title('skel');

SE1 = [ 0 0 0 1 0 0;
        0 0 0 1 0 0;
        0 0 0 1 0 0;
        0 0 0 1 0 0;
        0 0 0 1 0 0;
        0 0 0 1 0 0;
        0 0 0 1 0 0;
        1 1 1 1 0 0;
        0 0 0 1 0 0;
        0 0 0 1 0 0;
        0 0 0 1 0 0;
        0 0 0 1 0 0;
        0 0 0 1 0 0;
        0 0 0 1 0 0;
        0 0 0 1 0 0;
        0 0 0 1 0 0;
        0 0 0 1 0 0;
        0 0 0 1 0 0;
        0 0 0 1 0 0;        
        0 0 0 1 0 0];
   
SE2 = 1 - SE1;
   
J = bwhitmiss(I,SE1,SE2);
figure, imshow(J);


[R C] = find(J==1);
figure(5)
for i=1:size(R,1)
    x = C(i);
    y = R(i);
    hold on
    plot(x,y,'*r');
    hold off
end