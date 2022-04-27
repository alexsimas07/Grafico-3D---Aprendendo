 plot(lynx)
 plot(lynx, ylab = "Plots com Dataframes", xlab ="")
 plot(lynx, ylab = "Plots com Dataframes", xlab = "Observações")
 plot(lynx, main = "Plots com Dataframes", col = 'red')
 plot(lynx, main = "Plots com Dataframes", col = 'red', col.main = 52, cex.main = 1.5)
 
 library(datasets)
 hist(warpbreaks$breaks)
 
 airquality
 transform(airquality, Month = factor(Month))
 boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone(ppb)")
 
 ?par
 par()
 
 x = 2:4
 plot(x, pch = "C")
 
 par(mfrow = c(2,2), col.axis = "red")
 plot(1:8, las = 0, xlab = "xlab", ylab = "ylab", main = "LAS = 0")
 plot(1:8, las = 1, xlab = "xlab", ylab = "ylab", main = "LAS = 1")
 plot(1:8, las = 2, xlab = "xlab", ylab = "ylab", main = "LAS = 2")
 plot(1:8, las = 3, xlab = "xlab", ylab = "ylab", main = "LAS = 3")
 legend("topright", pch = 1, col = c("blue", "red"), legend = c("var1", "Var2"))
 par(mfrow = c(1,1))
 
 colors()
 
 png("Grafico2.png", width = 500, height = 500, res = 72)
 
 plot(iris$Sepal.Length, iris$Pepal.Length, 
      col = iris$Species,
      main = "Grafico gerado a partir do Iris")
 dev.off()
 
 pdf("Graficos2.pdf")
 
 plot(iris$Sepal.Length, iris$Pepal.Length, 
      col = iris$Species,
      main = "Grafico gerado a partir do Iris")
 dev.off()
 
 install.packages('plotrix')
 library('plotrix')
 ?plotrix
 par(mfrow = c(1,1), col.axis = "red")
 plot(1:6, las = 3, xlab = "lty 1:6", ylab = "", main = "Mais opções de plot")
 ablineclip(v=1, lty=1, col="sienna2", lwd=2)
 ablineclip(v=2, lty=1, col="sienna2", lwd=2)
 ablineclip(v=3, lty=1, col="sienna2", lwd=2)
 ablineclip(v=4, lty=1, col="sienna2", lwd=2)
 ablineclip(v=5, lty=1, col="sienna2", lwd=2)
 ablineclip(v=6, lty=1, col="sienna2", lwd=2)
 ablineclip(v=7, lty=1, col="sienna2", lwd=2)
 
 plot(lynx)
 plot(lynx, type="p", main="Type p")
 