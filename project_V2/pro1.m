clear all
close all
clc
I=imread('a1.jpg');
% figure,imshow(I),title('clp');
 J=rgb2gray(I);
% figure,imshow(J),title('Gray');
    IV=255-J;
% figure,imshow(IV),title('invert');
 BW=im2bw(IV,50/255);
 %figure,imshow(BW),title('BW');
Idelete=bwareaopen(BW,200);
figure,imshow(Idelete),title('delete');

L=bwlabel(Idelete);
S=regionprops(Idelete);
BOX=S(17).BoundingBox;

figure,imshow(BOX),title(BOX);
