
function Wing = Get_polars(Wing,V,alpha_min,alpha_max,Eliptical_status)

viscosity = 1.5111E-5;
if (Eliptical_status)
for j =1:length(Wing.chord)

    if j>1
        if (Wing.chord(j)/Wing.chord(j-1)) > 0.95
            Wing.alpha(j) = Wing.alpha(j-1);
            Wing.dCLda(j) = Wing.dCLda(j-1);
            Wing.Cdf(j) = Wing.Cdf(j-1);
            Wing.Cdp(j) = Wing.Cdp(j-1);
            Wing.CLmax(j) = Wing.CLmax(j-1);
            Wing.CLmin(j) = Wing.CLmin(j-1);
        else
            
    c = Wing.chord(j);
    Re = floor(c*V/viscosity);
    if Re > 10000
        system('rm Polars_Temp.txt')
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
system('dos2unix Polars_Temp.sh');
[x,y] = system('./Polars_Temp.sh');
I_last = j;
Polars = readtable('Polars_Temp.txt','NumHeaderLines',10);
[Wing.alpha(j),Wing.dCLda(j),Wing.Cdf(j),Wing.Cdp(j), Wing.CLmax(j),  Wing.CLmin(j),alpha_min,alpha_max] = ...
     Polars_analysis(Polars)
    else
       Wing.alpha(j) = Wing.alpha(I_last);
       Wing.dCLda(j) = Wing.dCLda(I_last);
       Wing.Cdf(j) = Wing.Cdf(I_last);
       Wing.Cdp(j) = Wing.Cdp(I_last);
       Wing.CLmax(j) = Wing.CLmax(I_last);
       Wing.CLmin(j) = Wing.CLmin(I_last);
        
    end
        
        end
        
    else
        
    c = Wing.chord(j);
    Re = floor(c*V/viscosity);
    if Re > 10000
        system('rm Polars_Temp.txt')
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
[x,y] = system('./Polars_Temp.sh');
I_last = j;
Polars = readtable('Polars_Temp.txt','NumHeaderLines',10);
[Wing.alpha(j),Wing.dCLda(j),Wing.Cdf(j),Wing.Cdp(j), Wing.CLmax(j),  Wing.CLmin(j),alpha_min,alpha_max] = ...
     Polars_analysis(Polars)
    else
       Wing.alpha(j) = Wing.alpha(I_last);
       Wing.dCLda(j) = Wing.dCLda(I_last);
       Wing.Cdf(j) = Wing.Cdf(I_last);
       Wing.Cdp(j) = Wing.Cdp(I_last);
       Wing.CLmax(j) = Wing.CLmax(I_last);
       Wing.CLmin(j) = Wing.CLmin(I_last);
        
    end
    
    end

end
else

    c = Wing.chord(1);
    Re = floor(c*V/viscosity);
    if Re > 10000
        system('rm Polars_Temp.txt')
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
[x,y] = system('./Polars_Temp.sh');
Polars = readtable('Polars_Temp.txt','NumHeaderLines',10);
[alpha,dCLda,Cdf,Cdp,clmax,clmin,alpha_min,alpha_max] = ...
     Polars_analysis(Polars)
    
N = length(Wing.chord);
Wing.alpha = alpha*ones(1,N)
Wing.dCLda = dCLda*ones(1,N)
Wing.Cdf = Cdf*ones(1,N)
Wing.Cdp = Cdp*ones(1,N)
Wing.CLmax = clmax*ones(N,1);
Wing.CLmin = clmin*ones(N,1);
    end
end
Wing.alpha = Wing.alpha';
Wing.dCLda = Wing.dCLda';
Wing.Cdf = Wing.Cdf';
Wing.Cdp = Wing.Cdp';
% Wing.CLmax = Wing.CLmax';
% Wing.CLmin = Wing.CLmin';

end
