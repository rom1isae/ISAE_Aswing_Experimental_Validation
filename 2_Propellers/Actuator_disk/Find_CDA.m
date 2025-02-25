function [CDA] = Find_CDA(Ve,RPM,Re,CD_start,CP,swirl_on,CT_TARGET)
CDA_temp1 = CD_start;
CD_inf = 0.0;
CD_sup = CDA_temp1;
CT_temp = 0.0;
CDAn = CD_start;
CDAm1 = 0.0;
[CT_temp,CP2,eta2,phi2] = Actuatir_disk(Ve,RPM,Re,CD_start,CP,swirl_on);
CT_temp 
CT_TARGET
if CT_TARGET < CT_temp
display('Init CT_TARGET <= CT_temp')

CD_sup = 0.0;
CD_inf = 0.0;
else
end
while 100*abs((CT_TARGET-CT_temp)/CT_TARGET) > 0.001 
[CT_temp,CP2,eta2,phi2] = Actuatir_disk(Ve,RPM,Re,CDA_temp1,CP,swirl_on);
if CT_TARGET > CT_temp
   display('CT_targ > CT_temp')
   
   CD_sup = CDA_temp1;
   CDA_temp3 = CDA_temp1 - 0.5*(CD_sup-CD_inf)/2;
   CDA_temp1 = CDA_temp3;
else
   display('CT_targ < CT_temp')
   
   if CD_sup == 0.0
   display('CT_targ < CT_temp + CD_sup = 0.0')
   
       CD_inf = CDA_temp1;
       CDA_temp3 = 2*CDA_temp1 
   else

   CDA_temp3 = CDA_temp1 + 0.5*(CD_sup-CD_inf)/2;

   CD_inf = CDA_temp1;
   end
   CDA_temp1 = CDA_temp3;
end
CD_inf
CD_sup
CT_temp
CT_TARGET
CDA_temp1
end
CDA = CDA_temp1;
display("find")
end