Repository: price-demand-model
Course: Math Modeling — Final Course Output
Members: Amba, Capucion, Mendoza, Santos
Repository Structure
price-demand-model/
├── data/
│   └── Rice Price and Demand.csv
├── main/
│   |── demand_model.m
|   └── README.md
├── results/
│   ├── demand_curve.png
│   └── residual_plot.png
About This Project
This repository contains the MATLAB implementation of a linear demand model fitted to annual Philippine rice retail price and demand data (2000–2022). The model Q = 6.6489 + 0.1942P was estimated using the Nelder-Mead Simplex algorithm via fminsearch(). Model performance: R² = 0.7103, MAE = 0.9236 MMT, RMSE = 1.1191 MMT, SSR = 28.8028.
Requirements
•	MATLAB (R2021a or later recommended)
•	No additional toolboxes required — fminsearch() is built into standard MATLAB
•	Rice_Price_and_Demand.csv must be in the same working directory as demand_model.m
How to Run
9.	Clone or download the repository.
10.	Open MATLAB and set the working directory to the folder containing both demand_model.m and Rice_Price_and_Demand.csv.
11.	Open demand_model.m in the MATLAB Editor.
12.	Press F5 or click Run.
13.	The Command Window will display iteration progress, parameter estimates (a, b), final SSR, R², MAE, and RMSE.
14.	Figure 1 (demand curve) and Figure 2 (residual plot) will open automatically.
15.	A new file Rice_Price_and_Demand_with_Predictions.csv will be saved in the working directory.
Dataset Description
File: Rice_Price_and_Demand.csv
•	Source: Philippine Statistics Authority (PSA)
•	Coverage: 2000–2022 (23 annual observations)
•	Column 1 — Year: calendar year of observation
•	Column 2 — Rice Price Retail (PHP/kg): annual average retail price, used as P
•	Column 3 — Demand (MMT): total annual rice demand, used as Q
Expected Output
--- PARAMETER ESTIMATES ---
a = 6.6489
b = 0.1942
Iterations: [value]  |  SSR: 28.8028

--- ERROR METRICS ---
R2: 0.7103  |  MAE: 0.9236 MMT  |  RMSE: 1.1191 MMT
Notes
•	No Statistics and Machine Learning Toolbox is required. The implementation relies solely on fminsearch(), which is available in all standard MATLAB installations.
•	The fitted model produces a positive slope (b > 0) because aggregate rice demand increased alongside prices over the 22-year study period, primarily due to population growth. This is discussed in the Limitations section of the paper.
•	Ensure that Rice_Price_and_Demand.csv is in the same directory as demand_model.m before running the script.
•	All group members are expected to make individual commits to their respective sections of the repository to satisfy the collaborative version history requirement.
