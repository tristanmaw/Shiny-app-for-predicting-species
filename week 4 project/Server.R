
library(shiny)
library(randomForest)

shinyServer(function(input, output){
  
  set.seed(100)
  df <- iris
  n <- nrow(df)
  sample_size <- round(n * 0.75,0)
    training <- df[sample(n),][1:sample_size,]
    

  modfit <- randomForest(Species ~., data = training)
  
  model_pred <- reactive({
    predict(modfit, newdata = data.frame(Sepal.Length = input$SepalLength, 
                                         Sepal.Width = input$SepalWidth, 
                                         Petal.Length = input$PetalLength, 
                                         Petal.Width = input$PetalWidth))
  })
  
  model_pred2 <- reactive({
    x <- as.data.frame(model_pred())
    rownames(x) <- ""
    colnames(x) <- ""
    x
  })
  
  
    output$prediction <- renderPrint({
    model_pred2()
  })
  
}
)



