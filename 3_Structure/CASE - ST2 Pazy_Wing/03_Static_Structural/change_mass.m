function change_mass(file,m1,m2)



fid = fopen(file,'r');   
        i = 1;
        tline = 's';
        A = {[]};
        replaceline_m1 =     "  1         0.558     0.05        0.558        0.0      " + num2str(m1) ;
        replaceline_m2 =     "  1         0.558     0.05        0.558        0.0      " + num2str(m2);
    while ischar(tline)
    tline = fgetl(fid);
    if ~isempty(strfind(tline,'#  MASS1')) % find '@mass'
        A{i}=tline;
        tline = fgetl(fid);
        i = i+1;
        A{i} = replaceline_m1;
    elseif ~isempty(strfind(tline,'#  MASS2'))
        A{i}=tline;
        tline = fgetl(fid);
        i = i+1;
        A{i} = replaceline_m2;

    else

        A{i}=tline;
        
    end
    i = i+1;
    end
fclose(fid);
fid2=fopen(file,'w');            % Open file to write
for i=1:length(A)-1
    fprintf(fid2,['%s',char([13,10])],A{i});
end
fclose(fid2);


end

