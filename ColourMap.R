#script to identify colors
#julin maloof Oct 27, 2010

console=T #should colors be printed to the console?
plotText=T #should color names be printed onto the graph?

#need to convert named colors to hex representaion
colorhex <- rgb(t(col2rgb(colors())),max=255)

#create a matrix of colornames.  This will have the same dimensions as the plot
colorNames <- matrix(colors(),ncol=25)

#adjust graphic parameters to reduce margin size.  Store original parameters in op
op <- par(mar=c(2,2,4,2))

#plot an image of all named colors
image(x=0:27,y=0:25,z=matrix(1:length(colorhex),ncol=25),
      col=colorhex,ylab="",xlab="",xaxt="n",yaxt="n",
      main="Click a color to find its name\n Click in the margin to finish")

#repeatedly check for mouse click and report color
repeat {
  location <- locator(n=1) #get mouse click location
  
  if (location$x < 0 | #check to see if outide plot area
        location$x > 27 |
        location$y < 0 |
        location$y > 25) break #if outside plot area then quit
  
  if (console) print(colorNames[ceiling(location$x),ceiling(location$y)])
  
  if (plotText) text(location,labels=colorNames[ceiling(location$x),ceiling(location$y)],cex=.75)
}

par(op) # restore graphic parameters