install.packages("reshape2")
library(reshape2)

#Plotando um gráfico básico com qplot()
data(tips, package = 'reshape2')
View(tips)
install.packages("qplot")
library(ggplot2)
data(tips, package = 'reshape2')
qplot(total_bill, tip, data = tips, geom = "point")

#Camada 1
camada1 <- geom_point(
  mapping = aes(x = total_bill, y = tip, color = sex),
  data = tips,
  size = 3
)
ggplot() + camada1

?aes
??aes

#Construindo um modelo de regressão
modelo_base <- lm(tip ~ total_bill, data = tips)
modelo_fit <- data.frame(
  total_bill = tips$total_bill,
  predict(modelo_base, interval = "confidence")
)
head(modelo_fit)

#Camada 2 - linha
camada2 <- geom_line(
  mapping = aes(x = total_bill, y = fit), 
  data = modelo_fit,
  color = "darkred"
)
ggplot() + camada1 + camada2

#camada 3 - fita
camada3 <- geom_ribbon(
  mapping = aes(x = total_bill, ymin = lwr, ymax = upr),
  data = modelo_fit,
  alpha = 0.3
)
ggplot() + camada1 + camada2 + camada3

#Versão final otimizada
ggplot(tips, aes(x = total_bill, y = tip)) +
  geom_point(aes(color = sex)) + 
  geom_smooth(method = "lm")

#Gravando o gráfico em um objeto
myplot <- ggplot(tips, aes(x = total_bill, y = tip)) + 
  geom_point(aes(color = sex)) + 
  geom_smooth(method = "lm")

class(myplot)
print(myplot)

#Scatterplot com linha de regressão
#dados

data = data.frame(cond = rep(c("Obs1", "Obs2"),
                             each = 10), var1 = 1:100 +
                             rnorm(100, sd = 9), var2 = 1:100 +
                             rnorm(100, sd = 16))

#plot
ggplot(data, aes(x = var1, y = var2)) + 
  geom_point(shape = 1) +
  geom_smooth(method = lm , color = "red", se = FALSE)


#Bar plot
#dados
data = data.frame(grupo = c("A", "B", "C", "D"), 
                  valor = c(33,62,56,67),
                  num_obs = c(100,500,459,342))

#gerando massa de dados 
data$right = cumsum(data$num_obs) + 30 * c(0:(nrow(data)-1))
data$left = data$right - data$num_obs

#plot
ggplot(data, aes(ymin = 0)) +
  geom_rect(aes(xmin = left, xmax = right,
                ymax = valor, colour = grupo, fill = grupo)) +
                xlab("Número de Observações") + ylab("Valor")
#usando mtcars
head(mtcars)
ggplot(data = mtcars, aes(x=disp, y = mpg)) + geom_point()

#Outro aspecto que pode ser mapeado nessa gráfico é a cor dos pontos
ggplot(data = mtcars,
       aes(x = disp, y = mpg,
           colour = as.factor(am))) + geom_point()
#Mapeando o tamanho dos pontos à uma variável de interesse
ggplot(mtcars, aes(x = disp, y = mpg, colour = cyl, size = wt)) + geom_point()


#Variavel geom definem qual forma geométrica será utilizada para a visualização
ggplot(mtcars, aes(x = as.factor(cyl), y = mpg)) + geom_boxplot()

#histograma 
ggplot(mtcars, aes(x = mpg), binwidth = 30) + geom_histogram()

#Gráfico de Barras
ggplot(mtcars, aes(x = as.factor(cyl))) + geom_bar()

# Personalizando os gráficos

ggplot(mtcars, aes(x = as.factor(cyl), y = mpg,
                   colour = as.factor(cyl))) + geom_boxplot()

#Preenchendo o quadro
ggplot(mtcars, aes(x = as.factor(cyl), y = mpg,
                    fill = as.factor(cyl))) + geom_boxplot()

#mudando cores
ggplot(mtcars,
       aes(x = as.factor(cyl), y = mpg)) +
  geom_boxplot(color = "blue", fill = "seagreen4")

#Plots diferentes juntos
install.packages("gridExtra")
library(gridExtra)

# Carregando Dataset
data("diamonds")

#histrograma como plot1

plot1 <- qplot(price, data = diamonds, binwidth = 1000)

# Scartterplot como plot2

plot2 <- qplot(carat, price, data = diamonds, colour = cut)

# Combinando os 2 plots na mesma área

grid.arrange(plot1, plot2, ncol = 1)

# Gráfico de densidade

ggplot(data = diamonds, aes(x = price, group = cut, fill = cut)) +
  geom_density(adjust = 1.5)

ggplot(data = diamonds, aes(x = price, group = cut, fill = cut)) +
  geom_density(adjust = 1.5, alpha = 0.2)

ggplot(data = diamonds, aes(x = price, group = cut, fill = cut)) +
  geom_density(adjust = 1.5, position = "fill")

# Facetes com reshape

install.packages("plotly")
library(reshape2)
library(plotly)
library(ggplot2)

sp <- ggplot(tips, aes(x = total_bill, y = tip/total_bill)) + geom_point(shape = 1)
sp + facet_grid(sex ~ .)
ggplotly()
sp + facet_grid(. ~ sex)
ggplotly()
sp + facet_wrap( ~ day, ncol = 2)
ggplotly()

ggplot(mpg, aes(displ, hwy)) + geom_point() + facet_wrap(~manufacturer)
ggplotly()