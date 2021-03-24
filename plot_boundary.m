
% This figure plots the default boundaries by maturity and leverage 

Height = 300;
Width = 1000;
width = 2;
sharegrid=0.01:0.02:1;
series=mat_bound_mat;

figure1 = figure;
set(figure1,'Position',[232 100 Width Height],'PaperPositionMode','auto')

subplot(1,3,1)
h3=plot(sharegrid, series(:,1,3),'LineWidth',width,'Color','r','LineStyle','-.');
hold on
h2=plot(sharegrid, series(:,1,2),'LineWidth',width,'Color','b','LineStyle','-');
hold on
h1=plot(sharegrid, series(:,1,1),'LineWidth',width,'Color','k','LineStyle','--');
ylim([0,0.6]);
title('(A) Short maturity (5-year)');
xlabel('Share of tree A');
ylabel('Default boundary');

subplot(1,3,2)
h3=plot(sharegrid, series(:,2,3),'LineWidth',width,'Color','r','LineStyle','-.');
hold on
h2=plot(sharegrid, series(:,2,2),'LineWidth',width,'Color','b','LineStyle','-');
hold on
h1=plot(sharegrid, series(:,2,1),'LineWidth',width,'Color','k','LineStyle','--');
ylim([0,0.6]);
title('(B) Baseline maturity (10-year)');
xlabel('Share of tree A');
legend({'High leverage','Baseline','Low leverage'});
set(legend,'EdgeColor',[1 1 1], 'Location', 'northwest'); % the box becomes white

subplot(1,3,3)
h3=plot(sharegrid, series(:,3,3),'LineWidth',width,'Color','r','LineStyle','-.');
hold on
h2=plot(sharegrid, series(:,3,2),'LineWidth',width,'Color','b','LineStyle','-');
hold on
h1=plot(sharegrid, series(:,3,1),'LineWidth',width,'Color','k','LineStyle','--');
ylim([0,0.6]);
title('(C) Long maturity (30-year)');
xlabel('Share of tree A');