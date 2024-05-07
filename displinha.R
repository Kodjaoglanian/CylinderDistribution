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

# Calculando a média do consumo de combustível por número de cilindros
media_mpg <- aggregate(mpg ~ cyl, data = dados, FUN = mean)

# Criando o gráfico de barras para mostrar a média do consumo de combustível por número de cilindros
grafico_barras_mpg <- ggplot(media_mpg, aes(x = factor(cyl), y = mpg)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(x = "Número de Cilindros", y = "Consumo de Combustível Médio (mpg)") +
  ggtitle("Consumo de Combustível Médio por Número de Cilindros") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

# Criando um gráfico de linha para visualizar a tendência do desempenho (hp) ao longo do tempo (índice)
grafico_linha <- ggplot(dados, aes(x = seq_along(hp), y = hp)) +  
  geom_line(color = "red") +
  labs(x = "Índice", y = "Potência (hp)") +
  ggtitle("Tendência da Potência ao Longo do Tempo") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

# Exibindo os gráficos lado a lado
grid.arrange(grafico_barras_mpg, grafico_linha, ncol = 2, top = "Gráficos de Análise de Dados Automotivos")
