function [alpha0,clalpha,cdf,cdp,clmax,clmin,alpha_min,alpha_max] = Polars_analysis(Polars)
alpha = Polars.alpha;
CL = Polars.CL;
CDp = Polars.CDp;
Cdf= Polars.CD-Polars.CDp;
i =1;
while CL(i)<0
 i =i+1;
end
I = i;
    
    
alpha0 = -alpha(I);

cdf = mean(Cdf(I-60:I+60));
cdp = mean(CDp(I-60:I+60));
[clmax,Imax] = max(CL);
alpha_max = alpha(Imax);
[clmin,Imin] = min(CL);
alpha_min = alpha(Imin);
P = polyfit(alpha(I:I+30),CL(I:I+30),1);
clalpha = P(1)*180/pi;

end

