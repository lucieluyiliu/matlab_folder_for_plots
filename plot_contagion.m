
% This figure plots the default contagion by maturity and leverage 

Height = 650;
Width = 900;
width = 2;

load('twotreesdecompose.mat');
s=0.01:0.01:0.99;
ylim_max = 100;

figure1 = figure;
set(figure1,'Position',[232 100 Width Height],'PaperPositionMode','auto')


subplot(3,3,1)
  data_lev=1; data_mat=1;
  plot_c(s,decompose_stochastic,data_lev,data_mat,ylim_max)
  title('(A) Low leverage, short maturity');
  ylabel('Credit spread (bps)');
  
subplot(3,3,2)
  data_lev=2; data_mat=1;
  plot_c(s,decompose_stochastic,data_lev,data_mat,ylim_max)
  title('(B) Short maturity');
  
subplot(3,3,3)
  data_lev=3; data_mat=1;
  plot_c(s,decompose_stochastic,data_lev,data_mat,ylim_max)
  title('(C) High leverage, short maturity');
  
subplot(3,3,4)
  data_lev=1;data_mat=2;
  plot_c(s,decompose_stochastic,data_lev,data_mat,ylim_max)
  title('(D) Low leverage');
  ylabel('Credit spread (bps)');
  
subplot(3,3,5)
  data_lev=2;data_mat=2;
  plot_c(s,decompose_stochastic,data_lev,data_mat,ylim_max)
  title('(E) Baseline');
  
subplot(3,3,6)
  data_lev=3;data_mat=2;
  plot_c(s,decompose_stochastic,data_lev,data_mat,ylim_max)
  title('(F) High leverage');
  
subplot(3,3,7)
  data_lev=1;data_mat=4;
  plot_c(s,decompose_stochastic,data_lev,data_mat,ylim_max)
  title('(G) Low leverage, high maturity');
  ylabel('Credit spread (bps)');
  xlabel('Share of tree A');

subplot(3,3,8)
  data_lev=2;data_mat=4;
  plot_c(s,decompose_stochastic,data_lev,data_mat,ylim_max)
  title('(H) High maturity');
  xlabel('Share of tree A');

subplot(3,3,9)
  ddata_lev=3;data_mat=4;
  plot_c(s,decompose_stochastic,data_lev,data_mat,ylim_max)
  title('(I) High leverage, high maturity');
  xlabel('Share of tree A');

  function plot_c(s,decompose_stochastic,data_lev,data_mat,ylim_max)
  span = 10;
  series = [zeros(1,5)'; max(0,decompose_stochastic(6:end,data_mat,data_lev))];
  yy = smooth(series,span);
  %yy = max(0,smooth(decompose_stochastic(:,data_mat,data_lev),span));
  h3=plot(s, yy,'LineWidth',2,'LineStyle','-','Color','b');
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
  
  %xa=s;
  
%   y1a=zeros(1,length(xa));
%   y2a=max(0,decompose_stochastic(:,data_mat,data_lev)');
%   y2a = [zeros(1,5) y2a(6:end)];
%   y2a = smooth(y2a',span)';
%   
%   patch([xa fliplr(xa)],[y1a fliplr(y2a)],'b');
%   alpha(0.4);
  ylim([0,ylim_max]);
  end 
 
