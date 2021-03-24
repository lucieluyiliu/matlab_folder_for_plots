close all;

%this script generates plots in the paper 
%using the generated variables in the workspace

%---------------------------------
%Figure 1 understanding the model
%----------------------------------

load('twotree_forplot20200511.mat');
%---understanding the model
% rf=params.delta+params.mu1*s+params.mu2*(1-s)-params.sigma1^2*s.^2-params.sigma2^2*(1-s).^2-2*params.rho*params.sigma1*params.sigma2*s.*(1-s);
% vol=params.sigma1^2*s.^2+params.sigma2^2*(1-s).^2+2*params.sigma1*params.sigma2*params.rho*s.*(1-s);
% tree1=wealth(params,s);
% 
% Er=params.mu1+2*params.delta.*(1-s)+(1-s./(1-s)).*log(s)./tree1;
% rexcess=Er-rf;
s0=0.05:0.1:0.95;

Height = 600;
Width = 700;
width = 1.5;

figure1 = figure;
set(figure1,'Position',[232 100 Width Height],'PaperPositionMode','auto')

subplot(2,2,1)
plot(s0,rf,'Color','b','LineWidth',width);
xlabel('Share of tree A');
ylabel('Risk-free rate')
title('(A) Risk-free rate')
ylim([0.02,0.045]);

subplot(2,2,2)
plot(s0,vol,'Color','b','LineWidth',width);
ylabel('Aggregate volatility');
xlabel('Share of tree A');
title('(B) Aggregate volatility');
ylim([0.01,0.05])
subplot(2,2,3)

plot(s0,Er-rf,'Color','b','LineWidth',width);
ylabel('Expected excess asset return');
xlabel('Output share of A');
title('(C) Risk premium')
ylim([0.0,0.05])

subplot(2,2,4)
plot(s0,mat_E_ls_share_beg,'Color', 'k','LineWidth',width,'LineStyle','--');
hold on
plot(s0,mat_D_ls_share_beg,'Color', 'b','LineWidth',width,'LineStyle','-');
legend({'Equity','Debt'});
set(legend,'EdgeColor',[1 1 1]); % the box becomes white
ylabel('Equity and debt values')
title('(D) Asset valuation')
xlabel('Share of tree A');
ylim([0,40]);
set(hP,'LineWidth', width);



%----------------------------------
% .   Figure 3 scenario analysis
%-----------------------------------


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
ylim([0,120]);
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



