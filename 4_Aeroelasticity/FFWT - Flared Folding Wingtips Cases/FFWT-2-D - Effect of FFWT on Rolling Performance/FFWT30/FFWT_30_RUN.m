[in1 in2] = system('sh ./FFWT_REMOVED_V15_ROLL_DF7.sh')
% [in1 in2] = system('sh ./FFWT_REMOVED_V20_ROLL_DF7.sh');
% [in1 in2] = system('sh ./FFWT_REMOVED_V25_ROLL_DF7.sh');
% [in1 in2] = system('sh ./FFWT_REMOVED_V30_ROLL_DF7.sh');
% % % 
% [in1 in2] = system('sh ./FFWT_REMOVED_V15_ROLL_DF14.sh');
% [in1 in2] = system('sh ./FFWT_REMOVED_V20_ROLL_DF14.sh');
% [in1 in2] = system('sh ./FFWT_REMOVED_V25_ROLL_DF14.sh');
% [in1 in2] = system('sh ./FFWT_REMOVED_V30_ROLL_DF14.sh');
% % 
% [in1 in2] = system('sh ./FFWT_REMOVED_V15_ROLL_DF21.sh');
% [in1 in2] = system('sh ./FFWT_REMOVED_V20_ROLL_DF21.sh');
% [in1 in2] = system('sh ./FFWT_REMOVED_V25_ROLL_DF21.sh');
% [in1 in2] = system('sh ./FFWT_REMOVED_V30_ROLL_DF21.sh');
%%

data_temp = readtable('FFWT_REMOVED_V15_DF7.txt','NumHeaderLines',3);
FFWT_30_DF7(1) = 0.5*(min(data_temp.Var4)+max(data_temp.Var4));
FFWT_30_DFR7_P_min(1) =  100*(min(data_temp.Var4)-mean(data_temp.Var4))/mean(data_temp.Var4);
FFWT_30_DFR7_P_max(1) =  100*(max(data_temp.Var4)-mean(data_temp.Var4))/mean(data_temp.Var4);
data_temp = readtable('FFWT_REMOVED_V20_DF7.txt','NumHeaderLines',3);
FFWT_30_DF7(2) = 0.5*(min(data_temp.Var4)+max(data_temp.Var4));
FFWT_30_DFR7_P_min(2) =  100*(min(data_temp.Var4)-mean(data_temp.Var4))/mean(data_temp.Var4);
FFWT_30_DFR7_P_max(2) =  100*(max(data_temp.Var4)-mean(data_temp.Var4))/mean(data_temp.Var4);
data_temp = readtable('FFWT_REMOVED_V25_DF7.txt','NumHeaderLines',3);
FFWT_30_DF7(3) =  0.5*(min(data_temp.Var4)+max(data_temp.Var4));
FFWT_30_DFR7_P_min(3) =  100*(min(data_temp.Var4)-mean(data_temp.Var4))/mean(data_temp.Var4);
FFWT_30_DFR7_P_max(3) =  100*(max(data_temp.Var4)-mean(data_temp.Var4))/mean(data_temp.Var4);
data_temp = readtable('FFWT_REMOVED_V30_DF7.txt','NumHeaderLines',3);
FFWT_30_DF7(4) = 0.5*(min(data_temp.Var4)+max(data_temp.Var4));
FFWT_30_DFR7_P_min(4) =  100*(min(data_temp.Var4)-mean(data_temp.Var4))/mean(data_temp.Var4);
FFWT_30_DFR7_P_max(4) =  100*(max(data_temp.Var4)-mean(data_temp.Var4))/mean(data_temp.Var4);

