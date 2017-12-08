setwd("C:\\Eastern Michigan\\STAT 573\\project\\data1")
require(rgdal)
dem<-readGDAL("w001001.adf")
str(dem)
EXTENT_USED <- c(-79.94708,-79.78042,41.76292,41.92958)
#spplot(dem)


#search for solid blocks of 200x200
library(sp)
coords<-coordinates(dem)
top_map<-data.frame(coords,dem@data)

library(raster)

rast<-raster(dem)

a<-ceiling(runif(1000)*17289560)



##Lake Erie Data
library(raster)
rast<-raster("erie_lld.asc") #loads data as a raster layer
#plot(rast)
#e<-drawExtent()

ext<-extent(c(-81.27686,-80.84582,42.25134,42.57167))
rast2<-crop(rast,ext)

set.seed(25)
yrand<-floor(runif(1)*2202)
xrand<-floor(runif(1)*7002)

xcoord_rand<-extent(rast)@xmin+xrand*res(rast)[1]
ycoord_rand<-extent(rast)@ymin+yrand*res(rast)[2]

ext_rand<-extent(c(xcoord_rand,xcoord_rand+200*res(rast)[1],ycoord_rand,ycoord_rand+200*res(rast)[1]))
rast_rand <- crop(rast,ext_rand)

rast_used <- crop(rast, EXTENT_USED)
heights <- values(rast_used)

