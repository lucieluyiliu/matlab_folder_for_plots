%******run this line before start

s=0.01:0.01:0.99;


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



 ylim([0,200]);
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


%*************************
%  2. contagion tmr 3x3
%**************************


%stochastic component
figure
subplot(3,3,1)
%low leverage short term 
 h3=plot(s, decompose_stochastic(:,1,1),'LineWidth',1,'LineStyle',':','Color','k');
    hold on 
    hline=refline(0,0);
    set(hline,'Color','k','LineStyle','--','LineWidth',1);
  hold on 
text(-0.34,0.4,'5-year','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
    %---contagion bad or good fill in 
  low=decompose_stochastic(:,1,1)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(low,1,1)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
  high=decompose_stochastic(:,1,1)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(high,1,1)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
   alpha(0.3);
     ylim([0,400]);

title('low leverage');
xlabel('share of tree A');
ylabel('bps');


    %medium leverage short term
   subplot(3,3,2)


    h3=plot(s, decompose_stochastic(:,1,2),'LineWidth',1,'LineStyle',':','Color','k');
  
   
    hline=refline(0,0);
    set(hline,'Color','k','LineStyle','--','LineWidth',1);
 
      low=decompose_stochastic(:,1,2)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(low,1,2)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
  high=decompose_stochastic(:,1,2)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(high,1,2)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
   alpha(0.3);
     ylim([0,400]);

title('medium leverage');
    %high leverage short term 
    xlabel('share of tree A');
ylabel('bps');
 subplot(3,3,3)

    h3=plot(s, decompose_stochastic(:,1,3),'LineWidth',1,'LineStyle',':','Color','k');
    hold on 
  
    hline=refline(0,0);
    set(hline,'Color','k','LineStyle','--','LineWidth',1);
   
      low=decompose_stochastic(:,1,3)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(low,1,3)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
   alpha(0.3);

  high=decompose_stochastic(:,1,3)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(high,1,3)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
    alpha(0.3);
   ylim([0,400]); 

  title('high leverage'); 
    xlabel('share of tree A');
ylabel('bps');
 %---
%low leverage 10 year
 subplot(3,3,4)


    h3=plot(s, decompose_stochastic(:,2,1),'LineWidth',1,'LineStyle',':','Color','k');
    hold on 
        hline=refline(0,0);
    set(hline,'Color','k','LineStyle','--','LineWidth',1);
    
      hold on 
text(-0.34,0.4,'10-year','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  

      low=decompose_stochastic(:,2,1)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(low,2,1)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
 
  high=decompose_stochastic(:,2,1)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(high,2,1)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
    alpha(0.3);
    ylim([0,400]);

   %medium leverage 10 year 
   
    subplot(3,3,5)

     h3=plot(s, decompose_stochastic(:,2,2),'LineWidth',1,'LineStyle',':','Color','k');
     hold on 
  
      hline=refline(0,0);
    set(hline,'Color','k','LineStyle','--','LineWidth',1);
    
      low=decompose_stochastic(:,2,2)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(low,2,2)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');

  high=decompose_stochastic(:,2,2)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(high,2,2)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
     alpha(0.3);
     ylim([0,400]);
xlabel('share of tree A');
ylabel('bps');
    %high leverage 10 year
     subplot(3,3,6)


    h3=plot(s, decompose_stochastic(:,2,3),'LineWidth',1,'LineStyle',':','Color','K');
    hold on 
        hline=refline(0,0);
    set(hline,'Color','k','LineStyle','--','LineWidth',1);
    
      low=decompose_stochastic(:,2,3)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(low,2,3)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
  high=decompose_stochastic(:,2,3)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(high,2,3)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
   alpha(0.3);
  ylim([0,400]);
 

xlabel('share of tree A');
ylabel('bps');
    %low leverage perp 

 subplot(3,3,7)

    h3=plot(s, decompose_stochastic(:,4,1),'LineWidth',1,'LineStyle',':','Color','k');
    hold on 
    
        hline=refline(0,0);
    set(hline,'Color','k','LineStyle','--','LineWidth',1);
       hold on 
text(-0.34,0.4,'30-year','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
    low=decompose_stochastic(:,3,1)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(low,3,1)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
  high=decompose_stochastic(:,3,1)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(high,3,1)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
   alpha(0.3);
  ylim([0,400]);
xlabel('share of tree A');
ylabel('bps');
       
%medium leverage perp 

 subplot(3,3,8)


     h3=plot(s, decompose_stochastic(:,4,2),'LineWidth',1,'LineStyle',':','Color','K');
     hold on 
         hline=refline(0,0);
     set(hline,'Color','k','LineStyle','--','LineWidth',1);
%     
    low=decompose_stochastic(:,3,2)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(low,3,2)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');

  high=decompose_stochastic(:,3,2)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(high,3,2)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
     alpha(0.3);
 
ylim([0,400]);
xlabel('share of tree A');
ylabel('bps');

    %high leverage perp

 subplot(3,3,9)


    h3=plot(s, decompose_stochastic(:,4,3),'LineWidth',1,'LineStyle',':','Color','K');
    hold on 
        hline=refline(0,0);
    set(hline,'Color','k','LineStyle','--','LineWidth',1);
    
      low=decompose_stochastic(:,4,3)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(low,4,3)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
  high=decompose_stochastic(:,4,3)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(high,4,3)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
   alpha(0.3);
  ylim([0,400]);

xlabel('share of tree A');
ylabel('bps');
 


%*************************************
%3.contagion tmr adjusted for recovery
%*************************************
figure
subplot(4,3,1)
%low leverage short term 
 h3=plot(s, decompose_level(:,1,1),'LineWidth',1,'LineStyle',':','Color','k');
    hold on 
    hline=refline(0,0);
    set(hline,'Color','k','LineStyle','--','LineWidth',1);
  hold on 
text(-0.34,0.4,'5-year','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
    %---contagion bad or good fill in 
  low=decompose_level(:,1,1)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_level(low,1,1)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
  high=decompose_level(:,1,1)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_level(high,1,1)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
   alpha(0.3);
   % ylim([-200,200]);

title('low leverage');
xlabel('share of tree A');
ylabel('bps');


    %medium leverage short term
   subplot(4,3,2)


    h3=plot(s, decompose_level(:,1,2),'LineWidth',1,'LineStyle',':','Color','k');
  
   
    hline=refline(0,0);
    set(hline,'Color','k','LineStyle','--','LineWidth',1);
 
      low=decompose_level(:,1,2)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_level(low,1,2)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
  high=decompose_level(:,1,2)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_level(high,1,2)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
   alpha(0.3);
    % ylim([-200,200]);

title('medium leverage');
    %high leverage short term 
    xlabel('share of tree A');
ylabel('bps');
 subplot(4,3,3)

    h3=plot(s, decompose_level(:,1,3),'LineWidth',1,'LineStyle',':','Color','k');
    hold on 
  
    hline=refline(0,0);
    set(hline,'Color','k','LineStyle','--','LineWidth',1);
   
      low=decompose_level(:,1,3)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_level(low,1,3)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
   alpha(0.3);
  %ylim([-0.02,0.04]);
  high=decompose_level(:,1,3)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_level(high,1,3)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
    alpha(0.3);
  % ylim([-200,200]); 

  title('high leverage'); 
    xlabel('share of tree A');
ylabel('bps');
 %---
%low leverage 10 year
 subplot(4,3,4)


    h3=plot(s, decompose_level(:,2,1),'LineWidth',1,'LineStyle',':','Color','k');
    hold on 
        hline=refline(0,0);
    set(hline,'Color','k','LineStyle','--','LineWidth',1);
    
      hold on 
text(-0.34,0.4,'10-year','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  

      low=decompose_level(:,2,1)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_level(low,2,1)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
 
  high=decompose_level(:,2,1)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_level(high,2,1)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
    alpha(0.3);
  % ylim([-200,200]);

   %medium leverage 10 year 
   
    subplot(4,3,5)

   h3=plot(s, decompose_level(:,2,2),'LineWidth',1,'LineStyle',':','Color','K');
    hold on 
        hline=refline(0,0);
    set(hline,'Color','k','LineStyle','--','LineWidth',1);
    
      low=decompose_level(:,2,2)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_level(low,2,2)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
  high=decompose_level(:,2,2)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_level(high,2,2)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
   alpha(0.3);
  %ylim([-200,200]);
xlabel('share of tree A');
ylabel('bps');
    %high leverage 10 year
     subplot(4,3,6)

  h3=plot(s, decompose_level(:,2,3),'LineWidth',1,'LineStyle',':','Color','K');
    hold on 
        hline=refline(0,0);
    set(hline,'Color','k','LineStyle','--','LineWidth',1);
    
      low=decompose_level(:,2,3)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_level(low,2,3)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
  high=decompose_level(:,2,3)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_level(high,2,3)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
   alpha(0.3);
  

 

xlabel('share of tree A');
ylabel('bps');
    %low leverage perp 

 subplot(4,3,7)

    h3=plot(s, decompose_level(:,3,1),'LineWidth',1,'LineStyle',':','Color','k');
    hold on 
    
        hline=refline(0,0);
    set(hline,'Color','k','LineStyle','--','LineWidth',1);
       hold on 
text(-0.34,0.4,'20-year','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
    low=decompose_level(:,3,1)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_level(low,3,1)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
  high=decompose_level(:,3,1)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_level(high,3,1)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
   alpha(0.3);
  % ylim([-200,200]);
xlabel('share of tree A');
ylabel('bps');
       
%medium leverage perp 

 subplot(4,3,8)


    h3=plot(s, decompose_level(:,3,2),'LineWidth',1,'LineStyle',':','Color','K');
    hold on 
        hline=refline(0,0);
    set(hline,'Color','k','LineStyle','--','LineWidth',1);
    
    low=decompose_level(:,3,2)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_level(low,3,2)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');

  high=decompose_level(:,3,2)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_level(high,3,2)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
     alpha(0.3);
 %ylim([-200,200]);
xlabel('share of tree A');
ylabel('bps');

    %high leverage perp

 subplot(4,3,9)


    h3=plot(s, decompose_level(:,3,3),'LineWidth',1,'LineStyle',':','Color','K');
    hold on 
        hline=refline(0,0);
    set(hline,'Color','k','LineStyle','--','LineWidth',1);
    
      low=decompose_level(:,3,3)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_level(low,3,3)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
  high=decompose_level(:,3,3)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_level(high,3,3)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
   alpha(0.3);
  %ylim([-200,200]);

xlabel('share of tree A');
ylabel('bps');
 

subplot(4,3,10)


    h3=plot(s, decompose_level(:,4,1),'LineWidth',1,'LineStyle',':','Color','K');
    hold on 
        hline=refline(0,0);
        
    set(hline,'Color','k','LineStyle','--','LineWidth',1);
    text(-0.34,0.4,'30-year','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
 
      low=decompose_level(:,4,1)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_level(low,4,1)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
  high=decompose_level(:,4,1)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_level(high,4,1)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
   alpha(0.3);
  %ylim([-200,200]);

xlabel('share of tree A');
ylabel('bps');

subplot(4,3,11)


    h3=plot(s, decompose_level(:,4,2),'LineWidth',1,'LineStyle',':','Color','K');
    hold on 
        hline=refline(0,0);
    set(hline,'Color','k','LineStyle','--','LineWidth',1);

      low=decompose_level(:,4,2)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_level(low,4,2)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
  high=decompose_level(:,4,2)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_level(high,4,2)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
   alpha(0.3);
  %ylim([-200,200]);

xlabel('share of tree A');
ylabel('bps');

subplot(4,3,12)


    h3=plot(s, decompose_level(:,4,3),'LineWidth',1,'LineStyle',':','Color','K');
    hold on 
        hline=refline(0,0);
    set(hline,'Color','k','LineStyle','--','LineWidth',1);

      low=decompose_level(:,4,3)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_level(low,4,3)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
  high=decompose_level(:,4,3)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_level(high,4,3)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
   alpha(0.3);
  %ylim([-200,200]);

xlabel('share of tree A');
ylabel('bps');

%************************************
%4.contagion tmr and  and full spread together
%*************************************
figure
subplot(3,3,1)
%low leverage short term 
h1=plot(s, decompose_spread(:,1,1),'LineWidth',1,'Color','b');
    hold on
text(-0.32,0.4,'5-year','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
    ylim([0,400]);
    
    
    h3=plot(s, decompose_stochastic(:,1,1),'LineWidth',1,'LineStyle',':','Color','k');
    hold on 
    hline=refline(0,0);
    set(hline,'Color','k','LineStyle','--','LineWidth',1);
  hold on 
   %---contagion bad or good fill in 
  low=decompose_stochastic(:,1,1)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(low,1,1)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
  high=decompose_stochastic(:,1,1)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(high,1,1)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
   alpha(0.3);
     ylim([0,400]);
title('low leverage');
xlabel('share of tree A');
ylabel('bps');
%    legend([h1 h2 h3],{'CS','No stochastic','fix level'});

    %medium leverage short term
   subplot(3,3,2)

h1=plot(s, decompose_spread(:,1,2),'LineWidth',1,'Color','b');
    hold on
h3=plot(s, decompose_stochastic(:,1,2),'LineWidth',1,'LineStyle',':','Color','k');
    hold on 
    hline=refline(0,0);
    set(hline,'Color','k','LineStyle','--','LineWidth',1);
  hold on 
    %---contagion bad or good fill in 
  low=decompose_stochastic(:,1,2)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(low,1,2)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
  high=decompose_stochastic(:,1,2)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(high,1,2)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
   alpha(0.3);
     ylim([0,400]);
%text(-0.3,0.4,'5-year','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
     ylim([0,400]);
title('low leverage');
xlabel('share of tree A');
ylabel('bps');
 %   legend([h1 h2 h3],{'CS','No stochastic','fix level'});


 subplot(3,3,3)
h1=plot(s, decompose_spread(:,1,3),'LineWidth',1,'Color','b');
    hold on
h3=plot(s, decompose_stochastic(:,1,3),'LineWidth',1,'LineStyle',':','Color','k');
    hold on 
    hline=refline(0,0);
    set(hline,'Color','k','LineStyle','--','LineWidth',1);
  hold on 
 %---contagion bad or good fill in 
  low=decompose_stochastic(:,1,3)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(low,1,3)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
  high=decompose_stochastic(:,1,3)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(high,1,3)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
   alpha(0.3);
     ylim([0,400]);
%text(-0.35,0.4,'5-year','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
    ylim([0,400]);
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
h3=plot(s, decompose_stochastic(:,2,1),'LineWidth',1,'LineStyle',':','Color','k');
    hold on 
    hline=refline(0,0);
    set(hline,'Color','k','LineStyle','--','LineWidth',1);
  hold on 
text(-0.32,0.4,'10-year','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
    %---contagion bad or good fill in 
  low=decompose_stochastic(:,2,1)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(low,2,1)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
  high=decompose_stochastic(:,2,1)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(high,2,1)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
   alpha(0.3);
     ylim([0,400]);
   ylim([0,400]);

 %   legend([h1 h2 h3],{'CS','No stochastic','fix level'});



   %medium leverage 10 year 
   
    subplot(3,3,5)
h1=plot(s, decompose_spread(:,2,2),'LineWidth',1,'Color','b');
    hold on
h3=plot(s, decompose_stochastic(:,2,2),'LineWidth',1,'LineStyle',':','Color','k');
    hold on 
    hline=refline(0,0);
    set(hline,'Color','k','LineStyle','--','LineWidth',1);
  hold on 
  %text(-0.32,0.4,'10-year','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  

   %---contagion bad or good fill in 
  low=decompose_stochastic(:,2,2)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(low,2,2)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
  high=decompose_stochastic(:,2,2)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(high,2,2)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
   alpha(0.3);
     ylim([0,400]);
%text(-0.35,0.4,'5-year','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
     ylim([0,400]);

 %   legend([h1 h2 h3],{'CS','No stochastic','fix level'});


xlabel('share of tree A');
ylabel('bps');
    %high leverage 10 year
     subplot(3,3,6)

h1=plot(s, decompose_spread(:,2,3),'LineWidth',1,'Color','b');
    hold on
h3=plot(s, decompose_stochastic(:,2,3),'LineWidth',1,'LineStyle',':','Color','k');
    hold on 
    hline=refline(0,0);
    set(hline,'Color','k','LineStyle','--','LineWidth',1);
  hold on 
   %---contagion bad or good fill in 
  low=decompose_stochastic(:,2,3)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(low,2,3)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
  high=decompose_stochastic(:,2,3)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(high,2,3)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
   alpha(0.3);
     ylim([0,400]);
%text(-0.35,0.4,'5-year','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
%     ylim([-400,400]);

 %   legend([h1 h2 h3],{'CS','No stochastic','fix level'});

    hold on 
   % ylim([-400,400]);
  

xlabel('share of tree A');
ylabel('bps');
    %low leverage perp 

 subplot(3,3,7)

h1=plot(s, decompose_spread(:,4,1),'LineWidth',1,'Color','b');
    hold on
h3=plot(s, decompose_stochastic(:,4,1),'LineWidth',1,'LineStyle',':','Color','k');
    hold on 
    hline=refline(0,0);
    set(hline,'Color','k','LineStyle','--','LineWidth',1);
  hold on 
text(-0.32,0.4,'30-year','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
    %---contagion bad or good fill in 
  low=decompose_stochastic(:,4,1)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(low,4,1)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
  high=decompose_stochastic(:,4,1)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(high,4,1)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
   alpha(0.3);
     ylim([0,400]);


       hold on 
%text(-0.35,0.4,'perpetual','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
   %ylim([-400,400]);

xlabel('share of tree A');
ylabel('bps');
       
%medium leverage perp 

 subplot(3,3,8)

h1=plot(s, decompose_spread(:,4,2),'LineWidth',1,'Color','b');
    hold on
h3=plot(s, decompose_stochastic(:,4,2),'LineWidth',1,'LineStyle',':','Color','k');
    hold on 
    hline=refline(0,0);
    set(hline,'Color','k','LineStyle','--','LineWidth',1);
  hold on 
   %---contagion bad or good fill in 
  low=decompose_stochastic(:,4,2)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(low,4,2)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
  high=decompose_stochastic(:,4,2)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(high,4,2)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
   alpha(0.3);
     ylim([0,400]);
%text(-0.35,0.4,'5-year','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
 %    ylim([-400,400]);

 %   legend([h1 h2 h3],{'CS','No stochastic','fix level'});



 ylim([0,400]);
xlabel('share of tree A');
ylabel('bps');

    %high leverage perp

 subplot(3,3,9)

h1=plot(s,  decompose_spread(:,4,3),'LineWidth',1,'Color','b');
    hold on
 h3=plot(s, decompose_stochastic(:,4,3),'LineWidth',1,'LineStyle',':','Color','k');
    hold on 
    hline=refline(0,0);
    set(hline,'Color','k','LineStyle','--','LineWidth',1);
  hold on 
  %---contagion bad or good fill in 
  low=decompose_stochastic(:,4,3)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(low,4,3)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
  high=decompose_stochastic(:,4,3)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(high,4,3)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
   alpha(0.3);
     ylim([0,400]);
%text(-0.3,0.4,'5-year','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
     ylim([0,400]);
 %   legend([h1 h2 h3],{'CS','No stochastic','fix level'});


     
xlabel('share of tree A');
ylabel('bps');



%*******************************************
%5.erverything full, nocontagion, contagion
%*******************************************
figure
subplot(3,3,1)
%low leverage short term 
h1=plot(s, decompose_spread(:,1,1),'LineWidth',1,'Color','b');
    hold on
 h2=plot(s,decompose_spreadnc(:,1,1),'lineWidth',1,'Color',c('forest green (web)'));
 hold on 
 h3=plot(s, decompose_stochastic(:,1,1),'LineWidth',1,'LineStyle',':','Color','k');
    hold on 
%     hline=refline(0,0);
%     set(hline,'Color','k','LineStyle','--','LineWidth',1);
%   hold on 
text(-0.2,0.4,'5-year','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
    %---contagion bad or good fill in 
  low=decompose_stochastic(:,1,1)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(low,1,1)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
  high=decompose_stochastic(:,1,1)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(high,1,1)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
   alpha(0.3);
     ylim([-100,200]);
    legend([h1 h2 h3],{'CS','No contagion CS','P-contagion'});
title('low leverage');
xlabel('share of tree A');
ylabel('bps');


    %medium leverage short term
   subplot(3,3,2)

h1=plot(s, decompose_spread(:,1,2),'LineWidth',1,'Color','b');
    hold on
    hold on 
    h2=plot(s,decompose_spreadnc(:,1,2),'linewidth',1,'Color',c('forest green (web)'));
    h3=plot(s, decompose_stochastic(:,1,2),'LineWidth',1,'LineStyle',':','Color','k');
  
   
%     hline=refline(0,0);
%     set(hline,'Color','k','LineStyle','--','LineWidth',1);
%  
      low=decompose_stochastic(:,1,2)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(low,1,2)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
  high=decompose_stochastic(:,1,2)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(high,1,2)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
   alpha(0.3);
     ylim([-100,200]);
   legend([h1 h2 h3],{'CS','No contagion CS','P-contagion'});
title('medium leverage');
    %high leverage short term 
    xlabel('share of tree A');
ylabel('bps');
 subplot(3,3,3)
h1=plot(s, decompose_spread(:,1,3),'LineWidth',1,'Color','b');
    hold on
    hold on 
    h2=plot(s,decompose_spreadnc(:,1,3),'linewidth',1,'Color',c('forest green (web)'));
    h3=plot(s, decompose_stochastic(:,1,3),'LineWidth',1,'LineStyle',':','Color','k');
    hold on 
  
%     hline=refline(0,0);
%     set(hline,'Color','k','LineStyle','--','LineWidth',1);
%    
      low=decompose_stochastic(:,1,3)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(low,1,3)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
   alpha(0.3);
  %ylim([-0.02,0.04]);
  high=decompose_stochastic(:,1,3)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(high,1,3)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
    alpha(0.3);
   ylim([-100,200]); 
  legend([h1 h2 h3],{'CS','No contagion CS','P-contagion'});
  title('high leverage'); 
    xlabel('share of tree A');
ylabel('bps');
 %---
%low leverage 10 year
 subplot(3,3,4)

h1=plot(s, decompose_spread(:,2,1),'LineWidth',1,'Color','b');
    hold on
    hold on 
    h2=plot(s,decompose_spreadnc(:,2,1),'linewidth',1,'Color',c('forest green (web)'));
    h3=plot(s, decompose_stochastic(:,2,1),'LineWidth',1,'LineStyle',':','Color','k');
    hold on 
%         hline=refline(0,0);
%     set(hline,'Color','k','LineStyle','--','LineWidth',1);
%     
      hold on 
text(-0.2,0.4,'10-year','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  

      low=decompose_stochastic(:,2,1)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(low,2,1)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
 
  high=decompose_stochastic(:,2,1)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(high,2,1)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
    alpha(0.3);
    ylim([-100,200]);
   legend([h2 h2 h3],{'CS','No contagion CS','P-contagion'});  

   %medium leverage 10 year 
   
    subplot(3,3,5)

h1=plot(s, decompose_spread(:,2,2),'LineWidth',1,'Color','b');
    hold on
    hold on 
    h2=plot(s,decompose_spreadnc(:,2,2),'linewidth',1,'Color',c('forest green (web)'));
    h3=plot(s, decompose_stochastic(:,2,2),'LineWidth',1,'LineStyle',':','Color','k');
    hold on 
%         hline=refline(0,0);
%     set(hline,'Color','k','LineStyle','--','LineWidth',1);

      low=decompose_stochastic(:,2,2)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(low,2,2)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');

  high=decompose_stochastic(:,2,2)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(high,2,2)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
     alpha(0.3);
     ylim([-100,200]);
        legend([h1 h2 h3],{'CS','No contagion CS','P-contagion'});
xlabel('share of tree A');
ylabel('bps');
    %high leverage 10 year
     subplot(3,3,6)

h1=plot(s, decompose_spread(:,2,3),'LineWidth',1,'Color','b');
    hold on
    hold on 
%         hline=refline(0,0);
%     set(hline,'Color','k','LineStyle','--','LineWidth',1);
    h2=plot(s,decompose_spreadnc(:,2,3),'linewidth',1,'Color',c('forest green (web)'));
    h3=plot(s, decompose_stochastic(:,2,3),'LineWidth',1,'LineStyle',':','Color','k');
    hold on 
    ylim([-100,200]);
      
      low=decompose_stochastic(:,2,3)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(low,2,3)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
  high=decompose_stochastic(:,2,3)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(high,2,3)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
   alpha(0.3);
 
  legend([h1 h2 h3],{'CS','No contagion CS','P-contagion'});
xlabel('share of tree A');
ylabel('bps');
    %low leverage perp 

 subplot(3,3,7)

h1=plot(s, decompose_spread(:,4,1),'LineWidth',1,'Color','b');
    hold on
    hold on 
    h2=plot(s,decompose_spread(:,4,1),'linewidth',1,'Color',c('forest green (web)'));
    h3=plot(s, decompose_stochastic(:,4,1),'LineWidth',1,'LineStyle',':','Color','k');
    hold on 
    
%         hline=refline(0,0);
%     set(hline,'Color','k','LineStyle','--','LineWidth',1);
%        hold on 
text(-0.2,0.4,'30-year','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
    low=decompose_stochastic(:,3,1)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(low,3,1)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
  high=decompose_stochastic(:,3,1)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(high,3,1)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
   alpha(0.3);
   ylim([-100,200]);
  legend([h1 h2 h3],{'CS','No contagion CS','P-contagion'});
xlabel('share of tree A');
ylabel('bps');
       
%medium leverage perp 

 subplot(3,3,8)

h1=plot(s, decompose_spread(:,4,2),'LineWidth',1,'Color','b');
    hold on
    hold on 
    h2=plot(s,decompose_spreadnc(:,4,2),'linewidth',1,'Color',c('forest green (web)'));
    h3=plot(s, decompose_stochastic(:,4,2),'LineWidth',1,'LineStyle',':','Color','K');
    hold on 
%         hline=refline(0,0);
%     set(hline,'Color','k','LineStyle','--','LineWidth',1);
%     
      low=decompose_stochastic(:,4,2)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(low,4,2)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
  high=decompose_stochastic(:,4,2)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(high,4,2)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
   alpha(0.3);
  ylim([-100,200]);
    legend([h1 h2 h3],{'CS','No contagion CS','P-contagion'});
xlabel('share of tree A');
ylabel('bps');

    %high leverage perp

 subplot(3,3,9)

h1=plot(s, decompose_spread(:,4,3),'LineWidth',1,'Color','b');
    hold on
    hold on 
    h2=plot(s,decompose_spreadnc(:,4,3),'linewidth',1,'Color',c('forest green (web)'));
    h3=plot(s, decompose_stochastic(:,4,3),'LineWidth',1,'LineStyle',':','Color','K');
    hold on 
%         hline=refline(0,0);
%     set(hline,'Color','k','LineStyle','--','LineWidth',1);
%     
      low=decompose_stochastic(:,4,3)<0;
  xa=s(low);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(low,4,3)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'g');
  high=decompose_stochastic(:,4,3)>0;
  xa=s(high);
  y1a=zeros(1,length(xa));
  y2a=decompose_stochastic(high,4,3)';
  patch([xa fliplr(xa)],[y1a fliplr(y2a)],'r');
   alpha(0.3);
  ylim([-100,200]);
    legend([h1 h2 h3],{'CS','No contagion CS','P-contagion'});
xlabel('share of tree A');
ylabel('bps');

%**********************
%6.term structure of CS
%***********************
termstructure=decompose_spread(:,4,:)-decompose_spread(:,1,:);
figure
subplot(1,3,1)
plot(s,termstructure(:,1,1),'LineWidth',1.5,'Color','k');
title('low leverage');
ylim([0,100]);

subplot(1,3,2)
plot(s,termstructure(:,1,2),'LineWidth',1.5,'Color','k');
title('medium leverage');
ylim([0,100]);

subplot(1,3,3)
plot(s,termstructure(:,1,3),'LineWidth',1.5,'Color','k');
title('high leverage');
ylim([0,100]);
legend('30yr-5yr');