data_temp = readtable('FFWT_REMOVED_V15_DF14.txt','NumHeaderLines',3);
FFWT_30_DF14(1) =  0.5*(min(data_temp.Var4)+max(data_temp.Var4));
FFWT_30_DFR14_P_min(1) =  100*(min(data_temp.Var4)-mean(data_temp.Var4))/mean(data_temp.Var4);
FFWT_30_DFR14_P_max(1) =  100*(max(data_temp.Var4)-mean(data_temp.Var4))/mean(data_temp.Var4);
data_temp = readtable('FFWT_REMOVED_V20_DF14.txt','NumHeaderLines',3);
FFWT_30_DF14(2) =  0.5*(min(data_temp.Var4)+max(data_temp.Var4));
FFWT_30_DFR14_P_min(2) =  100*(min(data_temp.Var4)-mean(data_temp.Var4))/mean(data_temp.Var4);
FFWT_30_DFR14_P_max(2) =  100*(max(data_temp.Var4)-mean(data_temp.Var4))/mean(data_temp.Var4);
data_temp = readtable('FFWT_REMOVED_V25_DF14.txt','NumHeaderLines',3);
FFWT_30_DF14(3) =  0.5*(min(data_temp.Var4)+max(data_temp.Var4));
FFWT_30_DFR14_P_min(3) =  100*(min(data_temp.Var4)-mean(data_temp.Var4))/mean(data_temp.Var4);
FFWT_30_DFR14_P_max(3) =  100*(max(data_temp.Var4)-mean(data_temp.Var4))/mean(data_temp.Var4);
data_temp = readtable('FFWT_REMOVED_V30_DF14.txt','NumHeaderLines',3);
FFWT_30_DF14(4) = 0.5*(min(data_temp.Var4)+max(data_temp.Var4));
FFWT_30_DFR14_P_min(4) =  100*(min(data_temp.Var4)-mean(data_temp.Var4))/mean(data_temp.Var4);
FFWT_30_DFR14_P_max(4) =  100*(max(data_temp.Var4)-mean(data_temp.Var4))/mean(data_temp.Var4);

data_temp = readtable('FFWT_REMOVED_V15_DF21.txt','NumHeaderLines',3);
FFWT_30_DF21(1) =  0.5*(min(data_temp.Var4)+max(data_temp.Var4));
FFWT_30_DFR21_P_min(1) =  100*(min(data_temp.Var4)-mean(data_temp.Var4))/mean(data_temp.Var4);
FFWT_30_DFR21_P_max(1) =  100*(max(data_temp.Var4)-mean(data_temp.Var4))/mean(data_temp.Var4);
data_temp = readtable('FFWT_REMOVED_V20_DF21.txt','NumHeaderLines',3);
FFWT_30_DF21(2) =  0.5*(min(data_temp.Var4)+max(data_temp.Var4));
FFWT_30_DFR21_P_min(2) =  100*(min(data_temp.Var4)-mean(data_temp.Var4))/mean(data_temp.Var4);
FFWT_30_DFR21_P_max(2) =  100*(max(data_temp.Var4)-mean(data_temp.Var4))/mean(data_temp.Var4);
data_temp = readtable('FFWT_REMOVED_V25_DF21.txt','NumHeaderLines',3);
FFWT_30_DF21(3) = 0.5*(min(data_temp.Var4)+max(data_temp.Var4));
FFWT_30_DFR21_P_min(3) =  100*(min(data_temp.Var4)-mean(data_temp.Var4))/mean(data_temp.Var4);
FFWT_30_DFR21_P_max(3) =  100*(max(data_temp.Var4)-mean(data_temp.Var4))/mean(data_temp.Var4);
data_temp = readtable('FFWT_REMOVED_V30_DF21.txt','NumHeaderLines',3);
FFWT_30_DF21(4) = 0.5*(min(data_temp.Var4)+max(data_temp.Var4));
FFWT_30_DFR21_P_min(4) =  100*(min(data_temp.Var4)-mean(data_temp.Var4))/mean(data_temp.Var4);
FFWT_30_DFR21_P_max(4) =  100*(max(data_temp.Var4)-mean(data_temp.Var4))/mean(data_temp.Var4);

save('FFWT_30.mat',"FFWT_30_DF7","FFWT_30_DF14","FFWT_30_DF21","FFWT_30_DFR21_P_min","FFWT_30_DFR21_P_max","FFWT_30_DFR14_P_min","FFWT_30_DFR14_P_max",...
    "FFWT_30_DFR7_P_min","FFWT_30_DFR7_P_max")

