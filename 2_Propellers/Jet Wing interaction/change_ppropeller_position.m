function change_ppropeller_position(file,xp,yp,zp)



fid = fopen(file,'r');   
        i = 1;
        tline = 's';
        A = {[]};
        replaceline_m =         "1    1    1    " + num2str(yp) +      "    "  + num2str(xp) + "    " + num2str(yp) + "     "  +  num2str(zp) + "      -1.0   0.0   0.0   0.0     0.0    0.1180   500    4.4874e-04";
        replaceline_t =  "1    1    1    " + num2str(-yp) +      "    "  + num2str(xp) + "    " + num2str(-yp) + "     "  +  num2str(zp) + "      -1.0   0.0   0.0   0.0     0.0    0.1180   -500    4.4874e-04";
    while ischar(tline)
    tline = fgetl(fid);
    if ~isempty(strfind(tline,'#  Propeller 1 position')) % find '@mass'
        A{i}=tline;
        tline = fgetl(fid);
        i = i+1;
        A{i} = replaceline_m;
        
    elseif~ isempty(strfind(tline,'# Propeller 2 position')) 
        A{i}=tline;
        tline = fgetl(fid);
        i = i+1;
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

