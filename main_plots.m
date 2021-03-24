close all;

% This code generates the main plots


%load('twotree_forplot20200511.mat');

load('twotree_forplot20201021.mat');


% This code plots the asset pricing quantities 
plot_asset_quantities

% This code plots the mechanism of default contagion 
plot_mechanism

% This code plots the default boundaries by maturity and leverage 
plot_boundary

% This code plots the credit spreads by maturity and leverage 
plot_cs

% This code plots the default contagion by maturity and leverage 
plot_contagion

% This code plots the default contagion by correlation level 
plot_contagion_rho

% This code plots the default contagion by recovery rate 
plot_contagion_theta

%This code plots the vol contagion plot
plot_contagion_vol