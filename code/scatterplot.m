% Price vs. Demand Scatter Plot 

P = [17.59,17.54,18,17.95,18.71,20.73,21.28,22.39,29.38,30.69,...
     30.84,31.31,33.48,34.95,39.76,39.47,39.02,39.52,43.37,41.16,...
     39.09,38.28,39.15];
Q = [8.94,9.18,9.70,9.80,10.79,11.33,11.58,12.51,12.96,12.40,...
     11.90,12.41,12.94,12.86,12.96,12.81,12.57,13.97,14.21,15.30,...
     15.18,16.49,16.79];

figure('Color','white')
scatter(P, Q, 50, 'filled', 'MarkerFaceColor', '#1f77b4', ...
        'MarkerEdgeColor', '#1f77b4')
xlabel('Retail Price (PHP/kg)')
ylabel('Demand (MMT)')
title('Figure 3. Price vs. Demand Scatter Plot (2000–2022)')
xlim([15 46])
ylim([8 17])
grid on
box on

exportgraphics(gcf, 'scatterplot.png', 'Resolution', 150)