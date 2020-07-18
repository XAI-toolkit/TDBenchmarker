shinyServer(function(input, output) {
  output$ComboBoxProject <- renderMenu({
    selectInput(
      "ProjName",
      "",
      list(
        "Java"= c(
        ### Java ###
        # "arduino"="arduino",
        # "arthas"="arthas",
        # "azkaban"="azkaban",
        # "cayenne" = "cayenne",
        # "deltaspike" = "deltaspike",
        # "exoplayer"="exoplayer",
        # "fop" = "fop",
        # "gson"="gson",
        # "javacv"="javacv",
        # "jclouds" = "jclouds",
        # "joda-time"="joda-time",
        # "libgdx"="libgdx",
        # "maven" = "maven",
        # "mina" = "mina",
        # "nacos"="nacos",
        "opennlp" = "opennlp"
        #,
        # "openrefine"="openrefine",
        # "pdfbox" = "pdfbox",
        # "redisson"="redisson",
        # "RxJava"="RxJava",
        # "testng"="testng",
        # "vassonic"="vassonic",
        # "wss4j" = "wss4j",
        # "xxl-job" = "xxl-job",
        # "zaproxy" = "zaproxy"
        )
      #,
        
        # ### JavaScript ###
        # "JavaScript"=c(
        # "ace"="ace",
        # "angular.js"="angular.js",
        # "atom"="atom",
        # "bluebird"="bluebird",
        # "bower"="bower",
        # "brackets"="brackets",
        # "Chart.js"="Chart.js",
        # "exceljs"="exceljs",
        # "fabric.js"="fabric.js",
        # "jquery"="jquery",
        # "karma"="karma",
        # "Leaflet"="Leaflet",
        # "less.js"="less.js",
        # "moment"="moment",
        # "mongoose"="mongoose",
        # "mysql"="mysql",
        # "node"="node",
        # "pdf.js"="pdf.js",
        # "plotly.js"="plotly.js",
        # "pm2"="pm2",
        # "prettier"="prettier",
        # "sails"="sails",
        # "sequelize"="sequelize",
        # "webpack"="webpack",
        # "yarn"="yarn"
        # )
        ),
      selected = 1
      )
  }
  )
  
  output$NNCoef <- renderMenu({
    sliderInput(
      "NNCoef",
      label = NULL,
      min = 0.6,
      max = 1,
      value = 0.8,
      step=0.05
    )
  })
  BenchmarkResults <- reactive({
    if (input$ProjName == "arduino") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    else if (input$ProjName == "arthas") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    else if (input$ProjName == "azkaban") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    else if (input$ProjName == "cayenne") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    else if (input$ProjName == "deltaspike") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    else if (input$ProjName == "exoplayer") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    else if (input$ProjName == "fop") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    else if (input$ProjName == "gson") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    else if (input$ProjName == "javacv") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    else if (input$ProjName == "jclouds") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
   else if (input$ProjName == "joda-time") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    else if (input$ProjName == "libgdx") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
   
    else if (input$ProjName == "maven") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    else if (input$ProjName == "mina") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    else if (input$ProjName == "nacos") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    else if (input$ProjName == "opennlp") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    else if (input$ProjName == "openrefine") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    else if (input$ProjName == "pdfbox") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    
    else if (input$ProjName == "redisson") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    else if (input$ProjName == "RxJava") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    else if (input$ProjName == "testng") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    else if (input$ProjName == "vassonic") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    else if (input$ProjName == "wss4j") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    else if (input$ProjName == "xxl-job") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    else if (input$ProjName == "zaproxy") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    
    
    ### JavaScript
    
    else if (input$ProjName == "ace") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    else if (input$ProjName == "angular.js") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    else if (input$ProjName == "atom") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    
    else if (input$ProjName == "bluebird") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    else if (input$ProjName == "bower") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    else if (input$ProjName == "brackets") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    else if (input$ProjName == "Chart.js") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    else if (input$ProjName == "exceljs") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    else if (input$ProjName == "fabric.js") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    else if (input$ProjName == "jquery") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    else if (input$ProjName == "karma") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    else if (input$ProjName == "Leaflet") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    else if (input$ProjName == "less.js") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    else if (input$ProjName == "moment") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    else if (input$ProjName == "mongoose") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    else if (input$ProjName == "mysql") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    else if (input$ProjName == "node") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    else if (input$ProjName == "pdf.js") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    else if (input$ProjName == "plotly.js") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    else if (input$ProjName == "pm2") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    else if (input$ProjName == "prettier") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    else if (input$ProjName == "sails") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    else if (input$ProjName == "sequelize") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    else if (input$ProjName == "webpack") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    else if (input$ProjName == "yarn") {
      BenchmarkClasses(AttachedWorkspace=input$ProjName,
                       Threshold=input$NNCoef)
    }
    
    
    
    
    }
    )
                                      
  
  output$NoClasses <- renderInfoBox({
    validate(need(input$ProjName,
                  "Please Wait"))
    infoBox(
      "Number of Classes",
      BenchmarkResults()$NoClasses,
      color = "aqua",
      icon = icon("list")
      
    )
  })
  
  output$NoClassesWorst <- renderInfoBox({
    validate(need(input$ProjName,
                  "Please Wait"))
    infoBox(
      "Number of Classes close to Max-Ruler",
      BenchmarkResults()$NoClassesWorst,
      BenchmarkResults()$PercNearWorst,
      color = "aqua",
      icon = icon("info-circle")
      
    )
  })
  
  output$KendallEstimate <- renderInfoBox({
    validate(need(input$ProjName,
                  "Please Wait"))
    infoBox(
      "Kendall's Coefficient of Concordance",
      BenchmarkResults()$KendallEstimate,
      BenchmarkResults()$KendallPValue,
      color = "aqua",
      icon = icon("info-circle")
      
    )
  })
  
  
  output$RSSplot <- renderPlotly ({
    validate(need(input$ProjName,
                  "Please Wait"))
    BenchmarkResults()$RSSplot})
  
  output$AchetypeProfilePlot <- renderPlotly ({
    validate(need(input$ProjName,
                  "Please Wait"))
    BenchmarkResults()$AchetypeProfilePlot})
  
  output$NearWorst <- renderDataTable(
                 BenchmarkResults()$NearWorst,
                 rownames = FALSE,
                 options = list(
                   searching = FALSE,
                   paging = FALSE,
                   info = FALSE
                 )
                 )
  
  
  output$downloadData <- downloadHandler(
    
    filename = function() {
      paste(input$ProjName, ".csv", sep="")
    },
    content = function(file) {
      write.csv(BenchmarkResults()$NearWorst, file)
    }
  )
  }
)