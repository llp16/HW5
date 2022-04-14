% k: the number of cluster, P: M by N matric of points
function [ cluster, centr ] = m_kmeans( k, P )

dim_p = size(P, 1);
num_p = size(P, 2);

centr_idx = randperm(num_p, k);
centr = P(:, centr_idx);

cluster = zeros(1, num_p);
pre_clus = cluster;

iter = 0;
stop = false;

while stop == false
    for p_i = 1:num_p
        dist = zeros(1,k);
        for c_i = 1:k
            dist(c_i) = norm(P(:, p_i)-centr(:, c_i));
        end
        [~, clus_p] = min(dist);
        cluster(p_i) = clus_p;
    end

    centr = zeros(dim_p, k);
    for c_i = 1:k
        centr(:, c_i) = mean(P(:, cluster==c_i), 2);
    end
    
    if cluster == pre_clus
        stop = true;
    end

    pre_clus = cluster;
    iter = iter + 1;
end









