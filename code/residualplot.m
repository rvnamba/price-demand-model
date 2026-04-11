% Residual Plot - Linear Demand Model

P = [17.59,17.54,18,17.95,18.71,20.73,21.28,22.39,29.38,30.69,...
     30.84,31.31,33.48,34.95,39.76,39.47,39.02,39.52,43.37,41.16,...
     39.09,38.28,39.15];
Q = [8.94,9.18,9.70,9.80,10.79,11.33,11.58,12.51,12.96,12.40,...
     11.90,12.41,12.94,12.86,12.96,12.81,12.57,13.97,14.21,15.30,...
     15.18,16.49,16.79];

a = 6.6489; b = 0.1942;
years = 2000:2022;
residuals = Q - (a + b .* P);

figure('Color','white')
bar_handle = bar(years, residuals, 'FaceColor', 'flat');
for k = 1:length(residuals)
    if residuals(k) >= 0
        bar_handle.CData(k,:) = [0.18 0.74 0.65];
    else
        bar_handle.CData(k,:) = [0.93 0.26 0.26];
    end
end
yline(0, 'k-', 'LineWidth', 1)
xlabel('Year')
ylabel('Residual (MMT)')
title('Figure 5. Residual Plot – Linear Demand Model (2000–2022)')
xticks(years)
xtickangle(45)
ylim([-2 3])
grid on
box on

exportgraphics(gcf, 'residualplot.png', 'Resolution', 150)