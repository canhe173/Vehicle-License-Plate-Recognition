function Chinese  = LoadChinese()

Chinese(:,:,1) = imresize(imread('model/��.bmp'),[40,20],'bilinear');  % ��
Chinese(:,:,2) = imresize(imbinarize(rgb2gray(imread('model/��.bmp'))),[40,20],'bilinear');  % ��
Chinese(:,:,3) = imresize(imbinarize(rgb2gray(imread('model/��.bmp'))),[40,20],'bilinear');  % ��
Chinese(:,:,4) = imresize(imbinarize(rgb2gray(imread('model/��.bmp'))),[40,20],'bilinear');  % ��
Chinese(:,:,5) = imresize(imbinarize(rgb2gray(imread('model/³.bmp'))),[40,20],'bilinear');  % ³
Chinese(:,:,6) = imresize(imbinarize(rgb2gray(imread('model/��.bmp'))),[40,20],'bilinear');  % ��
Chinese(:,:,7) = imresize(imread('model/��.bmp'),[40,20],'bilinear');  % ��
Chinese(:,:,8) = imresize(imbinarize(rgb2gray(imread('model/��.bmp'))),[40,20],'bilinear');  % ��
Chinese(:,:,9) = imresize(imbinarize(rgb2gray(imread('model/��.bmp'))),[40,20],'bilinear');  % ��
Chinese(:,:,10) = imresize(imbinarize(rgb2gray(imread('model/��.bmp'))),[40,20],'bilinear');  % ��
Chinese(:,:,11) = imresize(imbinarize(rgb2gray(imread('model/ԥ.bmp'))),[40,20],'bilinear');  % ԥ

end

