

s=0.01:0.01:0.99;


% This figure plots the default boundaries by maturity and leverage 

Height = 300;
Width = 1000;
width = 2;
span = 10;
series=decompose_spread;

figure1 = figure;
set(figure1,'Position',[232 100 Width Height],'PaperPositionMode','auto')

subplot(1,3,1)
h3=plot(s, smooth(series(:,1,3),span),'LineWidth',width,'Color','r','LineStyle','-.');
hold on
h2=plot(s, smooth(series(:,1,2),span),'LineWidth',width,'Color','b','LineStyle','-');
hold on
h1=plot(s, smooth(series(:,1,1),span),'LineWidth',width,'Color','k','LineStyle','--');
ylim([0,400]);
title('(A) Short maturity (5-year)');
xlabel('Share of tree A');
ylabel('Credit spread (bps)');

subplot(1,3,2)
h3=plot(s, smooth(series(:,2,3),span),'LineWidth',width,'Color','r','LineStyle','-.');
hold on
h2=plot(s, smooth(series(:,2,2),span),'LineWidth',width,'Color','b','LineStyle','-');
hold on
h1=plot(s, smooth(series(:,2,1),span),'LineWidth',width,'Color','k','LineStyle','--');
ylim([0,400]);
title('(B) Baseline maturity (10-year)');
xlabel('Share of tree A');
legend({'High leverage','Baseline','Low leverage'});
set(legend,'EdgeColor',[1 1 1], 'Location', 'northwest'); % the box becomes white

subplot(1,3,3)
h3=plot(s, smooth(series(:,2,3),span),'LineWidth',width,'Color','r','LineStyle','-.');
hold on
h2=plot(s, smooth(series(:,2,2),span),'LineWidth',width,'Color','b','LineStyle','-');
hold on
h1=plot(s, smooth(series(:,2,1),span),'LineWidth',width,'Color','k','LineStyle','--');
ylim([0,400]);
title('(C) Long maturity (30-year)');
xlabel('Share of tree A');

return
%*****************************
%only full spread 3x3 plot
%******************************
figure
subplot(3,3,1)
%low leverage short term 
h1=plot(s, decompose_spread(:,1,1),'LineWidth',1,'Color','b');
    hold on
text(-0.32,0.4,'5-year','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
    ylim([0,400]);
title('low leverage');
xlabel('share of tree A');
ylabel('bps');
%    legend([h1 h2 h3],{'CS','No stochastic','fix level'});

    %medium leverage short term
   subplot(3,3,2)

h1=plot(s, decompose_spread(:,1,2),'LineWidth',1,'Color','b');
    hold on

%text(-0.3,0.4,'5-year','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
     ylim([0,400]);
title('low leverage');
xlabel('share of tree A');
ylabel('bps');
 %   legend([h1 h2 h3],{'CS','No stochastic','fix level'});


 subplot(3,3,3)
h1=plot(s, decompose_spread(:,1,3),'LineWidth',1,'Color','b');
    hold on

%text(-0.35,0.4,'5-year','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
%    ylim([0,200]);
title('low leverage');
xlabel('share of tree A');
ylabel('bps');
    %legend([h1 h2 h3],{'CS','No stochastic','fix level'});


    
   ylim([0,400]); 
 
  title('high leverage'); 
    xlabel('share of tree A');
ylabel('bps');
 %---
%low leverage 10 year
 subplot(3,3,4)
h1=plot(s, decompose_spread(:,2,1),'LineWidth',1,'Color','b');
    hold on

text(-0.32,0.4,'10-year','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
     ylim([0,400]);
%title('low leverage');
xlabel('share of tree A');
ylabel('bps');
 %   legend([h1 h2 h3],{'CS','No stochastic','fix level'});



   %medium leverage 10 year 
   
    subplot(3,3,5)
h1=plot(s, decompose_spread(:,2,2),'LineWidth',1,'Color','b');
    hold on

%text(-0.35,0.4,'5-year','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
     ylim([0,400]);
%title('low leverage');
xlabel('share of tree A');
ylabel('bps');
 %   legend([h1 h2 h3],{'CS','No stochastic','fix level'});


xlabel('share of tree A');
ylabel('bps');
    %high leverage 10 year
     subplot(3,3,6)

h1=plot(s, decompose_spread(:,2,3),'LineWidth',1,'Color','b');
    hold on

%text(-0.35,0.4,'5-year','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
     ylim([0,400]);
%title('low leverage');
xlabel('share of tree A');
ylabel('bps');
 %   legend([h1 h2 h3],{'CS','No stochastic','fix level'});

    hold on 
   % ylim([-400,400]);
  

xlabel('share of tree A');
ylabel('bps');
    %low leverage perp 

 subplot(3,3,7)

h1=plot(s, decompose_spread(:,4,1),'LineWidth',1,'Color','b');
    hold on

text(-0.32,0.4,'30-year','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
     ylim([0,400]);
%title('low leverage');
xlabel('share of tree A');
ylabel('bps');



       hold on 
%text(-0.35,0.4,'perpetual','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
   %ylim([-400,400]);

xlabel('share of tree A');
ylabel('bps');
       
%medium leverage perp 

 subplot(3,3,8)

h1=plot(s, decompose_spread(:,4,2),'LineWidth',1,'Color','b');
    hold on

%text(-0.35,0.4,'5-year','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
     ylim([0,400]);
%title('low leverage');
xlabel('share of tree A');
ylabel('bps');
 %   legend([h1 h2 h3],{'CS','No stochastic','fix level'});



 ylim([0,400]);
xlabel('share of tree A');
ylabel('bps');

    %high leverage perp

 subplot(3,3,9)

h1=plot(s,  decompose_spread(:,4,3),'LineWidth',1,'Color','b');
    hold on
%text(-0.3,0.4,'5-year','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
     ylim([0,400]);
%title('low leverage');
xlabel('share of tree A');
ylabel('bps');
 %   legend([h1 h2 h3],{'CS','No stochastic','fix level'});


     
xlabel('share of tree A');
ylabel('bps');