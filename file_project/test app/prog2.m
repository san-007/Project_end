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
IA = I;


BW = im2bw (I, 130/255);
figure, imshow(BW),title('BW');

BW = bwareaopen(BW,700,4);
figure, imshow(BW),title('BW after bwareaopen');

L = bwlabel(BW);
s  = regionprops(BW, 'all');
 
BW2 = BW;
 
%  for i=17:size(s,1)
%     figure(7)
%     imshow(s(i).Image);
%     title([num2str(i),':',num2str(s(i).Area)]);
%     
%     
%     figure(8)
%     II = L==i;
%     imshow(II);
%     
%     if s(i).Area > 8000
%         BW2(L==i) = 0;
%     end
%     
%     %waitforbuttonpress
%  end
%  
 
 figure, imshow(BW2);
 
 figure, imshow(IA), title('IA');
 IABW=im2bw(IA,90/255);
 figure,imshow(IABW),title('IABW');
 
 IABWcrop = IABW(1138:1156,193:434);
 figure,imshow(IABWcrop),title('IABWcrop');
 
 L = IABWcrop;
 
 for i=0:30
      for j = 0:4
        W = L(:, 55*j+1 : 55*j + 55 );
       % W = L(1+(100*i):100*(i+1), 60+(55*j+1):60+(53*(j+1)));
        figure(11)
        %subplot(1,5,j+1 )
        subplot(5,5,i*5 + j+1 )
        imshow(W);
        count1 = sum(sum(W));
        if count1 > 700
            answer = 1;
        else
            answer = 0;
        end
        title(['white pixel =',num2str(count1),' answer=',num2str(answer)]);
      end
 end
     