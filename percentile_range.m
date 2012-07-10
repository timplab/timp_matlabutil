function [] = percentile_range1(y)

r=prctile(y, [.1 99.9]);

set(gca, 'Ylim', r);


