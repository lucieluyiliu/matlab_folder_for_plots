close all;

%this script generates plots in the paper 
%using the generated variables in the workspace

%---------------------------------
%Figure 1 understanding the model
%----------------------------------

load('twotree_forplot20200602.mat');
load('twotreeunderstand.mat');
%---understanding the model
sff=0.01:0.001:0.99;
 rf=params.delta+params.mu1*sff+params.mu2*(1-sff)-params.sigma1^2*sff.^2-params.sigma2^2*(1-sff).^2-2*params.rho*params.sigma1*params.sigma2*sff.*(1-sff);
vol=params.sigma1^2*sff.^2+params.sigma2^2*(1-sff).^2+2*params.sigma1*params.sigma2*params.rho*sff.*(1-sff);
 tree1=wealth(params,sff);
% 
 Er=params.mu1+2*params.delta.*(1-sff)+(1-sff./(1-sff)).*log(sff)./tree1;
% rexcess=Er-rf;
s0=0.05:0.1:0.95;

Height = 600;
Width = 700;
width = 1.5;

figure1 = figure;
set(figure1,'Position',[232 100 Width Height],'PaperPositionMode','auto')

subplot(2,2,1)
plot(sff,rf,'Color','b','LineWidth',width);
xlabel('Share of tree A');
ylabel('Risk-free rate')
title('(A) Risk-free rate')
ylim([0.02,0.045]);

subplot(2,2,2)
plot(sff,vol,'Color','b','LineWidth',width);
ylabel('Aggregate volatility');
xlabel('Share of tree A');
title('(B) Aggregate volatility');
ylim([0.01,0.05])
subplot(2,2,3)

plot(sff,Er-rf,'Color','b','LineWidth',width);
ylabel('Expected excess asset return');
xlabel('Output share of A');
title('(C) Risk premium')
ylim([0.0,0.05])

subplot(2,2,4)
plot(sff,mat_E_ls_share_beg,'Color', 'k','LineWidth',width,'LineStyle','--');
hold on
plot(sff,mat_D_ls_share_beg,'Color', 'b','LineWidth',width,'LineStyle','-');
legend({'Equity','Debt'});
set(legend,'EdgeColor',[1 1 1]); % the box becomes white
ylabel('Equity and debt values')
title('(D) Asset valuation')
xlabel('Share of tree A');
ylim([0,40]);



