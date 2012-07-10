function [] = percentile_range(y)

r=prctile(y, [.1 99.9]);

set(gca, 'Ylim', r);


