library(shiny)
require(markdown)

shinyUI(
  fluidPage(

    titlePanel("Price of Diamonds"),
    sidebarLayout(
      sidebarPanel(
        h3('Select the cut and color data'),
        h4("Variable:"),
        selectInput(inputId = "cut",label = "Quality of the Cut",selected = "Fair", choices = c("Fair" = "Fair","Good" = "Good",
                                                                                                "Very Good"="Very Good","Premium"="Premium","Ideal"="Ideal")),
        selectInput(inputId = "color",label = "Color (J (Worst) - D (Best))", selected = "J", choices = c("J" = "J","I" = "I","H" = "H",
                                                                                                          "G"= "G","F"="F","E"="E","D"="D")),
        numericInput('carat','Carat (0.2 - 5.01): ',0.5,min = 0.2,max = 5.01,step = 0.5),

        h3("Select variable for boxplot"),

        radioButtons("ID", label= "Variable:", choices = c("cut"= "cut","color"= "color"))),

        mainPanel(
          tabsetPanel(
            tabPanel("Summary",
                     mainPanel(
                       h3("Summary measures for Price"),
                       verbatimTextOutput("price")

                     )
            ),


            tabPanel("Plot",
                     mainPanel(
                       h3("Boxplot"),
                       plotOutput("plot1")
                     )
            )



        )
      )

    ))
)
