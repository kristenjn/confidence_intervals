plot_ci_results <- function(ci_data, sample_mean, population_mean) {
  M <- matrix(nrow=4,ncol=4)
  M[col(M)==row(M)] <- c(0, 0, 0, 0)
  df <- data.frame(X=c(ci_data[1], sample_mean, population_mean, ci_data[2]), M)
  colnames(df) <- c("xvals", "lower", "sample", "population", "upper")
  df$lower.interval.1 <- c(-1, NA, NA, NA)
  df$lower.interval.2 <- c(1, NA, NA, NA)
  
  gVis_plot <- gvisLineChart(df, 
                             xvar = "xvals",
                             yvar = c("lower",
                                      "sample",
                                      "population",
                                      "upper",
                                      "lower.interval.1",
                                      "lower.interval.2"),
                             options=list(height = 150,
                                          chartArea = "{'width': 400}",
                                          axisTitlesPosition = "none",
                                          hAxis = "{ baselineColor: 'transparent',
                             
                             minValue: -1,
                             maxValue: 1 }",
                                          vAxis = "{ 
                             gridlines: {count: 0} }",
                                          series="{
                             0: { color:'black', pointShape: 'square', pointSize: 10 },
                             1: { color:'black', pointShape: 'circle', pointSize: 10 },
                             2: { color:'red', pointShape: 'circle', pointSize: 10 },
                             3: { color:'black', pointShape: 'square', pointSize: 10 }
                             }",
                                          lineWidth = 1,
                                          intervals = "{ 'style':'area' }",
                                          interval = "{
                             'i1': { 'color': '#E49307', 'style':'sticks' },
                             'i2': { 'color': '#E49307', 'style':'sticks', 'barWidth':0, 'lineWidth':1, 'pointSize':1, 'fillOpacity':1 }}"                                                          
                             )
  )
  return(gVis_plot)
}