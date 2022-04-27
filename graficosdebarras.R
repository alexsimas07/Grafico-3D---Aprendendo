#Gráficos de Barras
?barplot

#Preparando os dados - número de casamentos em um Igreja de SP 
dados <- matrix(c(652,1537,598,242,36,46,38,21,218,327,106,67), nrow = 3, byrow = T)
dados

#Nomeando Linhas e Colunas na matriz
colnames(dados) <- c("0", "1-150", "151-300", ">300")
rownames(dados) <- c("JOvem", "Adulto", "Idoso")
dados

#Construindo o Barplot
barplot(dados, beside = T)

#Construindo um stacked Barplot - Grafico de barras empilhados, retira-se o beside(ao lado)
barplot(dados)

barplot(dados, col = c("steelblue1", "tan3", "seagreen3"))

#Crie uma legenda para o gráfico anterior 
colors()
legend("topright", pch = 1, col = c("steelblue1", "tan3", "seagreen3"), legend =  c("JOvem", "Adulto", "Idoso"))

#Coluna para cada faixa etária, mas na mesma faixa de quantidade
barplot(dados, beside = T, col = c("steelblue1", "tan3", "seagreen3"))
legend("topright", pch = 1, col = c("steelblue1", "tan3", "seagreen3"), legend =  c("JOvem", "Adulto", "Idoso"))

t(dados)
barplot(t(dados), beside = T, col = c("steelblue1", "tan3", "seagreen3", "peachpuff1"))
legend("topright", pch = 1, col = c("steelblue1", "tan3", "seagreen3", "peachpuff1"), legend = c("0", "1-150", "151-300", ">300"))
