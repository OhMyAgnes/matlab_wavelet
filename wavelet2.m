
x = imread('./14/02.bmp');  
subplot(2,2,1);image(x);
colormap(map);
xlabel('(a)ԭʼͼ��');
axis square

%����С���任��ͼ����н��봦��
[thr,sorh,keepapp]=ddencmp('den','wv',x);     %��ó����ȱʡ����
x1=wdencmp('gbl',x,'sym4',2,thr,sorh,keepapp);%ͼ����н��봦��
x2 = waverec2(nc,s,'coif3');
subplot(2,2,3);image(x1);
colormap(map);
xlabel('(c)��һ��ȥ��ͼ��');
axis square

subplot(2,2,4);image(x2);
colormap(map);
xlabel('(d)�ڶ���ȥ��ͼ��');


imwrite(x2,'./14/02_1.bmp')
