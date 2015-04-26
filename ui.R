library(shiny)

shinyUI(fluidPage(
        titlePanel("General Social Survey Visualizer"),
        h3("Quickly And Easily Identify Relationships Between Attitudes On National Spending"),
        
        sidebarLayout(
                sidebarPanel(
                        helpText("Select two variables and a year of interest below. 
                                 GSS Visualizer will create a mosaic plot showinrg 
                                 the proportional relationship between the attitudes 
                                 of those surveyed on two different topics. A mosaic 
                                 plot indicates the relationship between two (or more) 
                                 variables by creating boxes with areas proportional 
                                 to the whole plot which correspond to the proportion 
                                 of respondents. Below the plot is a proportion table 
                                 to show the percent values of the proportions depicted 
                                 in the plot. Then the app will calculate a Chi-Square 
                                 test of independence to determine at the 5% significance 
                                 level whether or not we can say the variables are 
                                 independent or each other, which suggests, based 
                                 on the available data, whether or not attitudes 
                                 on national spending for any two programs are related."),
                        
                        helpText("For example, the default variables show the relationship 
                                 between attitudes on national spending on the Space 
                                 Exploration Program and Improveing And Protecting 
                                 the Environment in the year 2012. The largest proportion 
                                 of those surveyed (26.7%) felt both that national 
                                 spending on the Space Exploration Program was About 
                                 Right, on Improving And Protecting The Environment 
                                 was Too Little."),
                        
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
                                    step = 2),
                        
                        h4("Hypothesis Test"),
                        helpText("Null Hypothesis: The two variables are independent 
                                 of each other."),
                        helpText("Alternative Hypothesis: The two variables are not 
                                 independent of each other.")
                ),
        
        mainPanel(
                textOutput("text1"),
                plotOutput("mplot",height = 600,width = 700),
                tableOutput("table1"),
                textOutput("text2"),
                textOutput("text3")
                )
        )
))