## 3 užduotis | LKT Analitiko atranka
## Rugilė Vailionytė | 2024 Lapkričio 17
## -----------------------------

library(dplyr)

data.file <- LKT_Kultura_w_datamap_Analitiko_atranka

weighted_proportions <- data.file %>%
  group_by(D4R) %>% # Duomenys sugrupuojami pagal amžiaus grupes
  summarise(
    WeightYes = sum(ifelse(A1_1 == 1, W, 0)), # Susumuojami "Taip" į A1_1 klausimą atsakiusių respondentų svoriai
    TotalWeight = sum(W) # Susumuojami visų respondentų svoriai
  ) %>%
  mutate(ProportionYes = WeightYes / TotalWeight) # Apskaičiuojama proporcija 

print(weighted_proportions) 