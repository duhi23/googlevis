library(googleVis)
ls("package:googleVis")
op <- options(gvis.plot.tag = "chart")

# Ejemplo 1
head(CityPopularity)
Pie <- gvisPieChart(CityPopularity, options = list(width = 400, height = 200))
plot(Pie)

# Ejemplo 2
head(Exports)
Geo <- gvisGeoChart(Exports, locationvar = "Country", colorvar = "Profit", options = list(height = 300, 
                                                                                          width = 350))
Tbl <- gvisTable(Exports, options = list(height = 300, width = 200))
plot(gvisMerge(Geo, Tbl, horizontal = TRUE))

# Ejemplo 3
head(women)
Scatter1 <- gvisScatterChart(women, options = list(gvis.editor = "edit", vAxis = "{title:'weight (lbs)'}", 
                                                   hAxis = "{title:'height (in)'}"))
plot(Scatter1)


# Ejemplo 4
df = data.frame(country = c("US", "GB", "BR"), val1 = c(1, 3, 4), val2 = c(23, 
                                                                           12, 32))
head(df)
Intensity1 <- gvisIntensityMap(df, locationvar = "country", numvar = c("val1", 
                                                                       "val2"))
plot(Intensity1)

# Ejemplo 5
## Add the mean
CityPopularity$Mean=mean(CityPopularity$Popularity)
CC <- gvisComboChart(CityPopularity, xvar='City',
                     yvar=c('Mean', 'Popularity'),
                     options=list(seriesType='bars',
                                  width=450, height=300,
                                  title='City Popularity',
                                  series='{0: {type:\"line\"}}'))
plot(CC)


## Set options back to original options
options(op)


