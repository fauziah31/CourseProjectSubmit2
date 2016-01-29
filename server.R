
library(shiny)
library(ggplot2)

fx <- function(x,y,z) {
  data <- diamonds
  tmp <- data[data$cut == x, ]
  tmp <- data[data$cut == x & data$color <= y & data$carat <= z, ]

  out <- summary(tmp$price)
  return (out)
}





shinyServer(
  function(input, output){
    output$price <- renderPrint(fx(input$cut, input$color, input$carat))

    formulaText <- reactive({
      paste("price ~", input$ID)
    })

    formulaTextPoint <- reactive({
      paste("price ~", "as.integer(", input$ID, ")")
    })


#     output$plot1 <- renderPlot ({
#
#
#
#        boxplot(price~input$ID,data=diamonds, main="Price of Diamonds based on Variable",
#                                           xlab=input$ID, ylab="Price")
#                })

    output$plot1 <- renderPlot({
      boxplot(as.formula(formulaText()),
              data = diamonds)

    })




})



