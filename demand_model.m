% Exponential Demand Model - Philippine Rice (2000-2022)
% Math Modeling FCO | Amba, Capucion, Mendoza, Santos

% load the dataset
data = readtable('Rice Price and Demand.csv');
data.Properties.VariableNames = {'Year', 'RicePriceRetail', 'Demand'};

% set up variables
P = data.RicePriceRetail;
Q = data.Demand;

% define the exponential model
expModel = @(beta, P) beta(1) .* exp(beta(2) .* P);

% set options for fminsearch
beta0 = [20, 0.01];
options = optimset('fminsearch');
options.TolX        = 1e-8;
options.TolFun      = 1e-8;
options.MaxIter     = 10000;
options.MaxFunEvals = 10000;
options.Display     = 'iter';

% run the optimization
SSR = @(beta) sum((Q - expModel(beta, P)).^2);
[betaHat, SSR_final, ~, output] = fminsearch(SSR, beta0, options);

a_est = betaHat(1);
b_est = betaHat(2);
fprintf('\n--- PARAMETER ESTIMATES ---\n');
fprintf('a = %.4f\n', a_est);
fprintf('b = %.4f\n', b_est);
fprintf('Iterations = %d\n', output.iterations);
fprintf('SSR = %.6f\n', SSR_final);

% get predicted values and residuals
Q_pred    = expModel(betaHat, P);
residuals = Q - Q_pred;

% compute error metrics
MAE    = mean(abs(Q - Q_pred));
RMSE   = sqrt(mean((Q - Q_pred).^2));
SS_res = sum((Q - Q_pred).^2);
SS_tot = sum((Q - mean(Q)).^2);
R2     = 1 - SS_res / SS_tot;
fprintf('\n--- ERROR METRICS ---\n');
fprintf('R2   = %.4f\n', R2);
fprintf('MAE  = %.4f MMT\n', MAE);
fprintf('RMSE = %.4f MMT\n', RMSE);

% print the results table
fprintf('\n%-6s %10s %13s %10s\n','Year','Actual Q','Predicted Q','Residual');
fprintf('%s\n', repmat('-',1,44));
for i = 1:height(data)
    fprintf('%-6d %10.2f %13.4f %10.4f\n', ...
        data.Year(i), Q(i), Q_pred(i), residuals(i));
end

% plot 1: demand curve
P_range = linspace(min(P), max(P), 200)';
Q_curve = expModel(betaHat, P_range);
figure(1);
scatter(P, Q, 60, 'b', 'filled'); hold on;
plot(P_range, Q_curve, 'r-', 'LineWidth', 2);
xlabel('Retail Price (PHP/kg)', 'FontSize', 12);
ylabel('Demand (MMT)', 'FontSize', 12);
title('Exponential Demand Model - Philippine Rice (2000-2022)','FontSize',13);
legend('Observed','Fitted: Q = ae^{bP}','Location','northwest');
grid on; hold off;

% plot 2: residual plot
figure(2);
stem(data.Year, residuals, 'filled', 'Color', [0.2 0.4 0.8]);
yline(0, 'r--', 'LineWidth', 1.5);
xlabel('Year', 'FontSize', 12);
ylabel('Residual (MMT)', 'FontSize', 12);
title('Residual Plot - Exponential Demand Model', 'FontSize', 13);
grid on;

% save CSV with predictions
data.Predicted_Q = round(Q_pred, 4);
data.Residual     = round(residuals, 4);
writetable(data, 'Rice_Price_and_Demand_with_Predictions.csv');
fprintf('\nSaved: Rice_Price_and_Demand_with_Predictions.csv\n');
