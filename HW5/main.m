close all; clear; clc;

k = 3;     
n_data = 1500; 
density = 50;

data_centr = [0,0;10,30;-20,40];
col1 = mvnrnd(data_centr(1,:), eye(2) * density, 500);
col2 = mvnrnd(data_centr(2,:), eye(2) * density, 500);
col3 = mvnrnd(data_centr(3,:), eye(2) * density, 500);
data = [col1;col2;col3];

[cluster, centr] = m_kmeans(k, data'); 

[cluster_mT, centr_m] = spec_kmeans(k, data); 
cluster_m = cluster_mT';


% visualize the clustering
hold on;
scatter(data(:,1), data(:,2), 600,cluster,'.');
% scatter(centr(1,:),centr(2,:),'xk','LineWidth',1.5);
title('clusters after k-mean, k=5');
saveas(gcf, 'kmeans_cluster.png');

% % visualize the clustering
scatter(data(:,1), data(:,2), 600,cluster_m,'.');
% scatter(centr_m(1,:),centr_m(2,:),'xk','LineWidth',1.5);
hold on;
title('Spectral clusters after k-mean, k=5');
saveas(gcf, 'spec_kmeans_cluster.png');