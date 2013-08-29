function [] = writedelim(x, namey, delim)
%This function acts as write.delim from R(kindof)
%It takes a structure and puts the fields into a delimited text file


%open file
fid=fopen(namey, 'w');

heady=fields(x);

fprintf(fid, '%s\n', strjoin(heady', delim));

for i=1:length(x)
    for j=1:length(heady)
        if j~=1
            fprintf(fid, delim);
        end
        if (ischar(x(i).(heady{j})))
            fprintf(fid, '%s', x(i).(heady{j}));
        else
            fprintf(fid, '%s', num2str(x(i).(heady{j})));
        end                
    end
    fprintf(fid, '\n');
end

fclose(fid);

