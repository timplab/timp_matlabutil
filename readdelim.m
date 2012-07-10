function [data] = readdelim1(namey, delim)
%This function acts as read.delim from R(kindof)
%It reads in a delimited file, and puts the strings/numbers into a
%structure defined by the header line.  It assumes simple file orientation


%open file
fid=fopen(namey);

%Load in first line
headline=fgetl(fid);
%Parse first line
header=textscan(headline, '%s', 'delimiter', delim);
%get num columns
cnum=length(header{1});


%init array
for i=1:cnum
    dataarray{i}={};
end

%Init string/nostring var
stringy=false(13,1);

%Read in next line
readline=fgetl(fid);

%While line is not EOF
while ischar(readline)
    readin=textscan(readline, '%s', 'delimiter', delim);
    
    for i=1:cnum
        stringy(i)=isempty(str2num(readin{1}{i}))|stringy(i);
        dataarray{i}=[dataarray{i} readin{1}{i}];
    end
    readline=fgetl(fid);
end

%this is poorly written - I shouldn't have to loop through the data
%multiple times, but I will use it for now
%The problem is I need to determine if a column is strings or numbers, and
%I have to first check all values to see if there are any strings, or
%structure won't work.

%Now pull in the data to a structure
for i=length(dataarray{1}):-1:1
    for j=1:cnum
        if stringy(j)
            data(i).(header{1}{j})=dataarray{j}{i};
        else
            data(i).(header{1}{j})=str2num(dataarray{j}{i});
        end
    end
end

    


    

