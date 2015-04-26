library(shiny)

shinyUI(fluidPage(
        titlePanel("General Social Survey Visualizer"),
        h3("Quickly And Easily Identify Relationships Between Attitudes On National Spending"),
        
        sidebarLayout(
                sidebarPanel(
                        helpText("Select two variables and a year of interest below. 
                                 GSS Visualizer will create a mosaic plot using 
                                 the two selected variables. A mosaic plot shows 
                                 the proportional relationship between two (or more) 
                                 variables by creating boxes with areas proportional 
                                 to the total area of the whole plot. Below the plot 
                                 is a table showing the percent values of the proportions 
                                 depicted in the mosaic plot. Then the app calculates 
                                 a Chi-Square test of independence to determine 
                                 at the 5% significance level whether or not we 
                                 can say the two variables are independent of each 
                                 other."),
                        
                        helpText("For example, the default variables show the relationship 
                                 between attitudes on national spending on the Space 
                                 Exploration Program and Improveing And Protecting 
                                 the Environment in the year 2012. The largest proportion 
                                 of those surveyed (26.7%) felt both that national 
                                 spending on the Space Exploration Program was 'About 
                                 Right', and Improving And Protecting The Environment 
                                 was 'Too Little'."),
                        
                        selectInput("var1", label = "Choose One Variable",
                                    choices = list("Space Exploration Program",
                                                   "Improving And Protecting Environment",
                                                   "Improving And Protecting Nation's Health",
                                                   "Solving Problems Of Big Cities",
                                                   "Halting Rising Crime Rate",
                                                   "Dealing With Drug Addiction",
                                                   "Improving Nation's Education System",
                                                   "Improving The Conditions Of Blacks",
                                                   "Military, Armaments, and Defense",
                                                   "Foreign Aid",
                                                   "Welfare",
                                                   "Highways And Bridges",
                                                   "Social Security",
                                                   "Parks And Recreation",
                                                   "Mass Transportation"),
                                selected = "Space Exploration Program"),
                        
                        selectInput("var2", label = "Choose Another Variable",
                                    choices = list("Space Exploration Program",
                                                   "Improving And Protecting Environment",
                                                   "Improving And Protecting Nation's Health",
                                                   "Solving Problems Of Big Cities",
                                                   "Halting Rising Crime Rate",
                                                   "Dealing With Drug Addiction",
                                                   "Improving Nation's Education System",
                                                   "Improving The Conditions Of Blacks",
                                                   "Military, Armaments, and Defense",
                                                   "Foreign Aid",
                                                   "Welfare",
                                                   "Highways And Bridges",
                                                   "Social Security",
                                                   "Parks And Recreation",
                                                   "Mass Transportation"),
                                    selected = "Improving And Protecting Environment"),
                                        
                        numericInput("yr", label = "Year Of Interest:",
                                    min = 1994, max = 2012, value = 2012, 
                                    step = 2)
                        
#                         h4("Hypothesis Test")
#                         helpText("Null Hypothesis: The two variables are independent 
#                                  of each other."),
#                         helpText("Alternative Hypothesis: The two variables are not 
#                                  independent of each other.")
                ),
        
        mainPanel(
                h4("Hypothesis"),
                textOutput("text1"),
                textOutput("text2"),
                plotOutput("mplot",height = 600,width = 700),
                tableOutput("table1"),
                textOutput("text3"),
                textOutput("text4")
                )
        )
))