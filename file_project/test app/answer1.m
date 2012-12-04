clear all
close all
clc

I = imread('a3.jpg');
figure(1), imshow(I), title('color');

J = rgb2gray(I);
figure(2), imshow(J), title('gray');

K = im2bw(J);
figure(3), imshow(K), title('bw');

L = 1-K;
figure(4), imshow(L), title('invert');

for i=0:4
    for j = 0:4
        W = L(1+(100*i):100*(i+1), 60+(53*j):60+(53*(j+1)));
        figure(5)
        subplot(5,5,i*5 + j+1 )
        imshow(W);
        count1 = sum(sum(W));
        if count1 > 1000
            answer = 1;
        else
            answer = 0;
        end
        title(['white pixel =',num2str(count1),' answer=',num2str(answer)]);
        
    end
end