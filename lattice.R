# Lattice - gráfico de alto nível 
 install.packages('lattice')
library(lattice)
library(ggplot2)
??xplot
xyplot(data = iris, groups = Species, Sepal.Length ~ Petal.Length)

?barchart

# Barplots com dataset Titanica

barchart(Class ~ Freq | Sex + Age, data = as.data.frame(Titanic),
         groups = Survived, stack = T, layout = c(4,1),
         auto.key = list(title = "Dados Titanic", columns = 2))

# Contagem de elementos 
PetalLength <- equal.count(iris$Petal.Length, 4)
PetalLength

# Scatterplots

xyplot(Sepal.Length~Sepal.Width | PetalLength, data = iris)

xyplot(Sepal.Length~Sepal.Width | PetalLength, data = iris, 
       panel = function(...){
         panel.grid(h = -1, v = -1, col.line = "skyblue")
         panel.xyplot(...)})

# COlocando linha de regressão
xyplot(Sepal.Length~Sepal.Width | PetalLength, data = iris,
       panel = function(x,y,...) {
         panel.xyplot(x,y,...)
         mylm <- lm(y~x)
         panel.abline(mylm)})

# Criando Histograma 
histogram(~Sepal.Length | Species, xlab = "",
          data = iris, layout=c(3,1), type = "density",
          main = "Histograma Lattice", sub = "Iris Dataset, Sepal Length")

#Distribuição de dados
qqmath(~Sepal.Length | Species, data = iris, distribution = qunif)

#Boxplot
bwplot(Species~Sepal.Length, data = iris)

# Criando gráfico Violino 
bwplot(Species~Sepal.Length, data = iris,
       panel = panel.violin)

# Criando Mapas 
install.packages(c("maps", "mapdata"))
library(ggplot2)
library(maps)
library(mapdata)

# Função para buscar as coordenadas dos países
?map_data
mapa <- map_data("world")

# Visualizando o dataframe
dim(mapa)
View(mapa)

ggplot() + geom_polygon(data = mapa, aes(x = long, y = lat, group = group)) + 
  coord_fixed(1.3)

ggplot() + 
  geom_polygon(data = mapa, aes(x = long, y = lat, group = group), fill = NA, color = "Blue") + 
  coord_fixed(1.3)

gg1 <- ggplot() + 
  geom_polygon(data = mapa, aes(x = long, y = lat, group = group), fill = "seagreen1", color = "Blue") +
  coord_fixed(1.3)
gg1

# Marcando alguns pontos no mapa 
labs <- data.frame(
  long = c(69.24140, -2.8456051),
  lat = c(-78.38995, 22.44512),
  names = c("Ponto1", "Ponto2"),
  stringsAsFactors = FALSE
)

gg1 + 
  geom_point(data = labs, aes(x = long, y = lat), color = "Black", size = 2) + 
  geom_point(data = labs, aes(x = long, y = lat), color = "yellow", size = 2)

# Divisão por paises

ggplot(data = mapa) +
  geom_polygon(aes(x = long, y = lat, fill = region, group = group), color = "white") + 
  coord_fixed(1.3) +
  guides(fill=FALSE)

