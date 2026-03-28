Repository: price-demand-model
Course: Math Modeling — Final Course Output
Members: Amba, Capucion, Mendoza, Santos
Repository Structure
price-demand-model/
├── data/
│   └── Rice_Price_and_Demand.csv
├── code/
│   └── demand_model.m
├── results/
│   ├── demand_curve.png
│   └── residual_plot.png
└── README.md
About This Project
This is our Math Modeling FCO. We built an exponential demand model using Philippine rice retail price and demand data from 2000 to 2022. The model Q = 7.7414 x e^(0.0156P) was fitted in MATLAB using fminsearch(). We got R² = 0.7022, MAE = 0.9266 MMT, and RMSE = 1.1347 MMT.
Requirements
•	MATLAB (any recent version)
•	No extra toolboxes needed
•	Rice_Price_and_Demand.csv must be in the same folder as demand_model.m
How to Run
9.	Download or clone the repository.
10.	Open MATLAB and go to the folder where the files are saved.
11.	Open demand_model.m.
12.	Press F5 or click Run.
13.	You will see the parameter estimates and error metrics in the Command Window.
14.	Two figures will pop up: the demand curve and the residual plot.
15.	A new CSV file with the predicted values will also be saved in the same folder.
Dataset
File: Rice Price and Demand.csv
•	Source: Philippine Statistics Authority (PSA)
•	Years covered: 2000 to 2022 (23 data points)
•	Column 1 — Year
•	Column 2 — Rice Price Retail (PHP/kg) — this is P in the model
•	Column 3 — Demand (MMT) — this is Q in the model
Expected Output
--- PARAMETER ESTIMATES ---
a = 7.7414
b = 0.0156
Iterations = [value]
SSR = [value]

--- ERROR METRICS ---
R2   = 0.7022
MAE  = 0.9266 MMT
RMSE = 1.1347 MMT
Notes
•	No toolbox needed. fminsearch() is built into MATLAB.
•	b is positive because rice demand went up over time due to population growth, not because of price. We explain this in the paper.
•	Make sure the CSV file is in the same folder before running.
•	Each group member should commit their own files to the repo.
