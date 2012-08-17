function [raw] = datatrim(raw, param)
%Trim or Winsorize probes
%   Detailed explanation goes here

if nargin<2
  param=struct;
end

if ~isfield(param, 'per')
    param.per=0.05;
end

if ~isfield(param, 'winsor')
    param.winsor=false;
end

if ~isfield(param, 'quantile')
    param.quantile=false;
end

if ~isfield(param, 'col')
    param.col=1;
end

data=raw(:,param.col);

if (param.quantile)
    %Could use quantile - which is more discrete, doesn't assume normal, but
    %pretty much *will* exclude a value
    prc=quantile(data, [param.per 1-param.per]);
else 
    %Or can assume normal distribution
    prc=icdf('Normal', [param.per 1-param.per], mean(data), std(data));
end

%Make a boolean of it
below=data<prc(1);
above=data>prc(2);

%If winsorizing - set outliers to the cutoff
if (param.winsor) 
    raw(below, param.col)=prc(1);
    raw(above, param.col)=prc(2);
else
    %If trimming, just remove
    raw=raw((~above)&(~below),:);  
end


end



