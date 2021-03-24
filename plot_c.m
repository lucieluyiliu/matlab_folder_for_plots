function plot_c(s,decompose_stochastic,data_lev,data_mat,ylim_max)
  span = 10; width = 2;
  series = [zeros(1,5)'; max(0,decompose_stochastic(6:end,:,data_mat,data_lev,1))];
  yy1 = smooth(series,span);
  plot(s, yy1,'LineWidth',width,'LineStyle',':','Color','g');
  hold on 
  series = [zeros(1,5)'; max(0,decompose_stochastic(6:end,data_mat,data_lev,2))];
  yy2 = smooth(series,span);
  plot(s, yy2,'LineWidth',width,'LineStyle','-','Color','b');
  hold on 
  
  series = [zeros(1,5)'; max(0,decompose_stochastic(6:end,data_mat,data_lev,3))];
  yy3 = smooth(series,span);
  plot(s, yy3,'LineWidth',width,'LineStyle','-.','Color','k');
  hold on 
  series = [zeros(1,5)'; max(0,decompose_stochastic(6:end,data_mat,data_lev,4))];
  yy4 = smooth(series,span);
  plot(s, yy4,'LineWidth',width,'LineStyle','--','Color','r');
  ylim([0,ylim_max]);
  end 