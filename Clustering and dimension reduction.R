#JohnHopkins University course in 
#Exploratory data analysis with Dr Roger Peng


# Hierarchical clustering -------------------------------------------------

#Calculate pairwise distances
dist() #distance function
hclust()

  hclust(dist(dataFrame))
  plot() #Dendrogram
  
heatmap()


# K means clustering ------------------------------------------------------

kmeans(dataFrame, centers=3) #three centroids


# Dimension reduction -----------------------------------------------------

#SVD Singular Value Decomposition

library(impute) #http://bioconductor.org/

#PCA Principle Component Analysis
prcomp(scale(matrixXY))


