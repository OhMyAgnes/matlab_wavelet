
x = imread('./14/02.bmp');  
subplot(2,2,1);image(x);
colormap(map);
xlabel('(a)原始图像');
axis square

%利用小波变换对图象进行降噪处理
[thr,sorh,keepapp]=ddencmp('den','wv',x);     %获得除噪的缺省参数
x1=wdencmp('gbl',x,'sym4',2,thr,sorh,keepapp);%图象进行降噪处理
x2 = waverec2(nc,s,'coif3');
subplot(2,2,3);image(x1);
colormap(map);
xlabel('(c)第一次去噪图像');
axis square

subplot(2,2,4);image(x2);
colormap(map);
xlabel('(d)第二次去噪图像');


imwrite(x2,'./14/02_1.bmp')
