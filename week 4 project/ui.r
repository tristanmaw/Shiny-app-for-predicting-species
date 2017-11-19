## Shiny application to allow a user to enter plant information and get predicted species

library(shiny)

shinyUI(fluidPage(
  titlePanel("What species is this plant?"),
  sidebarLayout(
    sidebarPanel(
      sliderInput('SepalLength', 'Sepal Length',value = 5, min = 4, max = 8, step = 0.1),
      sliderInput('SepalWidth',  'Sepal Wigth',value = 3, min = 1, max = 5, step = 0.1),
      sliderInput('PetalLength', 'Petal Length',value = 5, min = 1, max = 7, step = 0.1),
      sliderInput('PetalWidth', 'Petal Width',value = 1, min = 0.1, max = 3, step = 0.1)
      #submitButton("Submit")
    ),
    mainPanel(
      h3("The predicted species is"),
      verbatimTextOutput("prediction")
      
    )
  )
))


    
    
    
    