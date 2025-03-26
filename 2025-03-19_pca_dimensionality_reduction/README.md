# PCA and other dimensionality reduction techniques

This session covers Principal Component Analysis (PCA) in mathematical detail, touches on Linear Discriminant Analysis (LDA) and Multiple Correspondence Analysis (MCA), and provides a demonstration of dimensionality reduction and generative machine learning using an Autoencoder.

## How to run

To run the Python code, you will need Python, VS Code, and Git Bash installed (as per [DHSC installation instructions](https://ca-dsfrontdoor-qa-uks-001.wittyground-c68b08ab.uksouth.azurecontainerapps.io/python_setup.html)).

Open Git Bash by right clicking inside the `2025-03-19_pca_dimensionality_reduction` directory in Windows File Explorer, and clicking "Git Bash".

Load the environment required for this project - this will give you access to all the required packages:

```
conda env create -f environment.yml
```

If prompted, hit `y`.

Run:

```
conda activate pca-dimensionality-reduction-env
```

The Python code should now run for you in VS Code (you may need to select the `pca-dimensionality-reduction-env` interpreter when prompted).

## Additional content

### YouTube
* [StatQuest: PCA main ideas (5 mins)](https://youtu.be/HMOI_lkzW08?si=0er-3nFEdErVwbCk)
* [StatQuest: PCA, Step-by-Step (22m mins)](https://youtu.be/FgakZw6K1QQ?si=XGgm7BqSEyByTTRS)
* [3blue1brown: Eigenvectors and eigenvalues](https://www.youtube.com/watch?v=PFDu9oVAE-g)

### Kaggle
* [Eigenfaces exercise](https://www.kaggle.com/code/lalitharajesh/face-recognition-eigenfaces/notebook)
* [Abalone exercise](https://www.kaggle.com/code/ryanholbrook/principal-component-analysis)

### Other
* [PCA and UMAP with tidymodels and #TidyTuesday cocktail recipes | Julia Silge](https://juliasilge.com/blog/cocktail-recipes-umap/)
* [Tidy Modeling with R | Dimensionality](https://www.tmwr.org/dimensionality)