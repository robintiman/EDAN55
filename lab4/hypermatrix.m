function [H, D] = hypermatrix(nodes)
H = zeros(numel(nodes), numel(nodes));
D = zeros(numel(nodes), numel(nodes));

for i=1:numel(nodes)
    count = 0;
    % Create H
    if (numel(nodes{i}) > 0)
        indices = unique(nodes{i});
        count = histcounts(nodes{i}, numel(indices));
        H(i, indices) = count/sum(count);
    end
    % Create D
    if (sum(count) == 0)
        D(i, :) = 1/numel(nodes);
    end
end
