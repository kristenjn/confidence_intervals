source("server_files/ci_files/plot_ci_results.R")

rv <- reactiveValues()
# POPULATION DATA
x_population <- seq(100, 150, length=10000)
y_hist_pop <- rnorm(x_population)
population_mean <- mean(y_hist_pop)

observeEvent(c(input$sample_size, input$new_sample), {
  # SAMPLED DATA
  n = input$sample_size
  rv$y_hist <- sample(y_hist_pop, size = n, replace = FALSE)
  rv$sample_mean <- mean(rv$y_hist)

})

observeEvent(c(input$confidence_interval, rv$y_hist), {
  ci = input$confidence_interval/100
  rv$ci_data <- t.test(rv$y_hist, conf.level = ci)$conf.int
})


output$population_plot <- renderD3({
  r2d3(
    y_hist_pop,
    script = "server_files/ci_files/histogram.js"
  )
})

output$sample_plot <- renderD3({
  r2d3(
    rv$y_hist,
    script = "server_files/ci_files/histogram.js"
  )
})

output$ci_plot <- renderD3({
  plot_data <- c(rv$ci_data[1],
                 rv$ci_data[2],
                 population_mean,
                 rv$sample_mean)
  r2d3(plot_data,
       script = "server_files/ci_files/range_plot.js")
})

output$ci_plot_legend <- renderD3({
  r2d3(data = 1,
       script = "server_files/ci_files/legend.js")
})

output$ci_selected <- renderText({
  paste0(input$confidence_interval, "% confidence interval")
})

output$n_selected <- renderText({
  paste0("n=", input$sample_size)
})