clear;
clc;
close all;

load('USPS.mat');
pca_error = [10, 50, 100, 200];
n_errors = length(pca_error);
image_size=size(A,2);
errors_rslt = zeros(n_errors,1);
img_1  = zeros(n_errors,image_size);
img_2 = zeros(n_errors,image_size);

for i=1:n_errors
    [coeff, score] = pcares(A, pca_error(i));
    errors_rslt(i) = sum(coeff.^2,'all');
    img_1 = score(100, :);
    img_2 = score(2000, :);

    img_1  = reshape(img_1,sqrt(image_size),[]);
    img_2  = reshape(img_2,sqrt(image_size),[]);
    
    f = figure();
    imshow(img_1','InitialMagnification','fit');
    A1=squeeze(img_1)';
    title(['Image 1, p=', num2str(pca_error(i))]);
    name=['img1_pca',num2str(pca_error(i)),'.png'];
    saveas(f,name);
    
    f = figure();
    imshow(img_2','InitialMagnification','fit');
    A2=squeeze(img_2)';
    name=['img2_pca',num2str(pca_error(i)),'.png'];
    title(['Image 2, p=', num2str(pca_error(i))]);
    saveas(f,name);
end

plot(errors_rslt);
xlabel('pca components');
ylabel('errors');
grid on;
set(gcf,'WindowStyle','normal','Position', [200,200,640,360]);
saveas(gcf,"errors.png")