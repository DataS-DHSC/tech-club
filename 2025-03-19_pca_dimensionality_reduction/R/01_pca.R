# Part 1 of this notebook will go through the mathematics of PCA, implemented in R.
# Part 2 will implement PCA in the standard way for R.

###########
# Part 1 - How to implement the maths of PCA in R
library(tidyverse)
library(janitor)
library(afcharts)

iris_clean <- iris |>
  clean_names()

iris_standardised <- iris |>
  mutate(across(where(is.numeric), ~scale(.x)))

iris_covariance_matrix <- iris_standardised |>
  select(where(is.numeric)) |>
  cov()

# The `eigen()` function returns the eigenvalues in descending order, so we do
# not need to re-sort
eigenvalues <- eigen(iris_covariance_matrix)$values
eigenvectors <- eigen(iris_covariance_matrix)$vectors

# The first two principal components explain 95.8% of the variance in the data
sum(eigenvalues[1:2]/sum(eigenvalues))

# Because two dimensions can explain over 95% of the variance, why don't we
# transform our data into two dimensions and see what happens?
# (`%*%` is the operator for matrix multiplication in R)
iris_transform <- (
    iris_standardised |>
      select(where(is.numeric)) |>
      as.matrix() %*%
    eigenvectors
) |>
  # Bring back the species column
  bind_cols(iris_clean |> select(species)) |>
  rename(PC1 = `...1`, PC2 = `...2`, PC3 = `...3`, PC4 = `...4`)

iris_transform |>
  ggplot() +
  geom_point(aes(x = PC1, y = PC2, colour = species)) +
  theme_af() +
  scale_colour_discrete_af()

###########
## Part 2 - How to ACTUALLY use PCA in R
library(tidyverse)
library(afcharts)

# `prcomp()` handles scaling, if you tell it to
pcs <- prcomp(iris |> select(-Species), center = TRUE, scale. = TRUE)

# The first two principal components explain 95.8% of the variance in the data
summary(pcs)

predict(pcs, iris) |>
  as_tibble() |>
  select(1:2) |>
  bind_cols(iris %>% select(Species)) |>
  ggplot() +
  geom_point(aes(x = PC1, y = PC2, colour = Species)) +
  theme_af() +
  scale_colour_discrete_af()
