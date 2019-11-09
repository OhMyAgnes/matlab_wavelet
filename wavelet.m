close all;
clear;
clc;
%����ͼ��
Image1=imread("image1.bmp");
Image2=imread("image2.bmp");
%��ʾͼ��
figure
subplot(121),imshow(Image1),title("ģ��ͼ��1");
subplot(122),imshow(Image2),title("ģ��ͼ��2");
%subplot(133),imshow(I3),title("�ϳɺ�ͼ��");

%ca ��Ƶ���־���
% 'h' ��ˮƽ����
% 'v' �Ǵ�ֱ����
% 'd' �ǶԽǷ���
[ca1x,ch1x,cv1x,cd1x]=dwt2(Image1,'haar');
[ca2x,ch2x,cv2x,cd2x]=dwt2(ca1x,'haar');%M=4 ����С���任 2��

[ca1y,ch1y,cv1y,cd1y]=dwt2(Image2,'haar');
[ca2y,ch2y,cv2y,cd2y]=dwt2(ca1y,'haar');%M=4

%ģ�������ǵ�Ƶ�ʲ��֣��������Ҫ��ԭϸ����Ҫ����Ƶ���ֻ�ԭ��
%�������Ͻǲ��ּ򵥵�ƽ�������ಿ�ֽ���ȡmaxֵ��

%����
ca2z=(ca2x+ca2y)./2; %2�׵�Ƶ ����

ch2z=max(ch2x,ch2y);
cv2z=max(cv2x,cv2y);
cd2z=max(cd2x,cd2y);
ca1z =idwt2(ca2z,ch2z,cv2z,cd2z,'haar');


ch1z=max(ch1x,ch1y);
cv1z=max(cv1x,cv1y);
cd1z=max(cd1x,cd1y);
Oimage=idwt2(ca1z,ch1z,cv1z,cd1z,'haar');
OI=uint8(Oimage);

figure,
imshow(OI);

function out=max(a,b) %%shape of a should equal shape of b
    [i,j]=size(a);
    out=zeros(i,j);
    for x=1:i
        for y=1:j
             if abs(a(x,y))>abs(b(x,y))
                 out(x,y)=a(x,y);
             else
                 out(x,y)=b(x,y);
             end
        end
    end
end
