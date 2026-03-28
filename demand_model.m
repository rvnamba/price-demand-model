% Linear Demand Model — Philippine Rice (2000–2022)
% Math Modeling FCO

% load dataset
data = readtable('Rice_Price_and_Demand.csv');
data.Properties.VariableNames = {'Year', 'Retail', 'Demand'};
P = data.Retail;
Q = data.Demand;

% define linear model: Q = a + b*P
linModel = @(beta, P) beta(1) + beta(2) .* P;

% configure fminsearch options
beta0   = [5, 0.2];
options = optimset('fminsearch');
options.TolX        = 1e-8;
options.TolFun      = 1e-8;
options.MaxIter     = 10000;
options.MaxFunEvals = 10000;
options.Display     = 'iter';

% run Nelder-Mead optimization
SSR = @(beta) sum((Q - linModel(beta, P)).^2);
[betaHat, SSR_final, ~, output] = fminsearch(SSR, beta0, options);
fprintf('a = %.4f, b = %.4f\n', betaHat(1), betaHat(2));
fprintf('Iterations: %d | SSR: %.4f\n', output.iterations, SSR_final);

% compute predictions and error metrics
Q_pred    = linModel(betaHat, P);
residuals = Q - Q_pred;
MAE  = mean(abs(residuals));
RMSE = sqrt(mean(residuals.^2));
R2   = 1 - sum(residuals.^2) / sum((Q - mean(Q)).^2);
fprintf('R2: %.4f | MAE: %.4f | RMSE: %.4f\n', R2, MAE, RMSE);

% Figure 1: demand curve
P_range = linspace(min(P), max(P), 200)';
figure(1); scatter(P, Q, 60, 'b', 'filled'); hold on;
plot(P_range, linModel(betaHat, P_range), 'r-', 'LineWidth', 2);
xlabel('Retail Price (PHP/kg)'); ylabel('Demand (MMT)');
title('Linear Demand Model — Philippine Rice (2000–2022)');
legend('Observed','Fitted: Q = a + bP'); grid on; hold off;

% Figure 2: residual plot
figure(2); stem(data.Year, residuals, 'filled');
yline(0,'r--','LineWidth',1.5);
xlabel('Year'); ylabel('Residual (MMT)');
title('Residual Plot — Linear Demand Model'); grid on;

% export results
data.Predicted_Q = round(Q_pred, 4);
data.Residual = round(residuals, 4);
writetable(data, 'Rice_Price_and_Demand_with_Predictions.csv');
