library(shiny)
library(googleVis)
library(here)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  source(here("www/plot_ci_results.R"))
  
  rv <- reactiveValues()
  # POPULATION DATA
  x_population <- seq(-4, 4, length=10000)
  y_hist_pop <- rnorm(x)
  
  observeEvent(input$sample_size, {
    # SAMPLED DATA
    n = input$sample_size
    
    rv$y_hist <- sample(y_hist_pop, size = n, replace = FALSE)
    rv$population_mean <- mean(y_hist_pop)
    rv$sample_mean <- mean(rv$y_hist)
  })
  
  
  
  output$population_plot <- renderGvis({
    gvisHistogram(data.frame(values = y_hist_pop),
                  options = list(chartArea = "{'width': 400}",
                                 height = 200,
                                 legend = "{ position: 'none' }",
                                 colors = "['green']",
                                 histogram = "{ bucketSize: 0.5,
                                                minValue: -4,
                                                maxValue: 4 }"
                                 )
                  )
  })
    
  output$sample_plot <- renderGvis({
    gvisHistogram(data.frame(values = rv$y_hist),
                               options = list(chartArea = "{'width': 400}",
                                              height = 200,
                                              legend = "{ position: 'none' }",
                                              colors = "['green']",
                                              histogram = "{ bucketSize: 0.5,
                                                             minValue: -4,
                                                             maxValue: 4 }"
                                              )
                  )

  })
    
  output$ci_50 <- renderGvis({
    ci_data <- t.test(rv$y_hist, conf.level = 0.5)$conf.int
    plot <- plot_ci_results(ci_data, rv$sample_mean, rv$population_mean)
  })
  output$ci_90 <- renderGvis({
    ci_data <- t.test(rv$y_hist, conf.level = 0.9)$conf.int
    plot <- plot_ci_results(ci_data, rv$sample_mean, rv$population_mean)
  })
  output$ci_99 <- renderGvis({
    ci_data <- t.test(rv$y_hist, conf.level = 0.99)$conf.int
    plot <- plot_ci_results(ci_data, rv$sample_mean, rv$population_mean)
  })
})
