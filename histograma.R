#definindo os dados
set.seed(67)
x = rnorm(10,5,7)
y = rpois(10,7)
z = rnorm(10,6,7)
t = rpois(10,9)

plot(x,y, col = 120, pch = 8, main = "Multi Scatterplot",
     col.main = "blue", cex.main = 1.8, xlab = "Variável Independente", 
     ylab = "Variável Dependente")

points(z, t, col = "blue", pch = 4)
points(y,t, col = 777, pch = 9)

legend(-6,5,9, legend = c("Nível 1", "Nível 2", "Nível 3"),
       col = c(123, "blue", 777), pch = c(10,4,9),
       cex = 0.80, bty = "n")

attach(sleep)

#Construção de um Boxplot
sleepboxplot = boxplot(data = sleep, extra ~ group,
                       main = "Duração do sono",
                       col.main = "red", ylab = "Horas", xlab = "Droga")

#Calculo de média 
medias = by(extra, group, mean)

#adicionando a média ao gráfico 
points(medias, col = "red")

#Boxplot na horizontal 
horizontalboxplot = boxplot(data = sleep, extra ~ group,
                       ylab = "", xlab = "", horizontal = T)

horizontalboxplot = boxplot(data = sleep, extra ~ group, 
                            ylab = "", xlab = "", horizontal = T, 
                            col = c("blue", "red"))
#Construindo Histogramas
?cars
View(cars)
dados = cars$speed
hist(dados) 
#estatistica descritiva usa-se histograma  

hist(dados, breaks = 10, main = "Histograma das Velocidades")
hist(dados, labels = T, breaks = c(0,5,10,20,30), main = "Histograma das Velocidades")
hist(dados, labels = T, breaks = 10, main = "Histograma das Velocidades")
hist(dados, labels = T, ylim = c(0,10), breaks = 10, main = "Histograma das Velocidades")

#adicionando linhas ao histograma 
grafico <- hist(dados, breaks = 10, main = "Histograma das Velocidades")

xaxis = seq(min(dados), max(dados), length = 10)
yaxis = dnorm(xaxis, mean = mean(dados), sd = sd(dados))
yaxis = yaxis*diff(grafico$mids)*length(dados)

lines(xaxis, yaxis, col = "green")

