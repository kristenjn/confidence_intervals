library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(googleVis)

ui <- dashboardPage(
  skin = "black",
  dashboardHeader(
    title = "Confidence Intervals",
    titleWidth = 125
  ), #end header
  dashboardSidebar(
    sidebarMenu(
      width = 125,
      selectInput(inputId = "sample_size",
                  label = "Select sample size",
                  choices = c(10,
                              20,
                              50,
                              100)
      )
    ) #end sidebar menu
  ), #end sidebar
  dashboardBody(
    column(width = 6,
           "Distribution of data from population (typically unknown)",
           htmlOutput("population_plot"),
           "Distribution of data sampled from population",
           htmlOutput("sample_plot")
           ),
    column(width = 6,
           "50% CI",
           htmlOutput("ci_50"),
           "90% CI",
           htmlOutput("ci_90"),
           "99% CI",
           htmlOutput("ci_99")
           )
  ) #end body
)
