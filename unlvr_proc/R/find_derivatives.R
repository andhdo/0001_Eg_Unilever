x=seq(0,2*pi,0.01)
y=sin(x)

# find for max values and its index
p <- findPeaks(y)

# plot the function and its max-point
plot(y,type='l')
points(p,y[p])


#smoothingSpline<-smooth.spline(x = y, y = x)