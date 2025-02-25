% [in1 in2] = system('sh ./FFWT_REMOVED_V15_ROLL_DF7.sh')
% [in1 in2] = system('sh ./FFWT_REMOVED_V20_ROLL_DF7.sh');
% [in1 in2] = system('sh ./FFWT_REMOVED_V25_ROLL_DF7.sh');
% [in1 in2] = system('sh ./FFWT_REMOVED_V30_ROLL_DF7.sh');
% 
% [in1 in2] = system('sh ./FFWT_REMOVED_V15_ROLL_DF14.sh');
% [in1 in2] = system('sh ./FFWT_REMOVED_V20_ROLL_DF14.sh');
% [in1 in2] = system('sh ./FFWT_REMOVED_V25_ROLL_DF14.sh');
[in1 in2] = system('sh ./FFWT_REMOVED_V30_ROLL_DF14.sh');
% 
% [in1 in2] = system('sh ./FFWT_REMOVED_V15_ROLL_DF21.sh');
% [in1 in2] = system('sh ./FFWT_REMOVED_V20_ROLL_DF21.sh');
% [in1 in2] = system('sh ./FFWT_REMOVED_V25_ROLL_DF21.sh');
[in1 in2] = system('sh ./FFWT_REMOVED_V30_ROLL_DF21.sh');
%%

data_temp = readtable('FFWT_REMOVED_V15_DF7.txt','NumHeaderLines',3);
FFWT_REMOVED_DF7(1) = data_temp.Var4(end);
data_temp = readtable('FFWT_REMOVED_V20_DF7.txt','NumHeaderLines',3);
FFWT_REMOVED_DF7(2) = data_temp.Var4(end);
data_temp = readtable('FFWT_REMOVED_V25_DF7.txt','NumHeaderLines',3);
FFWT_REMOVED_DF7(3) = data_temp.Var4(end);
data_temp = readtable('FFWT_REMOVED_V30_DF7.txt','NumHeaderLines',3);
FFWT_REMOVED_DF7(4) = data_temp.Var4(end);

data_temp = readtable('FFWT_REMOVED_V15_DF14.txt','NumHeaderLines',3);
FFWT_REMOVED_DF14(1) = data_temp.Var4(end);
data_temp = readtable('FFWT_REMOVED_V20_DF14.txt','NumHeaderLines',3);
FFWT_REMOVED_DF14(2) = data_temp.Var4(end);
data_temp = readtable('FFWT_REMOVED_V25_DF14.txt','NumHeaderLines',3);
FFWT_REMOVED_DF14(3) = data_temp.Var4(end);
data_temp = readtable('FFWT_REMOVED_V30_DF14.txt','NumHeaderLines',3);
FFWT_REMOVED_DF14(4) = data_temp.Var4(end);

data_temp = readtable('FFWT_REMOVED_V15_DF21.txt','NumHeaderLines',3);
FFWT_REMOVED_DF21(1) = data_temp.Var4(end);
data_temp = readtable('FFWT_REMOVED_V20_DF21.txt','NumHeaderLines',3);
FFWT_REMOVED_DF21(2) = data_temp.Var4(end);
data_temp = readtable('FFWT_REMOVED_V25_DF21.txt','NumHeaderLines',3);
FFWT_REMOVED_DF21(3) = data_temp.Var4(end);
data_temp = readtable('FFWT_REMOVED_V30_DF21.txt','NumHeaderLines',3);
FFWT_REMOVED_DF21(4) = data_temp.Var4(end);

%%
save('FFWT_REMOVED.mat',"FFWT_REMOVED_DF7","FFWT_REMOVED_DF14","FFWT_REMOVED_DF21")

