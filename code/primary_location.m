function [OutputImage] = primary_location(InputImage)

GrayImage=rgb2gray(InputImage);  %convert to grayimage
filter = fspecial('gaussian',5,3);  % ��˹ģ��
blurred = imfilter(GrayImage,filter,'replicate'); 
Gray = edge(blurred, 'roberts','vertical');
imwrite(Gray,'edge.jpg')
operater1 = [1 ; 1 ; 1];
pictureErode = imerode(Gray, operater1); %��ʴ����
operater2 = strel('rectangle', [24, 24]);
pictureclose = imclose(pictureErode, operater2); %ͼ����࣬���ͼ��
pictureCut = bwareaopen(pictureclose, 2000);  %remove area <2000
[y,x]=size(pictureCut);
picture=double(pictureCut);
blue_y=zeros(y,1);
for i=1:y
    for j=1:x
        if(picture(i,j,1)==1) %���myIͼ������Ϊ��i��j����ֵΪ1����������ɫΪ��ɫ��blue_y��1
            blue_y(i,1)= blue_y(i,1)+1;
        end
    end
end
[~, MaxY]=max(blue_y); %tempΪ����blue_y��Ԫ���е����ֵ��MaxYΪ��ֵ������
%Y����������ȷ��
Image_y1=MaxY;
while ((blue_y(Image_y1,1)>=5)&&(Image_y1>1))
    Image_y1=Image_y1-1;
end
Image_y2=MaxY;
while ((blue_y(Image_y2,1)>=5)&&(Image_y2<y))
    Image_y2=Image_y2+1;
end
InputImage=InputImage(Image_y1:Image_y2,:,:);
%X����������ȷ��
blue_x=zeros(1,x);
for j=1:x
    for i=Image_y1:Image_y2
        if(picture(i,j,1)==1)
            blue_x(1,j)= blue_x(1,j)+1;
        end
    end
end
Image_x1=1;
while ((blue_x(1,Image_x1)<3)&&(Image_x1<x))
    Image_x1=Image_x1+1;
end
Image_x2=x;
while ((blue_x(1,Image_x2)<3)&&(Image_x2>Image_x1))
    Image_x2=Image_x2-1;
end
if (Image_x1<=1)
    Image_x1=1;
else
    Image_x1=Image_x1-1;
end
Image_x2=Image_x2+1;
OutputImage=InputImage(:,Image_x1:Image_x2,:);
figure
imshow(OutputImage);
title('Cropped license plate image');
end

