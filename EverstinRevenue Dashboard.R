library(shiny)
library(DT)
#install.packages("shinydashboard")
library(shinydashboard)
# Define UI for application that draws a histogram
shinyUI(
  dashboardPage(
    dashboardHeader(title="Everstine Analysis"),
    dashboardSidebar(
      sliderInput("bins", "Number of Breaks", 1,100,50),
      sidebarMenu(
        menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
        
        menuSubItem("Home Page", tabName = "Home"),
        menuSubItem("Sales", tabName = "Sales"),
        menuSubItem("Revenue", tabName = "Revenue"),
        menuItem("Raw Data", tabName = "RawData")
      )
    ),
    dashboardBody(
      tabItems(
        tabItem(tabName= "dashboard",
                fluidRow(
                  infoBoxOutput('TotalRevenue'),
                  infoBox('TotalRevenue', 200, icon= icon('fire')),
                  box(plotOutput("histogram"))
                  
                ),
                fluidRow(
                  valueBoxOutput('Target')
                  
                )),
        tabItem(tabName= "Home",
                h1("Home Dashboard")
        ),
        tabItem(tabName= "Sales",
                h2("Sales Dashboard")
        ),
        tabItem(tabName= "Revenue",
                h3("Revenue Dashboard")
        ),
        tabItem(tabName= "RawData",
                h4("Raw Data Dashboard"),
                dataTableOutput("RawData")
        )
      )
      
    )
    
    
  )
)

