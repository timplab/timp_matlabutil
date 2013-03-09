function [] = outplot(fhandle, param)
%This function takes in a figure handle and spits out a plotted file

if nargin<2
  param=struct;
end

if ~isfield(param, 'plotloc')
    param.plotloc='~/Dropbox/temp/';
end

if ~isfield(param, 'plotname')
    param.plotname='try';
end

if ~isfield(param, 'plottype')
    param.plottype='png';
end

%If Dir doesn't exist, create it
if (exist(param.plotloc)~=7) 
    mkdir(param.plotloc);
end

filename=[param.plotloc, param.plotname, '.', param.plottype];

set(fhandle, 'PaperOrientation', 'landscape', 'PaperPosition', [.5 .5, 10.5, 8]);
print(fhandle, ['-d', param.plottype], filename);



    

