function change_mass(file,m,twist)



fid = fopen(file,'r');   
        i = 1;
        tline = 's';
        A = {[]};
        replaceline_m =     " 1        -0.280       0.0         -0.280       0.0      " + num2str(m) ;
        replaceline_t = "*1.0 " + num2str(twist);
    while ischar(tline)
    tline = fgetl(fid);
    if ~isempty(strfind(tline,'#  MASS')) % find '@mass'
        A{i}=tline;
        tline = fgetl(fid);
        i = i+1
        A{i} = replaceline_m;
        
    elseif~ isempty(strfind(tline,'# twist')) 
        A{i}=tline;
        tline = fgetl(fid);
        i = i+1
        A{i} = replaceline_t;
        
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

