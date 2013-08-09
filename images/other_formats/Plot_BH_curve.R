#Plot BH curve and relative permeability
#Data taken from newthon-raphson method file
library("extrafont")
library("extrafontdb")
loadfonts()

#Change directory
setwd("~/Desktop/htsg/Ozan_PhD/Dissertation/chapter8/codes")

#Import B-H Curve
#Somaloy
#BH.curve <- read.delim("somaloy1000-b-h-curve.txt")
#Laminated steel
BH.curve <- read.delim("vacoflux-50.txt")


#Add 0,0 point
BH.curve <- rbind(c(0,0), BH.curve)
#Convert to kA/m
BH.curve$H <- BH.curve$H/1e3

filename<-"vacoflux_50.pdf"
pdf(filename, family="CM Roman", width=3.6, height=3.5, pointsize=10)
#Plot B-H Curve
plot(BH.curve, ylim=c(0,2.5), type="o", axes=F, xlim=c(0,20), pch=20,ylab=NA, xlab=NA)
axis(side = 1, tck = -.015, labels=NA)
axis(side = 2, tck = -.015, labels = NA)
axis(side = 1, lwd = 0, line = -.8)
axis(side = 2, lwd = 0, line = -.6, las = 1)
mtext(side = 1, "H (kA/m)", line = 1.5)
mtext(side = 2, "B (T)", line = 1.6)
grid()
dev.off()
embed_fonts(filename)
system(paste("pdfcrop", filename, filename))


