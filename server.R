library(shiny)
#source("helper.R")

gss <- read.csv("data/gss.csv")
#subet my data:
gss <- gss[,c(3,34:48)]

shinyServer(
        function(input,output) {
                
                vr1 <- reactive({input$var1})
                vr2 <- reactive({input$var2})
                yrr <- reactive({input$yr})
                gssyr <- reactive({gss[gss$year %in% yrr(),]})
                
                x <- reactive({switch(input$var1,
                            "Space Exploration Program" = 2,
                            "Improving And Protecting Environment" = 3,
                            "Improving And Protecting Nation's Health" = 4,
                            "Solving Problems Of Big Cities" = 5,
                            "Halting Rising Crime Rate" = 6,
                            "Dealing With Drug Addiction" = 7,
                            "Improving Nation's Education System" = 8,
                            "Improving The Conditions Of Blacks" = 9,
                            "Military, Armaments, and Defense" = 10,
                            "Foreign Aid" = 11,
                            "Welfare" = 12,
                            "Highways And Bridges" = 13,
                            "Social Security" = 14,
                            "Parks And Recreation"= 15,
                            "Mass Transportation" = 16)})
                
                y <- reactive({switch(input$var2,
                            "Space Exploration Program" = 2,
                            "Improving And Protecting Environment" = 3,
                            "Improving And Protecting Nation's Health" = 4,
                            "Solving Problems Of Big Cities" = 5,
                            "Halting Rising Crime Rate" = 6,
                            "Dealing With Drug Addiction" = 7,
                            "Improving Nation's Education System" = 8,
                            "Improving The Conditions Of Blacks" = 9,
                            "Military, Armaments, and Defense" = 10,
                            "Foreign Aid" = 11,
                            "Welfare" = 12,
                            "Highways And Bridges" = 13,
                            "Social Security" = 14,
                            "Parks And Recreation"= 15,
                            "Mass Transportation" = 16)})
                
                gst <- reactive({table(gssyr()[,y()],gssyr()[,x()])})
                gstp <- reactive({prop.table(gst())})
                
                output$text1 <- renderText({
                        paste("H0: Attidues on National Spending on",vr1(),
                              " and ",vr2(),"in the year",yrr(),"are independent 
                              of each other.")
                })
                
                output$text2 <- renderText({
                        paste("Ha: Attidues on National Spending on",vr1(),
                              " and ",vr2(),"in the year",yrr(),"are not independent 
                              of each other.")
                })

                output$mplot <- renderPlot({
                         
                         mosaicplot(gssyr()[,x()] ~ gssyr()[,y()],
                                   main = "",
                                   xlab = vr1(),ylab = vr2(),
                                   color = c(3,8,2),
#                                  shade = TRUE,
                                   cex.axis = 1.5,
                                   las = par(cex.lab=1.3))

                })
                
                output$table1 <- renderTable({
                        gstp() * 100
                })
                
                output$text3 <- renderPrint({
                        summary(gst())                         
                })
                
                output$text4 <- renderText({
                        if (summary(gst())$p.value > 0.05) 
                                paste("Based on the observed p-value we are unable 
                                      to reject the null hypothesis. Attidues on National Spending on",vr1(),
                                      " and ",vr2(),"in the year",yrr(),"are independent of each other.")
                        else 
                                paste("Based on the observed p-value we are must reject the null hypothesis in favor of the alternative. Attidues on National Spending on",vr1(),
                                      " and ",vr2(),"in the year",yrr(),"are not independent each other.")
                })
})