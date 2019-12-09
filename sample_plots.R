

df <- data.frame(ci = "95%",
                 mean = 30,
                 mean.interval.1 = 10,
                 mean.interval.2 = 40
                 )

plot(
  gvisLineChart(df, xvar='ci', 
               yvar=c('mean',                       
                      'mean.interval.1', 
                      'mean.interval.2'),
               options=list(interval="{
                               'i1': { 'color': '#E49307', 'style':'bars', 'barWidth':0, 'lineWidth':4, 'pointSize':10, 'fillOpacity':1 },
                               'i2': { 'color': '#E49307', 'style':'bars', 'barWidth':0, 'lineWidth':4, 'pointSize':10, 'fillOpacity':1 }}"                                                          
               )
  )
)

df <- data.frame(bounds = c(2.5, 97.5),
                 value = c(0, 0),
                 value.interval.1 = c(-1, -1),
                 value.interval.2 = c(1, 1))
plot(
  gvisLineChart(df, 
                xvar = "bounds",
                yvar = c("value",
                         "value.interval.1",
                         "value.interval.2"),
                options=list(series="[{color:'blue'}]",
                             lineWidth=4,
                             intervals="{ 'style':'area' }",
                             interval="{
                               'i1': { 'color': '#E49307', 'style':'bars', 'barWidth':0, 'lineWidth':4, 'pointSize':10, 'fillOpacity':1 },
                               'i2': { 'color': '#E49307', 'style':'bars', 'barWidth':0, 'lineWidth':4, 'pointSize':10, 'fillOpacity':1 }}"                                                          
                )
  )
)

df <- data.frame("lower_bound" = ci_data[1],
                 "sample_mean" = sample_mean,
                 "upper_bound" = ci_data[1],
                 "population_mean" = population_mean)
plot(gvisLineChart(df))


df <- data.frame(bounds = c(ci_data[1], sample_mean, ci_data[2], population_mean),
                 value = c(0, 0, 0, 0),
                 value.interval.1 = c(-1, 0, -1, 0),
                 value.interval.2 = c(1, 0, 1, 0))
row.names(df) <- c("lower_bound", "a", "b", "c")

M <- matrix(nrow=4,ncol=4)
M[col(M)==row(M)] <- c(0, 0, 0, 0)
dat <- data.frame(X=1:4, M)

SC <- gvisScatterChart(dat, 
                       options=list(
                         title="Customizing points",
                         legend="right",
                         pointSize=30,
                         series="{
                         0: { pointShape: 'circle' },
                         1: { pointShape: 'triangle' },
                         2: { pointShape: 'square' },
                         3: { pointShape: 'diamond' }
                         }"))
plot(SC)
