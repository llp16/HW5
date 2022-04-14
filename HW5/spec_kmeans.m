function [cluster, centr] = spec_kmeans(k, X)
    [~, ~, V] = svd(X);
    [n, ~] = size(V);
    clip = min(n, k);
    t_v = V(1:clip, :);
    pre_data = (X * t_v)';
    [cluster, centr] = m_kmeans(k, pre_data');
end
