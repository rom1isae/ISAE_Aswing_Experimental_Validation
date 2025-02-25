
function Wing = Get_polars(Wing,V,alpha_min,alpha_max)

viscosity = 1.5111E-5;

for j =1:length(Wing.chord)
    c = Wing.chord(j);
    Re = floor(c*V/viscosity);
    if Re > 10000
        system('rm Polars_Temp')
        fid = fopen('Polars_Temp.sh','r');        % Open File to read
        replaceline = num2str(Re);      % Line to replace
        replaceline2 = num2str(alpha_min);
        replaceline3 = num2str(alpha_max);
        i = 1;
        tline = 's';
        A = {[]};
    while ischar(tline)
    tline = fgetl(fid);
    if ~isempty(strfind(tline,'#Reynold')) % find '@controls'
        A{i}=tline;
        A{i+1} = replaceline;               % replace line
        tline = fgetl(fid);
        i = i+1;
    elseif ~isempty(strfind(tline,'#alpha_min')) 
        A{i}=tline;
        A{i+1} = replaceline2;               % replace line
        tline = fgetl(fid);
        i = i+1;
    elseif ~isempty(strfind(tline,'#alpha_max')) 
        A{i}=tline;
        A{i+1} = replaceline3;               % replace line
        tline = fgetl(fid);
        i = i+1;
    else
        A{i}=tline;
    end
    i = i+1;
end
fclose(fid);
fid2=fopen('Polars_Temp.sh','w');            % Open file to write
for i=1:length(A)-1
    fprintf(fid2,['%s',char([13,10])],A{i});
end
fclose(fid2);
system('dos2unix Polars_Temp.sh')
system('./Polars_Temp.sh')
I_last = j;
Polars{j} = readtable('Polars_Temp','NumHeaderLines',12)
[Wing.alpha(j),Wing.dCLda(j),Wing.Cdf(j),Wing.Cdp(j)] = ...
     Polars_analysis(Polars{j});
    else
       Wing.alpha(j) = Wing.alpha(I_last);
       Wing.dCLda(j) = Wing.dCLda(I_last);
       Wing.Cdf(j) = Wing.Cdf(I_last);
       Wing.Cdp(j) = Wing.Cdp(I_last);
      
        
    end

end

end