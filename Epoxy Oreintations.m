function [minimumangle,FFFI]=FIinterface(teta1,teta2,tetan,FFI,FFFI)

[anglevalue,angleposition]=min(FFFI);

rho=tetan/(teta2-teta1);
minimumangle=teta1+(teta2-teta1)/(max(size(FFFI,2))-1)*(angleposition-1);



if  teta1< minimumangle && minimumangle < teta2 % \/ curve
display('   anglestart----anglestop---anglestep---rho----optimization.angle----FI----FI.Error')
[teta1 , teta2,  tetan,rho, minimumangle,anglevalue,FFFI(angleposition-1)-FFFI(angleposition)]


hold on
x=teta1:tetan:teta2;
plot(x,FFI') ;   
line([minimumangle minimumangle],[0  min(FFFI)],'LineStyle','-.','LineWidth',1,'Color',[0.5 0 0]);
line([teta1 minimumangle],[min(FFFI) min(FFFI)],'LineStyle','-.','LineWidth',1,'Color',[0.5 0 0]);

title('Epoxi-Laminated-Composite Plate Optimization Analysis');
xlabel([' Optimization angle = ' num2str(minimumangle)]);
ylabel([' Tshai-Whu (FI)= ' num2str(min(FFFI)) ]);

else %
hold on
x=teta1:tetan:teta2;
title('Epoxi-Laminated-Composite Plate Optimization Analysis');
xlabel([' Optimization angle = ' num2str(minimumangle)]);
ylabel([' Tshai-Whu (FI)= ' num2str(min(FFFI)) ]);
plot(x,FFI') ;   
disp('In this boundary-conditions not acceptable for optimum angel.s value');
end