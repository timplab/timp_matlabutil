function [] = xrange_10per()

xedges=get(gca, 'xlim');

set(gca, 'xlim', [xedges(1)-range(xedges)*.1 xedges(2)+range(xedges)*.1]);


