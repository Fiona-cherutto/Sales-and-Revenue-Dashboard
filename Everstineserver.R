
#

library(shiny)
library(shinydashboard)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$histogram <- renderPlot({

        # generate bins based on input$bins from ui.R
      counts <- table(Analysis$location.title)
      hist(counts, main="Customer Distribution",xlab="location area",ylab = "Frequency",col="darkblue")
    })
    ##Revenue
    output$RawData <- renderDataTable(Analysis)
    
    output$TotalRevenue <- renderInfoBox({
      infoBox("TotalRevenue", sum(Analysis$amount_inc_vat), icon= icon("thumbs_up"))
    })
    ## Target
    output$Target <- renderDataTable(Analysis)
    
    output$Target <-  renderValueBox({
      infoBox("Taget", sum(Analysis$amount_inc_vat)*0.15, icon= icon('hourglass-3'))
    })
    
 
})


