clear all
close all


R = 0.05
N = 20;
D = 2*R;
xD = 1.7*D;

x = xD;
y =  linspace(-1.2*R,1.2*R,N);
z = y;

n10 = N/10;


for j = 1:length(y)
        for l = 1:n10
            line1 =  "1   1  1.0   " + num2str(x) +" "+  num2str(y(j))+" " + " "+num2str(z(1+10*(l-1))) + "  1.0     0.0   0.0    0.0   0.0   1.0" ;
            line2 =  "2   1  1.0   " + num2str(x) +" "+  num2str(y(j))+" " + " "+num2str(z(2+10*(l-1))) + "  1.0     0.0   0.0    0.0   0.0   1.0" ;
            line3 =  "3   1  1.0   " + num2str(x) +" "+  num2str(y(j))+" " + " "+num2str(z(3+10*(l-1))) + "  1.0     0.0   0.0    0.0   0.0   1.0" ;
            line4 =  "4   1  1.0   " + num2str(x) +" "+  num2str(y(j))+" " + " "+num2str(z(4+10*(l-1))) + "  1.0     0.0   0.0    0.0   0.0   1.0" ;
            line5 =  "5   1  1.0   " + num2str(x) +" "+  num2str(y(j))+" " + " "+num2str(z(5+10*(l-1))) + "  1.0     0.0   0.0    0.0   0.0   1.0" ;
            line6 =  "6   1  1.0   " + num2str(x) +" "+  num2str(y(j))+" " + " "+num2str(z(6+10*(l-1))) + "  1.0     0.0   0.0    0.0   0.0   1.0" ;
            line7 =  "7   1  1.0   " + num2str(x) +" "+  num2str(y(j))+" " + " "+num2str(z(7+10*(l-1))) + "  1.0     0.0   0.0    0.0   0.0   1.0" ;
            line8 =  "8   1  1.0   " + num2str(x) +" "+  num2str(y(j))+" " + " "+num2str(z(8+10*(l-1))) + "  1.0     0.0   0.0    0.0   0.0   1.0" ;
            line9 =  "9   1  1.0   " + num2str(x) +" "+  num2str(y(j))+" " + " "+num2str(z(9+10*(l-1))) + "  1.0     0.0   0.0    0.0   0.0   1.0" ;
            line10 =  "10   1  1.0   " + num2str(x) +" "+  num2str(y(j))+" " + " "+num2str(z(10+10*(l-1))) + "  1.0     0.0   0.0    0.0   0.0   1.0" ;               
            fid = fopen('prop_temp.asw','r');        % Open File to read
            i = 1;
            tline = 's';
            A = {[]};
            while ischar(tline)
                tline = fgetl(fid);
                 if ~isempty(strfind(tline,'Sensor')) % find '@controls'
                    A{i}=tline;
                    tline = fgetl(fid);
                    A{i+1} = tline;
                    tline = fgetl(fid);
                    A{i+2} = tline
                    A{i+3} = line1;
                    A{i+4} = line2;
                    A{i+5} = line3;
                    A{i+6} = line4;
                    A{i+7} = line5;
                    A{i+8} = line6;
                    A{i+9} = line7;
                    A{i+10} = line8;
                    A{i+11} = line9;
                    A{i+12} = line10;
                    tline = fgetl(fid);
                    tline = fgetl(fid);
                    tline = fgetl(fid);
                    tline = fgetl(fid);
                    tline = fgetl(fid);
                    tline = fgetl(fid);
                    tline = fgetl(fid);
                    tline = fgetl(fid);
                    tline = fgetl(fid);
                    tline = fgetl(fid);
                    i = i+12
                 else
                    A{i}=tline;
                 end
                    i = i+1;
            end

            fclose(fid);
            fid2=fopen('prop_temp.asw','w');            % Open file to write
            for i=1:length(A)-1
                fprintf(fid2,['%s',char([13,10])],A{i});
            end
                fclose(fid2);
                [out1 out2] = system('sh prop_temp.sh')  ;
                data =  readtable('prop_temp.txt','NumHeaderLines',3)   ; 
                V_temp(j,1+10*(l-1):10+10*(l-1)) = [data.Var3  data.Var6 data.Var9 data.Var12 data.Var15 data.Var18 data.Var21 data.Var24 data.Var27 data.Var30];
                beta_temp(j,1+10*(l-1):10+10*(l-1)) = [data.Var4  data.Var7 data.Var10 data.Var13 data.Var16 data.Var19 data.Var22 data.Var25 data.Var28 data.Var31];
                alpha_temp(j,1+10*(l-1):10+10*(l-1)) = [data.Var5  data.Var8 data.Var11 data.Var14 data.Var17 data.Var20 data.Var23 data.Var26 data.Var29 data.Var32];
                
        end
end

%%
close all
[Y,Z] = meshgrid(y,z)
Vswirlu = V_temp.*sin(beta_temp);
Vswirlv = -V_temp.*sin(alpha_temp);
pcolor(Y,Z,V_temp)
hold on
quiver(Y,Z,Vswirlu,Vswirlv,'k')
shading interp
colorbar
axis equal



            
            