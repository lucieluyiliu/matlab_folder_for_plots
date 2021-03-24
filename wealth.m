function out=wealth(params,s,iftwo)
%this function calculates the value of the first tree per dollar dividend
%s can be a vector
% Yiliu Lu 
% yiliu.lu@mail.mcgill.ca
% May 2019

%input
%1.params: a structure containing the following fields:
%-mu1, drift of the first tree
%-mu2, drift of the second tree
%-sigma1, diffusion of the first tree
%-sigma2, diffusion of the second tree
%rho, correlation between two trees.
%delta: time reference
%2.share, the current dividend share of tree 1
%3.iftwo: whether calculate PD ratio for the second tree as well.
if nargin<3
  iftwo=0;  
end
%read parameters
mu1=params.mu1;
mu2=params.mu2;
sigma1=params.sigma1;
sigma2=params.sigma2;
rho=params.rho;
delta=params.delta;
%some useful constants
nu=mu2-mu1-sigma2^2/2+sigma1^2/2;
eta2=sigma1^2+sigma2^2-2*rho*sigma1*sigma2;
psi=sqrt(nu^2+2*delta*eta2);
gamma=(nu-psi)/eta2;
theta=(nu+psi)/eta2;

if iftwo 
    
    out.tree1=1/psi/(1-gamma)./(1-s).*pfqHuguesVersion([1,1-gamma],2-gamma,s./(s-1))...
    +1/psi/theta./s.*pfqHuguesVersion([1,theta],1+theta,(s-1)./s);
    %calculates V2
    out.tree2=1/psi/(1+theta)./s.*pfqHuguesVersion([1,1+theta],2+theta,(s-1)./s)...
        -1/psi/gamma./(1-s).*pfqHuguesVersion([1,-gamma],1-gamma,s./(s-1));
else
    if s~=1
out=1/psi/(1-gamma)./(1-s).*pfqHuguesVersion([1,1-gamma],2-gamma,s./(s-1))...
    +1/psi/theta./s.*pfqHuguesVersion([1,theta],1+theta,(s-1)./s);
    else
    out=1/params.delta; %when there is only one tree
    end
end

figure
subplot(4,2,1)
bar(db);
text(1:length(db),db,num2str(db'),'vert','bottom','horiz','center'); 
xticklabels({'Negative','Base','Positive'}); 
xlabel('Shock to tree B');
ylabel('Dividend');

ylim([0,2]);
set(gca,'YTickLabel',[]);

title('Tree A')
subplot(4,2,2)
bar(da);
text(1:length(da),da,num2str(da'),'vert','bottom','horiz','center'); 
xticklabels({'Negative','Base','Positive'}); 
xlabel('Shock to tree B');
ylim([0,2])
title('Tree B')

set(gca,'YTickLabel',[]);
%xlabel('Shock to tree B');

subplot(4,2,3)
bar(premiumss(:,2));
ylabel('Risk premium');
%xlabel('Shock to tree B');
ylim([0,0.03]);
xticklabels({'Negative','Base','Positive'}); 
xlabel('Shock to tree B');
set(gca,'YTickLabel',[]);


subplot(4,2,4)
bar(premiumss(:,1));
ylim([0,0.03]);
xticklabels({'Negative','Base','Positive'}); 
xlabel('Shock to tree B');
set(gca,'YTickLabel',[]);
%xlabel('Shock to tree B');

subplot(4,2,5)
bar(dtdss(:,2));
ylabel('Distance to default')
ylim([0.4,1]);
xticklabels({'Negative','Base','Positive'}); 
xlabel('Shock to tree B');
set(gca,'YTickLabel',[]);
%xlabel('Shock to tree B');
subplot(4,2,6)
bar(dtdss(:,1));
ylim([0.4,1]);
xticklabels({'Negative','Base','Positive'}); 
xlabel('Shock to tree B');
set(gca,'YTickLabel',[]);
%xlabel('Shock to tree B');

subplot(4,2,7)
bar(csss(:,2));
ylabel('Credit spread')
ylim([0,400]);
xticklabels({'Negative','Base','Positive'}); 
xlabel('Shock to tree B');
set(gca,'YTickLabel',[]);
%xlabel('Shock to tree B');

subplot(4,2,8)
bar(csss(:,1));
ylim([0,400]);
xticklabels({'Negative','Base','Positive'}); 
xlabel('Shock to tree B');
set(gca,'YTickLabel',[]);
%xlabel('Shock to tree B');