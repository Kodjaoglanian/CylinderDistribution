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
dados <- mtcars[, c("mpg", "cyl", "wt", "hp")]

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

# Criando um gráfico de dispersão para explorar a relação entre peso (wt) e eficiência de combustível (mpg)
grafico_dispersao <- ggplot(dados, aes(x = wt, y = mpg)) +
  geom_point() +
  labs(x = "Peso (lbs)", y = "Consumo de Combustível (mpg)") +
  ggtitle("Relação entre Peso e Consumo de Combustível") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

# Criando um gráfico de linha para visualizar a tendência do desempenho (hp) ao longo do tempo (índice)
grafico_linha <- ggplot(dados, aes(x = seq_along(hp), y = hp)) +  # Usando a sequência do comprimento do vetor hp como eixo x
  geom_line() +
  labs(x = "Índice", y = "Potência (hp)") +
  ggtitle("Tendência da Potência ao Longo do Tempo") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

# Exibindo os gráficos lado a lado com espaçamento adequado
grid.arrange(grafico_barras, grafico_pizza, grafico_dispersao, grafico_linha, ncol = 2, top = "Gráficos de Análise de Dados Automotivos")
