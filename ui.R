

# Dashboard Header ----------------------------------------------------
header <- dashboardHeader(title = "WhatData - Shiny Version")

# Dashboard Sidebar ---------------------------------------------------

sidebar <- dashboardSidebar(
  selectizeInput("selClasses",
                 label = "Select Classes",
                 choices = uniqueClasses,
                 multiple = TRUE, 
                 selected = "data.frame",
                 options = list(placeholder = "Select Classes")
                 ),
                 
  selectizeInput("selPackages",
                 label = "Select Packages",
                 choices = uniquePackages,
                 multiple = TRUE, 
                 selected = uniquePackages,
                 options = list(placeholder = "Select Packages")
                 )
  )

# Dashboard Body--- ---------------------------------------------------
body <- dashboardBody(
  fluidPage(
    DT::dataTableOutput("Datasets")
    )
)


# Shiny User Interface
shinyUI(dashboardPage(header, sidebar, body))
