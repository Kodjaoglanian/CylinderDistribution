# Instalando e carregando os pacotes necessários
if (!require(ggplot2)) {
    install.packages("ggplot2")
}
if (!require(gridExtra)) {
    install.packages("gridExtra")
}
library(ggplot2)
library(gridExtra)

# Limpando o ambiente
rm(list=ls())

# Carregando a base de dados mtcars
data(mtcars)

# Criando um dataframe com as variáveis de interesse
dados <- mtcars[, c("mpg", "cyl")]

# Criando o gráfico de barras
grafico_barras <- ggplot(dados, aes(x = factor(cyl), fill = factor(cyl))) +
  geom_bar() +
  labs(x = "Número de Cilindros", y = "Contagem", fill = "Número de Cilindros") +
  ggtitle("Contagem de Carros por Número de Cilindros") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

# Criando o gráfico de pizza
grafico_pizza <- ggplot(dados, aes(x = "", fill = factor(cyl))) +
  geom_bar(width = 1) +
  coord_polar("y", start = 0) +
  labs(x = NULL, y = NULL, fill = "Número de Cilindros") +
  ggtitle("Distribuição de Carros por Número de Cilindros") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

# Exibindo os gráficos lado a lado
grid.arrange(grafico_barras, grafico_pizza, ncol = 2)
