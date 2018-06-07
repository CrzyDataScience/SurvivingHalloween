library(shiny)
library(RCurl)
library(rjson)

server <- function(input, output) {
  
  observeEvent(input$process, {
    
    age_group <- input$character_age_group
    sex <- input$character_sex
    profession <- input$profession_category
    siblings <- input$siblings
    partner <- input$partner
    body_type <- input$body_type
    
    options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))
    
    h = basicTextGatherer()
    hdr = basicHeaderGatherer()
    
    req =  list(
      Inputs = list(
        "input1"= list(
          list(
            'Character_age_group' = as.character(age_group),
            'Character_sex' = as.character(sex),
            'Profession_Category' = as.character(profession),
            'Siblings' = as.character(siblings),
            'Partner' = as.character(partner),
            'Body_type' = as.character(body_type)
          )
        )
      ),
      GlobalParameters = setNames(fromJSON('{}'), character(0))
    )
    
    body = enc2utf8(toJSON(req))
    
    api_key = "[ENTER API KEY HERE]" 
    authz_hdr = paste('Bearer', api_key, sep=' ')
    
    h$reset()
    curlPerform(url = "[ENTER WEB URL HERE]",
                httpheader=c('Content-Type' = "application/json", 'Authorization' = authz_hdr),
                postfields=body,
                writefunction = h$update,
                headerfunction = hdr$update,
                verbose = TRUE
    )
    
    headers = hdr$value()
    httpStatus = headers["status"]
    if (httpStatus >= 400)
    {
      print(paste("The request failed with status code:", httpStatus, sep=" "))
      
      # Print the headers - they include the requert ID and the timestamp, which are useful for debugging the failure
      print(headers)
    }
    
    result = h$value()
    resultJSON = data.frame(fromJSON(result), stringsAsFactors = FALSE)
    colnames(resultJSON) <- c("Character_age_group", "Character_sex", "Profession_Category", "Siblings", "Partner", "Body_type", "Prediction", "Probability")
    
    output$prediction <- renderText({
      resultJSON$Prediction
    })
    
  })
  
}