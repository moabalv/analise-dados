library(dplyr)
library(ggplot2)
library(forecast)
library(tidyr)
data <- read.csv("/home/moab.silva/Downloads/archive/walmart-sales-dataset-of-45stores.csv")

names(data)

lojas <- data %>%
  select(Store, Weekly_Sales, Date) %>%
  rename(store = Store, weekly_sales = Weekly_Sales, date = Date)

ts_loja <- lojas %>%
  filter(store == 1) %>%
  select(weekly_sales) %>%
  ts(frequency = 52, start = c(2010,5), end = c(2012,43))

autoplot(ts_loja) +
  ggtitle("Walmart: vendas da loja 1") +
  xlab("Ano") +
  ylab("Vendas")

ggseasonplot(ts_loja) +
  ggtitle("Sazonalidade das vendas") +
  xlab("Semana") + 
  ylab("Vendas")

autoplot(forecast(ts_loja))


loja_1 <- lojas %>%
  filter(store == 1)

