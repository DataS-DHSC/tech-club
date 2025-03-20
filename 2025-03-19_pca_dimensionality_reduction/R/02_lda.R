library(tidyverse)
library(tidymodels)
library(discrim)
library(afcharts)

lda_model <- discrim_linear() |>
  fit(Species ~ ., data = iris)

lda_model

(
  lda_model |>
    predict(new_data = iris, type = "raw")
  )$x |>
  as_tibble() |>
  select(LD1, LD2) |>
  bind_cols(iris %>% select(Species)) |>
  ggplot() +
  geom_point(aes(x = LD1, y = LD2, colour = Species)) +
  theme_af() +
  scale_colour_discrete_af()
