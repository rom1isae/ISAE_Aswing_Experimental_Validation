function [alpha0,clalpha,cdf,cdp] = Polars_analysis(Polars)
alpha = Polars.Var1;
CL = Polars.Var2;
CDp = Polars.Var4;
Cdf= Polars.Var3-Polars.Var4;
i =1;
while CL(i)<0
 i =i+1;
end
I = i;
    
    
alpha0 = -alpha(I);

cdf = mean(Cdf(I:I+40));
cdp = mean(CDp(I:I+40));

P = polyfit(alpha(I:I+80),CL(I:I+80),1);
clalpha = P(1)*180/pi;

end

