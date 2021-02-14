library(spatstat)
library(maptools)
library(rgdal)


#your_sp <- readShapePoly("amazlegal_WGS.shp", proj4string = CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"))

your_sp <- readShapePoly("amazlegal_WGS.shp")
your_sp1 <- as(your_sp, "SpatialPolygons")
your_owin <- as(your_sp1, "owin")
plot(your_owin, main = "")


# Define polygon, length of transect and number of (points)transects
#data(letterR)
#your_owin <- letterR
ltransect <- 0.114
npoints <- 200
s<- 1:npoints

# Generate random origin points
cosa <- runifpoint(npoints, win=your_owin)
#plot(cosa, main = "")


cosaxy <- data.frame(cosa$x,cosa$y)

#compute a circle around each point
cosadisc<- apply(cosaxy,1, function(x) disc(r=ltransect, x))

# Test if every circle point is inside polygonal boundary
cosadisc.df <- lapply(cosadisc, function(W){
  inside.owin(W$bdry[[1]]$x,W$bdry[[1]]$y 
              ,w=your_owin)})

#function to sample circle points within the window
samplea2 <- function(cosaxy, l1=cosadisc, l2=cosadisc.df){
  result<-c(0,0)
  for (i in 1:length(l1)){
    truinside<-sum(l2[[i]])
    inside <-cbind(l1[[i]]$bdry[[1]]$x,l1[[i]]$bdry[[1]]$y)[l2[[i]],]
    result<-rbind(result,  inside[sample(1:truinside, size=1),])
  }
  result<-result[-1,]
  result<-cbind(cosaxy,result)
  return(result)
}

#the result is a matrix with x0,y0, x1, y1 for each transect
#Plot the random transects:

segmentos<-samplea2(cosaxy)
segments(segmentos[,1][s], segmentos[,2][s],segmentos[,3][s], segmentos[,4][s])

write.csv(segmentos, "segmentos v2.csv")
