ci_tab <- tabPanel(
  "ci_panel",
  fluidRow(column(width = 12,
                  "Explore how confidence interval range varies with sample size, level of confidence, and the random sample",
                  HTML("<hr>"))),
  fluidRow(
    column(width = 6,
           box(
             width = NULL,
             title = "Distribution of data in population",
             style = ("padding:25px;"),
             d3Output("population_plot", height = "150px")
           ),
           box(
             width = NULL,
             title = "Select size of sample",
             div(style = "margin-bottom: 15px;",
                 sliderInput(inputId = "sample_size",
                             label = NULL,
                             min = 10,
                             max = 100,
                             value = 20,
                             step = 1,
                             ticks = FALSE
                 )),
             actionButton(inputId = "new_sample",
                          HTML("Draw new sample"),
                          class = "btn-primary",
                          style = "margin:auto !important;"
             ),
             HTML("<hr>"),
             uiOutput("n_selected"),
             div(style = "padding:25px;",
                 d3Output("sample_plot", height = "150px")
             ))
    ), #end fluidrow
    column(width = 6,
           box(
             width = NULL,
             solidHeader = TRUE,
             title = "Results",
             sliderInput(inputId = "confidence_interval",
                         label = "Select confidence interval",
                         min = 25,
                         max = 99,
                         value = 95,
                         step = 5,
                         ticks = FALSE),
             HTML("<hr>"),
             uiOutput("ci_selected"),
             div(style = "padding:25px;",
                 d3Output("ci_plot", height = "100px")),
             HTML("<br>"),
             d3Output("ci_plot_legend", height = "100px")
           ))
  ) #end fluidrow
)