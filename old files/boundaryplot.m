
%*************************
%  1.3x3 boundary plot
%**************************

figure
 
 subplot(3,3,1)
  plot(sharegrid, mat_bound_mat(:,1,1),'LineWidth',1,'Color','k');
    hold on
   text(-0.32,0.4,'5-yr','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
    %plot(sharegrid, mat_bound_mat_nc(:,i),'LineWidth',1,'LineStyle',':','Color',[abs(xgrid(i)/xgrid(n)),0,0]);
    hold on
    hline=refline(0,mat_bound_mat(25,1,1));
    hold on 
    %plot(sharegrid, XD_mat(:,i),'LineWidth',1,'Color',[abs(mat(i)/mat(end)),0,0]);
    set(hline,'Color','k','LineStyle','--');
    ylim([0,1]);
    xlabel('Output share of A');
title('Panel A: low leverage')
%legend({'full model boundary','0.5 fixed boundary benchmark'});

subplot(3,3,2)
  plot(sharegrid, mat_bound_mat(:,1,2),'LineWidth',1,'Color','k');
    hold on
   % text(-0.2,0.4,'\theta=0.8','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
    %plot(sharegrid, mat_bound_mat_nc(:,i),'LineWidth',1,'LineStyle',':','Color',[abs(xgrid(i)/xgrid(n)),0,0]);
    hold on
    hline=refline(0,mat_bound_mat(25,1,2));
    hold on 
    %plot(sharegrid, XD_mat(:,i),'LineWidth',1,'Color',[abs(mat(i)/mat(end)),0,0]);
    set(hline,'Color','k','LineStyle','--');
    ylim([0,1]);
    xlabel('Output share of A');
title('Panel B: medium leverage')
%legend({'full model boundary','0.5 fixed boundary benchmark'});


subplot(3,3,3)
  plot(sharegrid, mat_bound_mat(:,1,3),'LineWidth',1,'Color','k');
    hold on
   % text(-0.2,0.4,'\theta=0.8','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
    %plot(sharegrid, mat_bound_mat_nc(:,i),'LineWidth',1,'LineStyle',':','Color',[abs(xgrid(i)/xgrid(n)),0,0]);
    hold on
    hline=refline(0,mat_bound_mat(25,1,3));
    hold on 
    %plot(sharegrid, XD_mat(:,i),'LineWidth',1,'Color',[abs(mat(i)/mat(end)),0,0]);
    set(hline,'Color','k','LineStyle','--');
    ylim([0,1]);
    xlabel('Output share of A');
title('Panel C: high leverage')
%legend({'full model boundary','0.5 fixed boundary benchmark'});
subplot(3,3,4)
  plot(sharegrid, mat_bound_mat(:,2,1),'LineWidth',1,'Color','k');
    hold on
    text(-0.32,0.4,'10-yr','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
    %plot(sharegrid, mat_bound_mat_nc(:,i),'LineWidth',1,'LineStyle',':','Color',[abs(xgrid(i)/xgrid(n)),0,0]);
    hold on
    hline=refline(0,mat_bound_mat(25,2,1));
    hold on 
    %plot(sharegrid, XD_mat(:,i),'LineWidth',1,'Color',[abs(mat(i)/mat(end)),0,0]);
    set(hline,'Color','k','LineStyle','--');
    ylim([0,1]);
    xlabel('Output share of A');
%title('Panel C: high leverage')
%legend({'full model boundary','0.5 fixed boundary benchmark'});


subplot(3,3,5)
  plot(sharegrid, mat_bound_mat(:,2,2),'LineWidth',1,'Color','k');
    hold on
    %text(-0.2,0.4,'10-yr','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
    %plot(sharegrid, mat_bound_mat_nc(:,i),'LineWidth',1,'LineStyle',':','Color',[abs(xgrid(i)/xgrid(n)),0,0]);
    hold on
    hline=refline(0,mat_bound_mat(25,2,2));
    hold on 
    %plot(sharegrid, XD_mat(:,i),'LineWidth',1,'Color',[abs(mat(i)/mat(end)),0,0]);
    set(hline,'Color','k','LineStyle','--');
    ylim([0,1]);
    xlabel('Output share of A');
%title('Panel C: high leverage')
%legend({'full model boundary','0.5 fixed boundary benchmark'});

subplot(3,3,6)
  plot(sharegrid, mat_bound_mat(:,2,3),'LineWidth',1,'Color','k');
    hold on
    %text(-0.2,0.4,'10-yr','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
    %plot(sharegrid, mat_bound_mat_nc(:,i),'LineWidth',1,'LineStyle',':','Color',[abs(xgrid(i)/xgrid(n)),0,0]);
    hold on
    hline=refline(0,mat_bound_mat(25,2,3));
    hold on 
    %plot(sharegrid, XD_mat(:,i),'LineWidth',1,'Color',[abs(mat(i)/mat(end)),0,0]);
    set(hline,'Color','k','LineStyle','--');
    ylim([0,1]);
    xlabel('Output share of A');
%title('Panel C: high leverage')
%legend({'full model boundary','0.5 fixed boundary benchmark'});

subplot(3,3,7)
  plot(sharegrid, mat_bound_mat(:,3,1),'LineWidth',1,'Color','k');
    hold on
    text(-0.32,0.4,'30-yr','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
    %plot(sharegrid, mat_bound_mat_nc(:,i),'LineWidth',1,'LineStyle',':','Color',[abs(xgrid(i)/xgrid(n)),0,0]);
    hold on
    hline=refline(0,mat_bound_mat(25,3,1));
    hold on 
    %plot(sharegrid, XD_mat(:,i),'LineWidth',1,'Color',[abs(mat(i)/mat(end)),0,0]);
    set(hline,'Color','k','LineStyle','--');
    ylim([0,1]);
    xlabel('Output share of A');
%title('Panel C: high leverage')
%legend({'full model boundary','0.5 fixed boundary benchmark'});

subplot(3,3,8)
  plot(sharegrid, mat_bound_mat(:,3,2),'LineWidth',1,'Color','k');
    hold on
   % text(-0.2,0.4,'10-yr','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
    %plot(sharegrid, mat_bound_mat_nc(:,i),'LineWidth',1,'LineStyle',':','Color',[abs(xgrid(i)/xgrid(n)),0,0]);
    hold on
    hline=refline(0,mat_bound_mat(25,3,2));
    hold on 
    %plot(sharegrid, XD_mat(:,i),'LineWidth',1,'Color',[abs(mat(i)/mat(end)),0,0]);
    set(hline,'Color','k','LineStyle','--');
    ylim([0,1]);
    xlabel('Output share of A');
%title('Panel C: high leverage')
%legend({'full model boundary','0.5 fixed boundary benchmark'});

subplot(3,3,9)
  plot(sharegrid, mat_bound_mat(:,3,3),'LineWidth',1,'Color','k');
    hold on
    %text(-0.2,0.4,'10-yr','rotation',90,'FontSize',10,'Units','normalized','FontWeight','Bold');  
    %plot(sharegrid, mat_bound_mat_nc(:,i),'LineWidth',1,'LineStyle',':','Color',[abs(xgrid(i)/xgrid(n)),0,0]);
    hold on
    hline=refline(0,mat_bound_mat(25,3,3));
    hold on 
    %plot(sharegrid, XD_mat(:,i),'LineWidth',1,'Color',[abs(mat(i)/mat(end)),0,0]);
    set(hline,'Color','k','LineStyle','--');
    ylim([0,1]);
    xlabel('Output share of A');
%title('Panel C: high leverage')
%legend({'full model boundary','0.5 fixed boundary benchmark'});

%****************************************
%  2. boundary term structure for internal
%****************************************
boundaryterm=mat_bound_mat(:,3,:)-mat_bound_mat(:,1,:);
figure
subplot(1,3,1)
plot(sharegrid,boundaryterm(:,:,1),'LineWidth',1.25,'Color','k');
xlabel('Share of tree A')
legend('boundary 5yr-30-yr');
title('low leverage');
ylim([-0.15,0]);

subplot(1,3,2)
plot(sharegrid,boundaryterm(:,:,2),'LineWidth',1.25,'Color','k');
xlabel('Share of tree A')
xlabel('Share of tree A')
legend('boundary 5yr-30-yr');
title('medium leverage');
ylim([-0.15,0]);

subplot(1,3,3)
plot(sharegrid,boundaryterm(:,:,3),'LineWidth',1.25,'Color','k');
xlabel('Share of tree A')
xlabel('Share of tree A')
legend('boundary 5yr-30-yr');
title('high leverage');
ylim([-0.15,0]);