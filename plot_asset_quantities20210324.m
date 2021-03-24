

% This figure plots the asset pricing quantities 

sf=0.01:0.001:0.99;
% rf=params.delta+params.mu1*sff+params.mu2*(1-sff)-params.sigma1^2*sff.^2-params.sigma2^2*(1-sff).^2-2*params.rho*params.sigma1*params.sigma2*sff.*(1-sff);
%vol=params.sigma1^2*sff.^2+params.sigma2^2*(1-sff).^2+2*params.sigma1*params.sigma2*params.rho*sff.*(1-sff);
 %tree1=wealth(params,sff);
 
load('twotreeunderstand1.mat')
leverage=mat_D_share_beg./(mat_E_share_beg+mat_D_share_beg);

%load('twotreeunderstand.mat')
load('twotreeunderstand20210211.mat')
load('twotreeunderstand20210324.mat')
s0=sf;

Height = 500;
Width = 600;
width = 2;

figure1 = figure;
set(figure1,'Position',[232 100 Width Height],'PaperPositionMode','auto')

subplot(2,2,1)
plot(s0,sqrt(vol),'Color','b','LineWidth',width);
% hold on 
% plot(s0,smooth(s0,E_vol_share_begA,100),'Color','k','LineStyle',':','LineWidth',width)
ylabel('Aggregate volatility');
xlabel('Share of tree A');
title('(A) Aggregate volatility');
ylim([0,0.3])
legend({'Consumption volatility','Equity volatility of tree A'})


subplot(2,2,2)
plot(s0,rf*10000,'Color','b','LineWidth',width);
xlabel('Share of tree A');
ylabel('Risk-free rate (bps)')
title('(B) Risk-free rate')

hold on 
plot(s0,ERP_A*10000,'Color','k','LineStyle',':','LineWidth',width);
%plot(s0,  smooth(s0,ERP_A,100),'Color','k','LineStyle',':','LineWidth',width);

ylim([100,450]);

subplot(2,2,3)


plot(s0,mat_E_share_beg,'Color', 'k','LineWidth',width,'LineStyle','--');
hold on
plot(s0,mat_D_share_beg,'Color', 'b','LineWidth',width,'LineStyle','-');
legend({'Equity','Debt'});
set(legend,'EdgeColor',[1 1 1]); % the box becomes white
ylabel('Equity and debt values')
title('(C) Asset valuation of tree A')
xlabel('Share of tree A');
ylim([0,40]);

subplot(2,2,4)
plot(s0,leverage,'Color','b','LineWidth',width);

ylabel('Debt/(equity+debt)');
xlabel('Share of tree A');
title('(D) Leverage ratio of tree A');
%legend({'Expected excess asset return','Equity risk premium'});
%ylim([0.0,0.1])



%% tree B 
figure2 = figure;
set(figure2,'Position',[232 100 Width Height],'PaperPositionMode','auto')



subplot(2,2,1)
plot(s0(1:700),1./sf(1:700).*(1-sf(1:700)),'Color','b','LineWidth',width);
xlabel('Share of tree A');
ylabel('Dividend of tree B')
title('(B) Dividend of tree B')
%ylim([0.01,0.045]);

subplot(2,2,2)


plot(s0(1:700),mat_E_ls_share_begB(1:700),'Color', 'k','LineWidth',width,'LineStyle','--');
%hold on
%plot(s0,mat_D_ls_share_begB,'Color', 'b','LineWidth',width,'LineStyle','-');
legend({'Equity','Debt'});
set(legend,'EdgeColor',[1 1 1]); % the box becomes white
ylabel('Equity value')
title('(C) Equity valuation of tree B')
xlabel('Share of tree A');
%ylim([0,40]);

subplot(2,2,3)


%plot(s0,mat_E_ls_share_begB,'Color', 'k','LineWidth',width,'LineStyle','--');
hold on
plot(s0(1:700),mat_D_ls_share_begB(1:700),'Color', 'b','LineWidth',width,'LineStyle','-');
legend({'Equity','Debt'});
set(legend,'EdgeColor',[1 1 1]); % the box becomes white
ylabel('Debt values')
title('(C) Debt valuation of tree B')
xlabel('Share of tree A');
%ylim([0,40]);

subplot(2,2,4)
plot(s0(1:700),leverageB(1:700),'Color','b','LineWidth',width);
% hold on 
% plot(s0,  smooth(s0,E_premium_share_beg,100),'Color','k','LineStyle',':','LineWidth',width);

ylabel('Debt/(equity+debt)');
xlabel('Share of tree A');
title('(C) Leverage ratio of tree B');

%% smooth function 
function plot_c(s,x)
  span = 10;

  yy = smooth(x,span);
  %yy = max(0,smooth(decompose_stochastic(:,data_mat,data_lev),span));
  h3=plot(s, yy,'LineWidth',1,'LineStyle','-','Color','k');
  hold on 
  %---contagion bad or good fill in 
%   low=decompose_stochastic(:,data_mat,data_lev)<0;
%   xa=s(low);
%   y1a=zeros(1,length(xa));
%   y2a=decompose_stochastic(low,data_mat,data_lev)';
%   patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
%    high=decompose_stochastic(:,data_mat,data_lev)>0;
%   xa=s(high);
%   y1a=zeros(1,length(xa));
%   y2a=decompose_stochastic(high,data_mat,data_lev)';
  
  xa=s;
  y1a=zeros(1,length(xa));
  y2a=max(0,decompose_stochastic(:,data_mat,data_lev)');
  y2a = [zeros(1,5) y2a(6:end)];
  y2a = smooth(y2a',span)';
  
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'b');
  alpha(0.4);
  ylim([0,ylim_max]);
  end 
  