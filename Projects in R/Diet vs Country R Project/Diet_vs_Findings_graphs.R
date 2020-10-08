#data2 = read.csv("cleaned_data_2010.csv")
data2=clean_data_fin
newdata = subset(data2,Year==2010,select=Fruit:Poultry)
newdata = scale(newdata)
#psath#data.eucdist <- dist(t(data))
#data.euccs <- cmdscale(data.eucdist, k=5, eig=TRUE)

data_eucdist = dist(newdata)# method="canberra")
data_euccs = cmdscale(data_eucdist, k=10, eig=TRUE)

#plot(1:53, data_euccs$eig, xlab="eigenvalue number",ylab="Eigenvalue",main="Eigenvalues of Classical Scaling for 2010 Consumption Data")

#data_eucdist = dist(newdata2)
#data_euccs2 = isoMDS(d=data_eucdist ,y=matrix(runif(106), nrow=53, ncol=2))

#X <- cbind(as.numeric(data_euccs$points[,1]), as.numeric(data_euccs$points[,2]))
#Y <- cbind(data_euccs2$points[,1], data_euccs2$points[,2])
#scaled2=Procrustes(X=X,Y=Y)

#code for configu graphs


library(factoextra)

num_clust = 5
fviz_nbclust(data_euccs$points, kmeans, "wss")

km <- kmeans(x=data_euccs$points, centers=num_clust, nstart=100)
plot(data_euccs$points[,1], data_euccs$points[,2], xlab="Dimension 1", ylab="Dimension 2", type="n", main="K-means Clustering on Classical Scaling")
text(data_euccs$points[,1], data_euccs$points[,2], col=km$cluster, lab=data2[[1]])


plot(data_euccs$points[,1], data_euccs$points[,2], xlab="coordinate 1", ylab="coordinate 2", type="n",main="Classical vs Ordinal scaling with Procrustes and Euclidean Metric, year 2010")
text(data_euccs$points[,1], data_euccs$points[,2], labels=data2[[1]], cex=0.7, col="black")
text(scaled2$Yhat[,1], scaled2$Yhat[,2], labels=data2[[1]], cex=0.7, col="red")

legend("topright", legend=c("Ordinal", "Classical"),col=c("red", "black"), lty=1, cex=0.8)


#code for configu graphs
par(new=TRUE)
#plot(data_euccs2$points[,1], data_euccs2$points[,2], xlab="Cordinate 1", ylab="Cordinate 2", type="n",main="Nonmetric MDS")
#text(data_euccs2$points[,1], data_euccs2$points[,2], labels=data2[[1]], cex=0.7,col="red")
#plot(scaled[,1], scaled[,2], xlab="Cordinate 1", ylab="Cordinate 2", type="n",main="Nonmetric MDS")
text(scaled2$Yhat[,1], scaled2$Yhat[,2], labels=data2[[1]], cex=0.7,col=2)


install.packages("smacof")
library("smacof")

data3=cleaned_data_2010
newdata3 = subset(data3,Year==2010,select=Other:Poultry)
newdata3 = scale(newdata3)
#psath#data.eucdist <- dist(t(data))
#data.euccs <- cmdscale(data.eucdist, k=5, eig=TRUE)Pultry

data_eucdist3 = dist(newdata3)
data_euccs3 = cmdscale(data_eucdist3, k=4, eig=TRUE)

#plot(1:5, data_euccs$eig, xlab="eigenvalue number",ylab="Eigenvalue")

plot(data_euccs3$points[,1], data_euccs3$points[,2], xlab="Y[,1]", ylab="Y[,2]", type="n")
text(data_euccs3$points[,1], data_euccs3$points[,2], labels=data3[[1]], cex=0.7)


















data2010 = subset(data2,Year==2010,select=Fruit:Poultry)
data2010 = scale(data2010)
data2010_eucdist = dist(data2010, method="canberra")
data_euccs = cmdscale(data2010_eucdist, k=10, eig=TRUE)

data1995 = subset(data2,Year==1995,select=Fruit:Poultry)
data1995 = scale(data1995)
data1995_eucdist = dist(data1995, method="canberra")
data1995_euccs = cmdscale(data1995_eucdist, k=10, eig=TRUE)


X <- cbind(as.numeric(data_euccs$points[,1]), as.numeric(data_euccs$points[,2]))
Y <- cbind(data1995_euccs$points[,1], data1995_euccs$points[,2])
scaled2=Procrustes(X=X,Y=Y)

data1995 = subset(data2,Year==1980,select=Fruit:Poultry)
data1995 = scale(data1995)
data1995_eucdist = dist(data1995, method="canberra")
data1995_euccs = cmdscale(data1995_eucdist, k=10, eig=TRUE)


X <- cbind(as.numeric(data_euccs$points[,1]), as.numeric(data_euccs$points[,2]))
Y <- cbind(data1995_euccs$points[,1], data1995_euccs$points[,2])


scaled3=Procrustes(X=X,Y=Y)

data1995 = subset(data2,Year==1965,select=Fruit:Poultry)
data1995 = scale(data1995)
data1995_eucdist = dist(data1995, method="canberra")
data1995_euccs = cmdscale(data1995_eucdist, k=10, eig=TRUE)


X <- cbind(as.numeric(data_euccs$points[,1]), as.numeric(data_euccs$points[,2]))
Y <- cbind(data1995_euccs$points[,1], data1995_euccs$points[,2])
scaled4=Procrustes(X=X,Y=Y)

#code for configu graphs
plot(data_euccs$points[,1], data_euccs$points[,2], xlab="coordinate 1", ylab="coordinate 2", type="n",main="How food consumption has changed over time, Classical scaling, Canberra metric")
text(data_euccs$points[,1], data_euccs$points[,2], labels=data2[[1]], cex=0.7, col="black")
text(scaled2$Yhat[,1], scaled2$Yhat[,2], labels=data2[[1]], cex=0.7, col="red")
text(scaled3$Yhat[,1], scaled3$Yhat[,2], labels=data2[[1]], cex=0.7, col="blue")
text(scaled4$Yhat[,1], scaled4$Yhat[,2], labels=data2[[1]], cex=0.7, col="green")

legend("topright", legend=c("2010", "1995","1980","1965"),col=c("black", "red","blue","green"), lty=1, cex=0.8)
