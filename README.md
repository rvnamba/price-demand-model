# Modeling Rice Demand in the Philippines: A Price-Based Linear Regression Approach (2000–2022)

**Mathematical Modeling FCO — Bulacan State University, College of Science**

---

## Authors

- Amba, Raven M.
- Capucion, Sarah Mae S.
- Mendoza, Marianne Faye T.
- Santos, Rhyza Noreen R.

---

## Project Overview

This study models the relationship between retail rice prices and annual rice demand in the Philippines from 2000 to 2022. Using data from the Philippine Statistics Authority (PSA), we compare a **linear** and an **exponential** demand model fitted via the **Nelder-Mead Simplex algorithm** in MATLAB.

The linear model `Q = 6.6489 + 0.1942P` achieved R² = 0.7103, outperforming the exponential alternative across all goodness-of-fit criteria. Price elasticity was estimated at |Ed| ≈ 0.47, confirming that rice demand is **price inelastic** — consistent with its role as a dietary staple.

---

## Repository Structure

```
price-demand-model/
│
├── README.md
│
├── data/
│   ├── Rice_Price_and_Demand.csv                     # raw dataset (PSA, 2000–2022)
│   └── Rice_Price_and_Demand_with_Predictions.csv    # model output with residuals
│
├── code/
│   ├── demand_model.m     # model fitting via Nelder-Mead + R², MAE, RMSE
│   ├── scatterplot.m      # Figure 3: price vs. demand scatter plot
│   ├── fittedline.m       # Figure 4: fitted linear demand curve
│   └── residualplot.m     # Figure 5: residual bar chart
│
├── figures/
│   ├── scatterplot.png
│   ├── fittedline.png
│   └── residualplot.png
│
├── paper/
  ├── Math_Modeling_FCO.tex    # LaTeX source
  ├── Math_Modeling_FCO.pdf    # compiled paper
  └── references.bib
```

---

## How to Run

> **Requirement:** MATLAB R2021a or later (uses `fminsearch`, `readtable`, `exportgraphics`)

**Step 1** — Place the dataset in the `data/` folder:
```
Rice_Price_and_Demand.csv
```

**Step 2** — Run the model fitting script first:
```matlab
cd code/
demand_model
```
This generates `Rice_Price_and_Demand_with_Predictions.csv` and prints R², MAE, and RMSE to the console.

**Step 3** — Generate the figures (run in any order):
```matlab
scatterplot
fittedline
residualplot
```
Output `.png` files will be saved to the working directory. Move them to `figures/` afterward.

---

## Results Summary

| Metric | Linear Model | Exponential Model |
|--------|-------------|------------------|
| R²     | **0.7103**  | 0.6891           |
| MAE    | **0.9236 MMT** | 0.9614 MMT    |
| RMSE   | **1.1191 MMT** | 1.1508 MMT    |

**Fitted model:** `Q = 6.6489 + 0.1942P`

**Price elasticity:** |Ed| ≈ 0.47 (price inelastic)

---

## Output Files Generated

| File | Description |
|------|-------------|
| `Rice_Price_and_Demand_with_Predictions.csv` | Predicted demand and residuals per year |
| `scatterplot.png` | Figure 3 — observed price vs. demand |
| `fittedline.png`  | Figure 4 — fitted regression line overlay |
| `residualplot.png`| Figure 5 — annual residuals (green = underpredicted, red = overpredicted) |

---

## Data Source

Philippine Statistics Authority (PSA). Rice retail prices and demand data, 2000–2022.
Retrieved from [https://psa.gov.ph](https://psa.gov.ph)

