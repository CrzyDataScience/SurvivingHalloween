library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Surviving Helloween"),
  
  sidebarPanel(
    
    selectInput("character_age_group", "Character age group:", 
                choices = c("Child", "Teenager", "Adult")),
    
    selectInput("character_sex", "Sex:", 
                choices = c("Male", "Female")),
    
    textInput("profession_category", "Profession group:", "Profession Group"),
    
    textInput("siblings", "Number of siblings:", 0),
    
    selectInput("partner", "Partner:", 
                choices = c("Yes", "No")),
    
    selectInput("body_type", "Body Type:", 
                choices = c("Slim", "Normal", "Heavy", "Muscular")),
    
    actionButton("process", "Predict!")
  ),
  
  
  # Show the caption, a summary of the dataset and an HTML table with
  # the requested number of observations
  mainPanel(
    
    h3("Are YOU going to meet a horrible end in Helloween?"),
    tags$i("Fill in your characteristics and click the Predict button to find out!"),
    hr(),
    
    h2(textOutput("prediction")),
    
    tags$i(textOutput("probability"))
    
  )
))