[y,fs] = audioread("saxriff.wav");

img1 = imread("landscape.bmp");
img2 = imread("MRI.bmp");
img3 = imread("MRIbin.bmp");
fil = fileread("lyrics.txt");
[cona, pila] = audioinfo();

createHistogram(y(:,1),1);
calcEntropy(y(:,1));