#JohnHopkins University course in 
#Exploratory data analysis with Dr Roger Peng


# Base plotting system ----------------------------------------------------

?Devices #What graphic devices are available on your system
dev.cur()# shows current plotting device - screen = 2, pdf = 4


##Base graphic elements
pch   #plotting symbol (default = circle)
lty   #line type (default = solid line)
lwd   #line width
col   #plotting colour --> hex code
xlab  #character string for x-axis label
ylab  #character string for y-axis label

par() #used to specify global graphics parameters
  par("pch")
  
las #orientation of axis labels on plot
bg  #background colour
mar #margin size
oma #outer margin size (default = 0 for all sides)
mfrow #number of plots per row (plots filled row-wise)
mfcol #number of plots per column (plots filled column-wise)

##Base plotting functions

plot() #scatterplot
  lines #add lines to the plot
  points #add points to the plot
  text #add labels using specified x,y coordinates --> text(coordinates x, y, "Text")
  title
  mtext #add arbitrary text to the margins (inner or outer)
  axis #add axis ticks/labels
  
plot(x, y)
  ?par #parameters
  legend("topright",)
  
  
hist(x)
  rug() #use underneath histogram to get some fine detail
  
boxplot()
  abline(h = ) #to be able to show mean, median etc. --> can be used in hist as well
    abline(v = median(dataset$column), col = 'magenta', lwd = 4)


##Examples
library(datasets)

hist(airquality$Ozone)


#Scatterplot
with(airquality, plot(Wind, Ozone))
#abline(fit) fit the linear model

  with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City"),
       type = "n") #type n initializes graphic device without plotting
  with(subset(airquality, Month == 5), points(Wind, Ozone, col="blue"))
  with(subset(airquality, Month != 5), points(Wind, Ozone, col="red"))
  legend(topright, pch = 1, col = c("blue","red"), legend = c("May", "Other months"))
  
  #with regression line
  with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City", pch = 20))
  model <- lm(Ozone ~ Wind, airquality)
  abline(model, lwd = 2)
  
  #Multiple base plots
  par(mfrow = c(1,2))
  with(airquality, {
    plot(Wind, Ozone, main = "Ozone and Wind")
    plot(Solar.R, Ozone, main = "Ozone and Solar radiation")
  })
  
  par(mfrow = c(1,3), mar = c(4,4,2,1), oma = c(0,0,2,0)) 
  #margin little bit lower / outer margin bigger  than default - make space for overall title
  #side one bottom, side two left, side three top, side four right
  with(airquality, {
    plot(Wind, Ozone, main = "Ozone and Wind")
    plot(Solar.R, Ozone, main = "Ozone and Solar radiation")
    plot(Temp, Ozone, main = "Ozone and Temperature")
    mtext("Ozone and Weather in New York City", outer = TRUE)
  })
  
  #SMOOTH Scatterplot - when having thousands of points
  smoothScatter(x,y)
    #Example
    x <- rnorm(10000)
    y <- rnorm(10000)
    smoothScatter(x,y)

#Boxplot
airquality <- transform(airquality, Month = factor(Month))
boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone (ppb)")


#Sending plots to devices (from screen to working directory)
pdf(file="myplot.pdf") #set sending location away from screen - #dev.cur() 

plot(xy)

dev.off() #to finish and save .pdf file to wd

  #Or plot your data and then copy
  dev.copy(png, file = "xyplot.png")
  dev.off()


# Lattice system ----------------------------------------------------------
#Entire plot specified by ONE function
#Looking how y changes with x across levels of z
#Good for putting many plots on a screen at once

library(lattice)

xyplot()    #main function for scatterplots
bwplot()
histogram()
stripplot() #like boxplot but with actual points
dotplot()
splom()     #scatterplot matrix
levelplot() #for plotting image data
contourplot() #""

xyplot(y ~ x | f * g, data) #f & g are conditioning variables - optional


##Examples
library(datasets)
xyplot(Life.Exp ~ Income | region, data = state, layout = c(2,2)) #layout = c(4,1)

xyplot(Ozone ~ Wind, data = airquality)

airquality <- transform(airquality, Month = factor(Month)) #convert month to a factor
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5,1))


# ggplot2 -----------------------------------------------------------------
#Mixes elements of Base and Lattice

#Two workhorse functions - qplot / ggplot

#Basic components
#1. data frame
#2. asthetic mapping
#3. geoms
#4. facets
#5. stats
#6. scales
#7. coordinate system

library(ggplot2)
str(mpg)
qplot(displ, hwy, data = mpg) #x-coord, y-coord, dataframe
  qplot(displ, hwy, data = mpg, color = drv) #adding colour for drive variable
  
  qplot(displ, hwy, data = mpg, geom = c("point", "smooth"))
  
  #histogram filled by colours
  qplot(hwy, data = mpg, fill = drv)


# ggplot2 Facets ------------------------------------------------------------------

qplot(displ, hwy, data = mpg, facets = .~drv) 
#facets --> like mfrow; if .~ before variable - data displayed horizontally
qplot(displ, hwy, data = mpg, facets = drv~.)
#if ~. after variable - data displayed vertically


# ggplot2 Annotations -----------------------------------------------------

xlab()
ylab()
ggtitle()

+ theme_bw() #more stark/plain background instead of default grey
  + theme_bw(base_family = "Times") #changing font

+geom("density")

+ geom_point(aes(colour = drv), size = , alpha = 1/2) 
#aes = aesthetics to amend colours for a variable \ alpha = transparency

+ geom_smooth(method = "lm") #set smooth lf

+labs(title="", x="", y="")

#Axis limits when outliers present
+ ylim(-3,3) #excludes outlier
+ coord_cartesian(ylim = c(-3,3)) #includes outlier but cuts at value ylim


# Colours -----------------------------------------------------------------

library(grDevices)
colours() #657 varieties

heat.colors() #yellow to red
topo.colors() #blue to brown

colorRamp() #0 to 1; extreme ends, inbetweens return blends
  #Example
  pal <- colorRamp(c("red","blue"))
    pal(0) #3 long vector corresponding to red, green, blue RGB
    #      [,1] [,2] [,3]
    #[1,]  255    0    0
    
  
colorRampPalette() #function takes integer arguments and returns a vector of colour
#each element is a 24 bit number, represented as 6 hexadecimal character;
#representing intensities of RGB with 2 characters for each colour;
#has 4 arguments, 3 for colours & 1 for alpha which stands for colour density

  #Example
  p2 <- colorRampPalette(c("red", "yellow"))
  showMe(p2(20)) #variation of 20


library(RColorBrewer) #can be used in conjunction with colorRamp() & colorRampPalette()
  #Example
  cols <- brewer.pal(3, "BuGn")
  pal <- colorRampPalette(cols)
  image(volcano, col = pal(20))
  


# Cut ggplot2 -------------------------------------------------------------

quantile()
  #Example
  cutpoints <- quantile(diamonds$carat,seq(0,1,length=4),na.rm=TRUE)
    diamonds$car2 <- cut(diamonds$carat,cutpoints); stageVariable("diamonds$car2",diamonds$car2)
    g <- ggplot(diamonds, aes(depth, price))
    g + geom_point(alpha=1/3) + facet_grid(cut~car2)
    g + geom_point(alpha=1/3) + facet_grid(cut~car2) + geom_smooth(method="lm", size=3, color="pink")
    
    ggplot(diamonds, aes(carat, price)) + geom_boxplot()+ facet_grid(.~cut)
