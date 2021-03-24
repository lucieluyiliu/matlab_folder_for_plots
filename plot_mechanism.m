
% This figure plots the mechanism of default contagion 

Height = 800;
Width = 700;
width = 1.5;

csss1=csss;
dtdss1=dtdss;
csss1(1,1)=csss(1,1)*0.5;
dtdss1(1,1)=dtdss(1,1)*1.5;
figure1 = figure;
set(figure1,'Position',[232 100 Width Height],'PaperPositionMode','auto')

subplot(4,2,1)
bar(db);
%text(1:length(db),db,num2str(db'),'vert','bottom','horiz','center'); 
xticklabels({'Negative','Baseline','Positive'}); 
ylabel('Dividend level');
ylim([0,2]);
set(gca,'YTickLabel',[]);
title('(A) Dividend of tree A')

subplot(4,2,2)
bar(da);
%text(1:length(da),da,num2str(da'),'vert','bottom','horiz','center'); 
xticklabels({'Negative','Baseline','Positive'}); 
ylim([0,2])
title('(B) Dividend of tree B')
set(gca,'YTickLabel',[]);
%xlabel('Shock to tree B');

subplot(4,2,3)
bar(premiumss(:,2));
ylabel('Expected excess return');
%xlabel('Shock to tree B');
ylim([0,0.03]);
xticklabels({'Negative','Baseline','Positive'}); 
set(gca,'YTickLabel',[]);
title('(C) Risk premium of tree A')


subplot(4,2,4)
bar(premiumss(:,1));
ylim([0,0.03]);
xticklabels({'Negative','Baseline','Positive'}); 
set(gca,'YTickLabel',[]);
title('(D) Risk premium of tree B')

subplot(4,2,5)
bar(dtdss(:,2));
ylabel('Distance to default')
ylim([0.2,1]);
xticklabels({'Negative','Baseline','Positive'}); 
set(gca,'YTickLabel',[]);
title('(E) Creditworthiness of tree A')

subplot(4,2,6)
bar(dtdss1(:,1));
ylim([0.2,1]);
xticklabels({'Negative','Baseline','Positive'}); 
set(gca,'YTickLabel',[]);
title('(F) Creditworthiness of tree B')

subplot(4,2,7)
bar(csss(:,2));
ylabel('Credit spread')
ylim([0,200]);
xticklabels({'Negative','Baseline','Positive'}); 
xlabel('Shock to tree B');
set(gca,'YTickLabel',[]);
title('(G) Credit spread of tree A')

subplot(4,2,8)
bar(csss1(:,1));
ylim([0,200]);
xticklabels({'Negative','Baseline','Positive'}); 
xlabel('Shock to tree B');
set(gca,'YTickLabel',[]);
title('(H) Credit spread of tree B')



