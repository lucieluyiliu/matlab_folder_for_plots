%vol scenario analysis

params.delta=0.04;
params.sigma1=0.2;
params.sigma2=0.2;
params.mu1=0.02;
params.mu2=0.02;
params.rho=0;
params.coupon=0.5; %coupon calibrated to 0.5 leverage
params.theta=1;
params.recovery=0;
params.M=50000;
X0=1;
s=0.05:0.1:0.95;
n=10;
sfixed=0.85;
sharegrid=0.01:0.02:1;
nodef=zeros(50,1);
params.rf05=params.delta+params.mu1*0.5+params.mu2*(1-0.5)-params.sigma1^2*0.5^2-params.sigma2^2.*(1-0.5)^2-2*params.rho*params.sigma1*params.sigma2*0.5*(1-0.5);

ltparams.maturity=5;
ltparams.mu1=0.02;
ltparams.mu2=0.02;
ltparams.sigma1=0.2;
ltparams.sigma2=0.2;
ltparams.delta=0.04;
ltparams.rf05=params.rf05;
ltparams.coupon=0.3; %coupon rate per dt
ltparams.rho=0;
s=0.05:0.1:0.95;
sfixed=0.85;
ltparams.theta=1;
fixcoupons=[0.3,0.5,0.7];
mat=[5,10,30];
ltparams.recovery=0;
ltparams.T=100;
ltparams.M=50000;


ltparams.coupon=fixcoupons(2);
ltparams.maturity=10;
%a gets shock
dvol=0.1;
vola=[ltparams.sigma1,ltparams.sigma1,ltparams.sigma1];
volb=[ltparams.sigma1*(1-dvol),ltparams.sigma1,ltparams.sigma1*(1+dvol)];
sa=0.5;
sb=1-sa;
X0a=X0;
X0b=X0/sa*(1-sa);
sharebina=ceil(sa/0.02);
sharebinb=ceil((1-sa)/0.02);
premiumvs=zeros(3,2);
Era=zeros(3,1);
Erb=zeros(3,1);
rfa=zeros(3,1);
rfb=zeros(3,1);
ya=zeros(3,1);
yb=zeros(3,1);
dtdvs=zeros(3,2);
csvs=zeros(3,2);



for i=1:3

    %a as primary tree
    ltparams.sigma1=vola(i);
    ltparams.sigma2=volb(i);
    paramsa=ltparams;
    paramsa.sigma1=vola(i);
    paramsa.sigma2=volb(i);
    %paramsa.rf05=paramsa.delta+paramsa.mu1*0.5+paramsa.mu2*(1-0.5)-paramsa.sigma1^2*0.5^2-paramsa.sigma2^2.*(1-0.5)^2-2*paramsa.rho*params.sigma1*paramsa.sigma2*0.5*(1-0.5);
    treea=wealth(paramsa,sa);
    bounda=twomatbound(paramsa,paramsa.coupon,sfixed);
    %b as primary tree
    paramsb=ltparams;
    paramsb.sigma1=volb(i);
    paramsb.sigma2=vola(i);
    %paramsb.rf05=paramsb.delta+paramsb.mu1*0.5+paramsb.mu2*(1-0.5)-paramsb.sigma1^2*0.5^2-paramsb.sigma2^2.*(1-0.5)^2-2*paramsa.rho*params.sigma1*paramsb.sigma2*0.5*(1-0.5);
    treeb=wealth(paramsb,sb);
    boundb=twomatbound(paramsb,paramsb.coupon,sfixed);
 outa=twomatvalue(paramsa,X0a,sa,bounda);
 outb=twomatvalue(paramsb,X0b,sb,boundb); 
 dtdvs(i,1)=(X0a-bounda(sharebina))/X0a/paramsa.sigma1;
 dtdvs(i,2)=(X0b-boundb(sharebinb))/X0b/paramsb.sigma1;
 rfa=paramsa.delta+paramsa.mu1*sa+paramsa.mu2*(1-sa)-paramsa.sigma1^2*sa.^2-paramsa.sigma2^2*(1-sa)^2-2*paramsa.rho*paramsa.sigma1*paramsa.sigma2*sa*(1-sa);
 rfb=paramsb.delta+paramsb.mu1*sb+paramsb.mu2*(1-sb)-paramsb.sigma1^2*sa.^2-paramsb.sigma2^2*(1-sb)^2-2*paramsb.rho*paramsb.sigma1*paramsb.sigma2*sb*(1-sb);
 Era(i)=paramsa.mu1+2*paramsa.delta*(1-sa)+(1-sa/(1-sa))*log(sa)./treea;
 Erb(i)=paramsb.mu1+2*paramsb.delta*(1-sb)+(1-sb/(1-sb)).*log(sb)./treeb;
 premiumvs(i,1)=Era(i)-rfa;
 premiumvs(i,2)=Erb(i)-rfb;
 ra=twomatvalue(paramsa,X0a,sa,nodef);
 rb=twomatvalue(paramsb,X0b,sb,nodef);
 rfa(i)=ra.yield*10000;
  rfb(i)=rb.yield*10000;
 ya(i)=outa.yield*10000;
 yb(i)=outb.yield*10000;
 csvs(i,1)=outa.yield*10000-ra.yield*10000;
 csvs(i,2)=outb.yield*10000-rb.yield*10000;
 
