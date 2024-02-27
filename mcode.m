clc
clear 
close all

%read image
filename='PIC 4.jpg';
img=imread(filename);

%convert the image to grayscale level

gray=rgb2gray(img);


figure(1)
imshow(img)
title('RGB image')

figure(2)
imshow(gray)
title('RGB image')

%compute the gray scale profile along f3
c=improfile;

%save the figure
plot(c)
xlabel('Pixel Number')
ylabel('Grayscale Value')

%compute the start and end point
midpoint=floor(length(c)/2);
minvalue1=255;

cc=c(1:midpoint);

%To estimate the value of Ps and Pe
for i =1:length(cc)  %loop through the grayscale profile
   
   if cc(i) < minvalue1
      minvalue1=cc(i); 
      minindex1=i;
   end
 
end


cc=c(midpoint+1:end);
minvalue2=255;
%To estimate the value of Ps and Pe
for i =midpoint+1:length(c)  %loop through the grayscale profile
   
   if c(i) < minvalue2
      minvalue2=c(i); 
      minindex2=i;
   end
 
end

hold on

plot(minindex1,minvalue1, 'o', 'MarkerFaceColor','b')

hold on

plot(minindex2,minvalue2, 'o', 'MarkerFaceColor','r')

legend('Profile','Ps','Pe')

s=split(filename,'.');
profilefilename=strcat(s{1},'_profile','.fig');

%Matching
%Euclidean distance in the Feature Space
distance = sqrt((minindex1-minindex2)^2 + (minvalue1-minvalue2)^2)

t=strcat('Observe Profile along F3',' distance = ',num2str(distance));
title(t)


savefig(profilefilename)
