library(shiny)
data(iris)
iris <- iris
head(iris)
ui <- fluidPage(
  

  titlePanel("Shiny App Assignment"),
  

  sidebarLayout(
    

    sidebarPanel(
      

      sliderInput(inputId = "bins",
                  label = "sepal width",
                  min = 1,
                  max = 5,
                  value = 2)
      
    ),
    

    mainPanel(
      

      plotOutput(outputId = "distPlot"),
      plotOutput(outputId = "plot")
      
    )
  )
)

server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    
    x    <- iris$Sepal.Length
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "darkgray", border = "red",
         xlab = "sepal length",
         ylab = "sepal width",
         main = "Histogram of Irises")
    
  })
  output$plot <- renderPlot({
    plot(x=iris$Petal.Length, y=iris$Petal.Width)
  })
}
shinyApp(ui = ui, server = server)
