load facets;
x = imread('./14/02.bmp');  
subplot(2,2,1);image(x);
colormap(map);
xlabel('(a)ԭʼͼ��');
axis square

%�������ͼ���ȥ�봦��
%��С������coif3��x����2��С���ֽ�
[c,s] = wavedec2(x,2,'coif3');
%��ȡС���ֽ��е�һ��ĵ�Ƶͼ�񣬼�ʵ���˵�ͨ�˲�ȥ��
%���ó߶�����
n = [5,5];
%������ֵ����p
p = [52,52];
%�����������Ƶϵ��������ֵ����
nc = wthcoef2('h',c,s,n,p,'s');
nc = wthcoef2('v',nc,s,n,p,'s');
nc = wthcoef2('d',nc,s,n,p,'s');
%���µ�С���ֽ�ṹ[c,s]�����ع�
x1 = waverec2(nc,s,'coif3');
subplot(2,2,3);image(x1);
colormap(map);
xlabel('(c)��һ��ȥ��ͼ��');
axis square
%��nc�ٴν����˲�ȥ��
xx = wthcoef2('v',nc,s,n,p,'s');
x2 = waverec2(xx,s,'coif3');
subplot(2,2,4);image(x2);
colormap(map);
xlabel('(d)�ڶ���ȥ��ͼ��');
