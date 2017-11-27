shinyServer(function(input, output, session) {

  output$Datasets <- DT::renderDataTable(DT::datatable({
    req(input$selClasses, input$selPackages)
    
    if(isTruthy(input$selClasses) & isTruthy(input$selClasses)){
      # Datasets <- all_ds %>%
      #   filter(grepl(input$selClasses, Classes) & 
      #            Package %in% input$selPackages) %>%
      #   arrange(Package, Data_Orig, Classes)

      Datasets <- all_long %>% 
        filter(class %in% input$selClasses & Package %in% input$selPackages) %>%
        arrange(Package, Data_Orig, Classes) %>% 
        dplyr::select(-class) %>%
        distinct() %>% 
        arrange(Package, Data_Orig) 

          }
  }))  
  
})