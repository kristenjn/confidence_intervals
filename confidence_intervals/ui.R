library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(r2d3)

source("tab_panels/confidence_intervals.R")

ui <- dashboardPage(
  skin = "black",
  dashboardHeader(
    title = ""
    # titleWidth = 125
  ), #end header
  dashboardSidebar(
    sidebarMenu(
      # width = 125,
      id = "tabs",
      menuItem("Confidence Intervals", tabName = "ci_panel")
      # HTML("<hr style = 'background-color:white; height:5px;border:none; margin:15px 3px 15px 3px;'>"),
    ) #end sidebar menu
  ), #end sidebar
  dashboardBody(
    tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "bootswatch_ci.css")),
    ci_tab
  ) #end body
)
