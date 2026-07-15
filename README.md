# Gaussian Mixture Model (GMM) using Expectation-Maximization (EM) Algorithm in R

## Overview

This project implements the **Gaussian Mixture Model (GMM)** clustering algorithm from scratch in **R** using the **Expectation-Maximization (EM)** algorithm. It generates a synthetic dataset, estimates the model parameters iteratively, assigns data points to clusters, and visualizes the final clustering results.

---

## Features

- Generate a synthetic 2D dataset
- Implement Gaussian Probability Density Function (PDF)
- Perform Expectation (E-Step)
- Perform Maximization (M-Step)
- Compute Log-Likelihood for convergence
- Visualize the generated dataset
- Display final cluster assignments
- Plot Log-Likelihood across iterations

---

## Project Structure

```
.
├── Task 1 using r.R          # Main R script
├── synthetic_data.csv        # Generated dataset
├── Output/
│   ├── dataset.png
│   ├── final_clusters.png
│   └── log_likelihood.png
└── README.md
```

---

## Algorithm Workflow

1. Generate a synthetic dataset with two Gaussian clusters.
2. Initialize:
   - Mixture weights
   - Cluster means
   - Covariance matrices
3. Compute Gaussian Probability Density.
4. Perform the Expectation (E-Step).
5. Update parameters using the Maximization (M-Step).
6. Calculate Log-Likelihood.
7. Repeat until convergence or maximum iterations.
8. Assign each point to the cluster with the highest probability.
9. Visualize the clustering results.

---

## Requirements

- R (Version 4.0 or above)

No additional libraries are required since the implementation uses base R functions.

---

## Output

The program generates:

- **synthetic_data.csv** – Generated dataset
- **dataset.png** – Scatter plot of generated data
- **final_clusters.png** – Final clustered dataset with cluster centers
- **log_likelihood.png** – Log-Likelihood vs Iterations graph

---

## How to Run

1. Clone the repository

```bash
git clone https://github.com/your-username/GMM-EM-R.git
```

2. Open the project in RStudio.

3. Run the script:

```R
source("Task 1 using r.R")
```

4. The generated outputs will be saved inside the **Output** folder.

---

## Learning Objectives

This project demonstrates:

- Gaussian Mixture Models
- Expectation-Maximization Algorithm
- Unsupervised Machine Learning
- Probabilistic Clustering
- Parameter Estimation
- Data Visualization in R

---

## Author

**Archana Devi M**

Bachelor of Computer Applications (BCA)

---

## License

This project is intended for educational and learning purposes.
