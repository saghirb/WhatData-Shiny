shinyServer(function(input, output, session) {

  output$Datasets <- DT::renderDataTable(DT::datatable({
    req(input$selClasses, input$selPackages)
    
    if(isTruthy(input$selClasses) & isTruthy(input$selClasses)){
      Datasets <- all_ds %>%
        # filter(Classes %in% input$selClasses & 
        #          Package %in% input$selPackages) %>%
        filter(str_detect(Classes, input$selClasses) & 
                 Package %in% input$selPackages) %>%
        arrange(Package, Data_Orig, Classes)
    }
  }))  
  
})