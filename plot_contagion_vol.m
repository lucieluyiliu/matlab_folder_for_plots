%this figure plots comparatives for volatility shocks to tree B
Height = 500;
Width = 600;
width = 2;

load('volcontagion.mat');

vol=0.1:0.005:0.3;

sa=0.5;


agvol=(ltparams.sigma1^2*sa^2+vol.^2*(1-sa).^2+2*ltparams.sigma1*vol*ltparams.rho*sa*(1-sa)).^(1/2);


figure1=figure;
set(figure1,'Position',[232 100 Width Height],'PaperPositionMode','auto')

subplot(2,2,1)
plot(vol,agvol,'LineWidth',width,'Color','b');
title('(A) Aggregate volatility')
ylabel('Aggregate volatility');
xlabel('Asset volatility of tree B');
ylim([0.1,0.2]);
subplot(2,2,2)

%plot(vol,rfmat*10000,'LineWidth',2);
%hold on 
plot(vol,rfvol,'LineWidth',width,'Color','b')
%legend('5-yr','10-yr','30yr','short rate');
title('(B) Risk-free rate')
ylabel('Risk-free rate')
xlabel('Asset volatility of tree B');

subplot(2,2,3)
plot_c(vol,boundary);
legend('Short maturity (5y)','Baseline (10y)','Long maturity (30y)');
set(legend,'EdgeColor',[1 1 1], 'Location', 'northeast'); % the box becomes white
ylabel('Default boundary');
title('(C) Default boundary of tree A');
xlabel('Asset volatility of tree B');
ylim([0.2,0.4]);

subplot(2,2,4)
plot_c(vol,csvol);
title('(D) Credit spread of tree A');
xlabel('Asset volatility of tree B');
ylabel('Credit spread (bps)');


%% own shock
  
return
load('volcontagion_ownshock.mat');



agvol=(vol.^2*sa^2+ltparams.sigma2^2*(1-sa).^2+2*ltparams.sigma2*vol*ltparams.rho*sa*(1-sa))^(1/2);

figure2=figure;
set(figure2,'Position',[232 100 Width Height],'PaperPositionMode','auto')

subplot(2,2,1)
%plot(vol,rfmat*10000,'LineWidth',2);
%hold on 
plot(vol,agvol,'LineWidth',width,'Color','b')
%legend('5-yr','10-yr','30yr','short rate');
title('(A) riskfree short rate');

subplot(2,2,2)
%hold on 
plot(vol,rfvol*10000,'LineWidth',width,'Color','b')
%legend('5-yr','10-yr','30yr','short rate');
title('(B) riskfree short rate');

xlabel('vol of tree B');

subplot(2,2,3)

plot_c(vol,boundary);
legend('5-yr','10-yr','30yr');
  set(legend,'EdgeColor',[1 1 1], 'Location', 'northeast'); % the box becomes white

title('(C) Default boundary at share 0.5 of tree B');

subplot(2,2,4)
plot_c(vol,csvol);
title('credit spread of Tree B');
legend('5-yr','10-yr','30yr');
  set(legend,'EdgeColor',[1 1 1], 'Location', 'northwest'); % the box becomes white

xlabel(' vol of tree B');
title('((D) credit spread of tree B');

% % subplot(2,3,4)
% plot(vol, dtdvol,'LineWidth',2);
% legend('5-yr','10-yr','30yr');
% title('riskfree rate');
% title('distance to default');
% xlabel('vol of tree B');

function plot_c(vol,data)
  span = 10; width = 2;
  span = 10;

  yy1 = smooth(data(:,1),span);
  plot(vol, yy1,'LineWidth',width,'LineStyle',':','Color','r');
  hold on 
 
  yy2 = smooth(data(:,2),span);
  plot(vol, yy2,'LineWidth',width,'LineStyle','-','Color','b');
  hold on 
  
  yy3 = smooth(data(:,3),span);
  plot(vol, yy3,'LineWidth',width,'LineStyle','-.','Color','k');

  end 