clear
close all
clc

InputImage=imread('photo/normal1.jpg');
plate = primary_location(InputImage);
b=rgb2gray(plate); 
d=imbinarize(b); %���ƶ�ֵ��
imwrite(d,'binarize.jpg')
d=remove_border(d); %ȥ�߿�
imwrite(d,'remove.jpg')
figure,imshow(d)
title('Remove top and bottom border and rivet image')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h=fspecial('average',3); %ƽ������
d=imbinarize(round(filter2(h,d)));%ʹ��ָ�����˲���h��h����d����ֵ�˲�
%���ͻ�ʴ
se=[1 0;0 1];
[m,n]=size(d);%������Ϣ����
%0.365��0.235���Ǿ���ֵ
if bwarea(d)/m/n>=0.365
    d=imerode(d,se);
elseif bwarea(d)/m/n<=0.235
    d=imdilate(d,se);
end
%��ȥ���ַ�֮��Ķ��ಿ��
d=remove_extra(d);
%�ָ����һ���߸��ַ�
[word1,d]=char_seg(d); %��߿�
[word1,d]=char_seg(d); %��һ���ַ�
[word2,d]=char_seg(d);
[word3,d]=char_seg(d); %���Ƶڶ����ַ��͵������ַ�֮��ĵ�
[word3,d]=char_seg(d); %�������ַ�
[word4,d]=char_seg(d);
[word5,d]=char_seg(d);
[word6,d]=char_seg(d);
[word7,d]=char_seg(d);
%��ÿ���ַ���С��һ������ģ���Сƥ��,ͨ�óߴ�[40, 20]
word1=imresize(word1,[40 20]);
word2=imresize(word2,[40 20]);
word3=imresize(word3,[40 20]);
word4=imresize(word4,[40 20]);
word5=imresize(word5,[40 20]);
word6=imresize(word6,[40 20]);
word7=imresize(word7,[40 20]);
%%%%%%%%%%%����ģ���
Chinese = LoadChinese();
Letter = LoadLetter();
Digit = LoadDigit();
%ʶ��
recog1 = identityChinese(Chinese, word1); recognition(1)=recog1;
recog2 = identityLetter(Letter, word2);  recognition(2)=recog2;
recog3 = identityDigitLetter(Digit, word3);  recognition(3)=recog3;
recog4 = identityDigitLetter(Digit, word4);  recognition(4)=recog4;
recog5 = identityDigitLetter(Digit, word5);  recognition(5)=recog5;
recog6 = identityDigitLetter(Digit, word6);  recognition(6)=recog6;
recog7 = identityDigitLetter(Digit, word7);  recognition(7)=recog7;
%������
msgbox({'ʶ����';recognition});
