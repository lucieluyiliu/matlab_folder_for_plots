
% This figure plots the default contagion for different thetas 

Height = 650;
Width = 900;
width = 2;


load('decompose_theta.mat');
s=0.01:0.01:0.99;
ylim_max = 350;


figure1 = figure;
set(figure1,'Position',[232 100 Width Height],'PaperPositionMode','auto')


subplot(3,3,1)
  data_lev=1; data_mat=1;
  plot_c(s,decompose_stochastic_theta1,decompose_stochastic_theta08,data_lev,data_mat,ylim_max)
  title('(A) Low leverage, short maturity');
  ylabel('Credit spread (bps)');
  
subplot(3,3,2)
  data_lev=2; data_mat=1;
  plot_c(s,decompose_stochastic_theta1,decompose_stochastic_theta08,data_lev,data_mat,ylim_max)
  title('(B) Short maturity');
  
subplot(3,3,3)
  data_lev=3; data_mat=1;
  plot_c(s,decompose_stochastic_theta1,decompose_stochastic_theta08,data_lev,data_mat,ylim_max)
  title('(C) High leverage, short maturity');
  
subplot(3,3,4)
  data_lev=1;data_mat=2;
  plot_c(s,decompose_stochastic_theta1,decompose_stochastic_theta08,data_lev,data_mat,ylim_max)
  title('(D) Low leverage');
  ylabel('Credit spread (bps)');
  
subplot(3,3,5)
  data_lev=2;data_mat=2;
  plot_c(s,decompose_stochastic_theta1,decompose_stochastic_theta08,data_lev,data_mat,ylim_max)
  title('(E) Baseline');
  legend({'Without liquidation costs  (\theta=1)','With liquidation costs (\theta=0.8)'});
  set(legend,'EdgeColor',[1 1 1], 'Location', 'northwest'); % the box becomes white

  
subplot(3,3,6)
  data_lev=3;data_mat=2;
  plot_c(s,decompose_stochastic_theta1,decompose_stochastic_theta08,data_lev,data_mat,ylim_max)
  title('(F) High leverage');
  
subplot(3,3,7)
  data_lev=1;data_mat=3;
  plot_c(s,decompose_stochastic_theta1,decompose_stochastic_theta08,data_lev,data_mat,ylim_max)
  title('(G) Low leverage, high maturity');
  ylabel('Credit spread (bps)');
  xlabel('Share of tree A');

subplot(3,3,8)
  data_lev=2;data_mat=3;
  plot_c(s,decompose_stochastic_theta1,decompose_stochastic_theta08,data_lev,data_mat,ylim_max)
  title('(H) High maturity');
  xlabel('Share of tree A');

subplot(3,3,9)
  ddata_lev=3;data_mat=3;
  plot_c(s,decompose_stochastic_theta1,decompose_stochastic_theta08,data_lev,data_mat,ylim_max)
  title('(I) High leverage, high maturity');
  xlabel('Share of tree A');

  function plot_c(s,decompose_stochastic_theta1,decompose_stochastic_theta08,data_lev,data_mat,ylim_max)
  span = 10; width = 2;
  series = [zeros(1,5)'; max(0,decompose_stochastic_theta1(6:end,data_mat,data_lev))];
  yy2 = smooth(series,span);
  plot(s, yy2,'LineWidth',width,'LineStyle','-','Color','b');
  hold on 
  series = [zeros(1,5)'; max(0,decompose_stochastic_theta08(6:end,data_mat,data_lev))];
  yy3 = smooth(series,span);
  plot(s, yy3,'LineWidth',width,'LineStyle','-.','Color','k');
  ylim([0,ylim_max]);
  end 