end



figure
subplot(4,2,1)
bar(vola);
text(1:length(vola),vola,num2str(vola',3),'vert','bottom','horiz','center'); 
xticklabels({'Negative','Base','Positive'}); 
xlabel('Shock to tree B');
ylabel('Volatility');

ylim([0.1,0.6]);
set(gca,'YTickLabel',[]);

title('Tree A')
subplot(4,2,2)
bar(volb);
text(1:length(volb),volb,num2str(volb',3),'vert','bottom','horiz','center'); 
xticklabels({'Negative','Base','Positive'}); 
xlabel('Shock to tree B volatility');
ylim([0.1,0.6])
title('Tree B')

%set(gca,'YTickLabel',[]);
%xlabel('Shock to tree B');

subplot(4,2,3)
bar(premiumvs(:,1));
ylabel('Risk premium');
%xlabel('Shock to tree B');
ylim([0,0.05]);
text(1:length(premiumvs(:,1)'),premiumvs(:,1)',num2str(premiumvs(:,1),2),'vert','bottom','horiz','center');
xticklabels({'Negative','Base','Positive'}); 
xlabel('Shock to tree B volatility');
%set(gca,'YTickLabel',[]);


subplot(4,2,4)
bar(premiumvs(:,2));
ylim([0,0.05]);
xticklabels({'Negative','Base','Positive'}); 
text(1:length(premiumvs(:,2)'),premiumvs(:,2)',num2str(premiumvs(:,2),2),'vert','bottom','horiz','center');
xlabel('Shock to tree B volatility');
%set(gca,'YTickLabel',[]);
%xlabel('Shock to tree B');

subplot(4,2,5)
bar(dtdvs(:,1));
ylabel('Distance to default')
ylim([0,8]);
xticklabels({'Negative','Base','Positive'}); 
text(1:length(dtdvs(:,1)'),dtdvs(:,1)',num2str(dtdvs(:,1),3),'vert','bottom','horiz','center');
xlabel('Shock to tree B volatility ');
%set(gca,'YTickLabel',[]);
%xlabel('Shock to tree B');
subplot(4,2,6)
bar(dtdvs(:,2));
ylim([0,8]);
xticklabels({'Negative','Base','Positive'}); 
text(1:length(dtdvs(:,2)'),dtdvs(:,2)',num2str(dtdvs(:,2),3),'vert','bottom','horiz','center');
xlabel('Shock to tree B volatility ');
%set(gca,'YTickLabel',[]);
%xlabel('Shock to tree B');

subplot(4,2,7)
bar(csvs(:,1));
ylabel('Credit spread')
ylim([0,110]);
xticklabels({'Negative','Base','Positive'}); 
text(1:length(csvs(:,1)'),csvs(:,1)',num2str(csvs(:,1),3),'vert','bottom','horiz','center');
xlabel('Shock to tree B volatility');
%set(gca,'YTickLabel',[]);
%xlabel('Shock to tree B');

subplot(4,2,8)
bar(csvs(:,2));
ylim([0,110]);
xticklabels({'Negative','Base','Positive'}); 
text(1:length(csvs(:,1)'),csvs(:,2)',num2str(csvs(:,2),3),'vert','bottom','horiz','center');
xlabel('Shock to tree B volatility');
%set(gca,'YTickLabel',[]);
%xlabel('Shock to tree B');


figure
plot(vol,cs10yr,'Linewidth',width);
ylim([0,100]);

figure
plot(vol,cs,'Linewidth',width);
legend('5yr','10yr','30yr');
ylim([0,150]);
