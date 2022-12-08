#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(shinydashboard)
library(ggplot2)
library(dplyr)
library(cowplot)
library(ggpubr)
ui <- dashboardPage(skin="green",
                    dashboardHeader(
                      title="Visual Analysis of Crop Production in Assam", titleWidth =450),
                    dashboardSidebar(
                      width=250,
                      sidebarMenu(
                        menuItem("About",tabName = "aboutmenu"),
                        menuItem('Plots', tabName = 'plotmenu'),
                        menuItem('Summary', tabName = 'summarymenu')
                      )
                    ),
                    dashboardBody(
                      tabItems(
                        tabItem("aboutmenu",
                                mainPanel(
                                  h1('Crop Production in Assam between 1997 & 2014'),
                                  img(src = 'Assam_agriculture.png'),
                                  p('Agriculture is one of the most important primary occupations in Assam. Around 80% of the population of Assam is directly or indirectly dependent on agriculture in some way or another. so, the economy, development, and many more important aspects of the people of Assam are somewhat related to the agricultural factors of Assam. 
Crop production in Assam depends on a large number of factors ranging from season type to Area of cultivation.', style = 'font-size:15px;'),
                                h4('We used the Crop Production in India Dataset for this project. Anyone willing to look into the dataset can access it through the link given below.'),
                                tags$a(href = 'https://www.kaggle.com/datasets/abhinand05/crop-production-in-india?select=crop_production.csv', 'https://www.kaggle.com/datasets/abhinand05/crop-production-in-india?select=crop_production.csv')
                                
                      
                        )),
                        tabItem('plotmenu',
                                tabsetPanel(
                                  tabPanel(
                                    h5('Crop Production in a year'),
                                    fluidPage(
                                      fluidRow(
                                        selectInput('mainselect', h4('Year'), choices = list(2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004),),
                                        plotOutput('mainplot')
                                      )
                                    )
                                  ),
                                  tabPanel(h5('Distribution of mean crop production over districts'),
                                           fluidPage(
                                             fluidRow(
                                               #sliderInput('Slider1', h4('Number of top producing Districts'),
                                                           #min = 3, max = 27, value = 5),
                                               selectInput('select1', h4('Crop Name'),
                                                           choices = list("Rice",                  "Arhar/Tur",             "Castor seed",           "Cotton(lint)",
                                                                          "Jute",                  "Maize",                 "Mesta",                 "Niger seed",
                                                                          "Sesamum",               "Small millets",         "Gram",                  "Linseed",
                                                                          "Masoor",                "Moong(Green Gram)",     "Other  Rabi pulses",    "Peas & beans (Pulses)",
                                                                          "Rapeseed &Mustard",     "Urad",                  "Wheat",                 "Banana",
                                                                          "Dry chillies",          "Onion",                 "Potato",                "Sugarcane",
                                                                          "Sweet potato",          "Tapioca",               "Tobacco",               "Turmeric",
                                                                          "Arecanut",              "Coconut ",              "Black pepper",          "Dry ginger",
                                                                          "Blackgram",             "Paddy",                 "Orange",                "Papaya",
                                                                          "Ginger",                "Pineapple",             "other misc. pulses"
                                                                          )),
                                              plotOutput("plot1"),
                                               
                                               plotOutput('plot2')
                                             )
                                           )
                                           ),
                                  tabPanel(h5('Distribution of Crop Production over the years'),
                                           fluidPage(
                                             fluidRow(
                                               checkboxGroupInput("checkgroup1", label = h3("Crop/ Crops:"), 
                                                                  choices = list("Rice",                  "Arhar/Tur",             "Castor seed",           "Cotton(lint)",
                                                                                 "Jute",                  "Maize",                 "Mesta",                 "Niger seed",
                                                                                 "Sesamum",               "Small millets",         "Gram",                  "Linseed",
                                                                                 "Masoor",                "Moong(Green Gram)",     "Other  Rabi pulses",    "Peas & beans (Pulses)",
                                                                                 "Rapeseed &Mustard",     "Urad",                  "Wheat",                 "Banana",
                                                                                 "Dry chillies",          "Onion",                 "Potato",                "Sugarcane",
                                                                                 "Sweet potato",          "Tapioca",               "Tobacco",               "Turmeric",
                                                                                 "Arecanut",              "Coconut ",              "Black pepper",          "Dry ginger",
                                                                                 "Blackgram",             "Paddy",                 "Orange",                "Papaya",
                                                                                 "Ginger",                "Pineapple",             "other misc. pulses"
                                                                  ),
                                                                  selected = 'Rice', inline = TRUE)
                                               
                                               ),
                                             plotOutput('plot3')
                                             
                                           )
                                           ),
                                  tabPanel(h5('Distribution of Crop Production over districts over the years'),
                                           fluidPage(
                                             fluidRow(
                                               checkboxGroupInput("checkgroup2", label = h3("Crop/ Crops:"), 
                                                                  choices = list("Rice",                  "Arhar/Tur",             "Castor seed",           "Cotton(lint)",
                                                                                 "Jute",                  "Maize",                 "Mesta",                 "Niger seed",
                                                                                 "Sesamum",               "Small millets",         "Gram",                  "Linseed",
                                                                                 "Masoor",                "Moong(Green Gram)",     "Other  Rabi pulses",    "Peas & beans (Pulses)",
                                                                                 "Rapeseed &Mustard",     "Urad",                  "Wheat",                 "Banana",
                                                                                 "Dry chillies",          "Onion",                 "Potato",                "Sugarcane",
                                                                                 "Sweet potato",          "Tapioca",               "Tobacco",               "Turmeric",
                                                                                 "Arecanut",              "Coconut ",              "Black pepper",          "Dry ginger",
                                                                                 "Blackgram",             "Paddy",                 "Orange",                "Papaya",
                                                                                 "Ginger",                "Pineapple",             "other misc. pulses"
                                                                  ),
                                                                  selected = 'Rice', inline = TRUE),
                                               selectInput('select2', h4('District Name:'),
                                                           choices = list("BAKSA",         "BARPETA",       "BONGAIGAON",    "CACHAR",        "CHIRANG",       "DARRANG",
                                                                          "DHEMAJI",       "DHUBRI",        "DIBRUGARH",     "DIMA HASAO",    "GOALPARA",      "GOLAGHAT",
                                                                          "HAILAKANDI",    "JORHAT",        "KAMRUP",        "KAMRUP METRO",  "KARBI ANGLONG", "KARIMGANJ",
                                                                          "KOKRAJHAR",     "LAKHIMPUR",     "MARIGAON",      "NAGAON",        "NALBARI",       "SIVASAGAR",
                                                                          "SONITPUR",      "TINSUKIA",      "UDALGURI"
                                                                          ))
                                               
                                             ),
                                             plotOutput('plot4')
                                             
                                           )
                                  ),
                                  tabPanel(h5('Distribution of Crops over seasons'),
                                           fluidPage(
                                             fluidRow(
                                               checkboxGroupInput("checkgroup3", label = h3("Crop/ Crops:"), 
                                                                  choices = list("Rice",                  "Arhar/Tur",             "Castor seed",           "Cotton(lint)",
                                                                                 "Jute",                  "Maize",                 "Mesta",                 "Niger seed",
                                                                                 "Sesamum",               "Small millets",         "Gram",                  "Linseed",
                                                                                 "Masoor",                "Moong(Green Gram)",     "Other  Rabi pulses",    "Peas & beans (Pulses)",
                                                                                 "Rapeseed &Mustard",     "Urad",                  "Wheat",                 "Banana",
                                                                                 "Dry chillies",          "Onion",                 "Potato",                "Sugarcane",
                                                                                 "Sweet potato",          "Tapioca",               "Tobacco",               "Turmeric",
                                                                                 "Arecanut",              "Coconut ",              "Black pepper",          "Dry ginger",
                                                                                 "Blackgram",             "Paddy",                 "Orange",                "Papaya",
                                                                                 "Ginger",                "Pineapple",             "other misc. pulses"
                                                                  ),
                                                                  selected = 'Rice', inline = TRUE),
                                               selectInput('select3', h4('District Name:'),
                                                           choices = list("BAKSA",         "BARPETA",       "BONGAIGAON",    "CACHAR",        "CHIRANG",       "DARRANG",
                                                                          "DHEMAJI",       "DHUBRI",        "DIBRUGARH",     "DIMA HASAO",    "GOALPARA",      "GOLAGHAT",
                                                                          "HAILAKANDI",    "JORHAT",        "KAMRUP",        "KAMRUP METRO",  "KARBI ANGLONG", "KARIMGANJ",
                                                                          "KOKRAJHAR",     "LAKHIMPUR",     "MARIGAON",      "NAGAON",        "NALBARI",       "SIVASAGAR",
                                                                          "SONITPUR",      "TINSUKIA",      "UDALGURI"
                                                           ))
                                               
                                             ),
                                             plotOutput('plot5')
                                             
                                           )
                                           )
                                )
                                ),
                        tabItem('summarymenu',
                                mainPanel(
                                  h3("Here is the basic summary we can derive about the project by analysing the plots:"),
                                 h4(tags$ol(
                                   tags$li('For most of the crops, Nagaon is one of the leading producers, followed by Sonitpur.'),
                                   tags$li('Most of the crops with high production, like rice are seasonal crops.'),
                                   tags$li('Coconut is the most produced crop in Assam between 1997 and 2010, but after that there is a drastic decrease in its production.'),
                                   tags$li('Rice as a whole is showing a consistently behaviour over the years, although the seasonal production of Rice in summer is decreasing over the years.'),
                                   tags$li('Nagaon being the leading producer of rice is very consistent about its production, but the seasonal production is drastically decreasing in the season of Autumn.'),
                                   tags$li('Wheat being a staple food after rice in Assam, has a decreasing trend in its production over the years.')
                                 ) 
                                ))
                                )
                      )
                    )
                    )
                    
# Define server logic required to draw a histogram

# df_grp_by_dist_rice = assam_data[assam_data$Crop == crop_name,] %>% group_by(District_Name) %>% summarise(t_production = mean(Production), .groups = 'drop')
# d = df_grp_by_dist_rice[order(df_grp_by_dist_rice$t_production, decreasing = TRUE),][1:n,]

server <- function(input, output) {
  assam_data = read.csv("Data/crop_production.csv")
  assam_data = assam_data[assam_data$State_Name == 'Assam',][,-c(1)]
  df_crop = reactive(assam_data[assam_data$Crop == input$select1 ,] %>%
                       group_by(District_Name) %>%
  summarise(t_production = mean(Production), .groups = 'drop'))
  
  df_crop1 = reactive(df_crop())#[1:input$slider1, ])
  
  df_Crop_year = assam_data %>% group_by(Crop_Year, Crop) %>% summarise(t_production = sum(Production), .groups = 'drop')
  df_crop_year_new = reactive(df_Crop_year[df_Crop_year$Crop_Year == input$mainselect,])
  df_Crop_year1 = reactive(df_Crop_year[df_Crop_year$Crop %in% input$checkgroup1, ])
  
  df_Crop_year2 = assam_data %>% group_by(Crop_Year, District_Name, Crop) %>% summarise(t_production = sum(Production), .groups = 'drop')
  
  df_crop2 = reactive(df_Crop_year2[df_Crop_year2$Crop %in% input$checkgroup2 & df_Crop_year2$District_Name == input$select2,])
  
  df_crop_season = assam_data %>% group_by(District_Name, Crop_Year,Season, Crop) %>% summarise(t_production = sum(Production), .groups = 'drop')
  
  df_crop_season1 = reactive(df_crop_season[df_crop_season$District_Name == input$select3 & df_crop_season$Crop %in% input$checkgroup3,])
  
  output$plot1 = renderPlot(
    
    ggplot(df_crop1())+
    aes(x = District_Name , y= t_production)+
    geom_bar(stat = 'identity', fill = 'dark green' )+
      theme(axis.text.x =element_text(angle = 90), axis.text.y =element_text(angle = 90, size = 6))+
    labs(x = 'District Name', y = 'Mean Production')
    )
  
  output$plot2 = renderPlot(
    
    ggplot(data = df_crop1())+
      aes(x = '', y= t_production, fill = District_Name)+
      geom_bar(stat = 'identity')+
      coord_polar('y', start = 0 )+
      theme(legend.key.size = unit(0.1,'cm'))+
      labs(x = '', y='')
    
  )
  
  output$plot3 = renderPlot(
    ggplot(data = df_Crop_year1())+
      aes(x = Crop_Year, y= log(t_production), color = Crop)+
      geom_line()+
      labs(title = 'Time vs Total Production(log)', x = 'Year', y = 'Total production(log)')
  )
  
  output$plot4 = renderPlot(
    ggplot(data = df_crop2())+
      aes(x = Crop_Year, y = log(t_production), color = Crop)+
      geom_line()+
      labs(title = 'Time vs Total Production(log)', x = 'Year', y = 'Total production(log)')
  )
  
  
  
  output$plot5 = renderPlot(ggplot(df_crop_season1())+
                              aes(x = Crop_Year, y= log(t_production), color = Crop)+
                              geom_line()+
                              labs(title = 'Time vs Seasonal Production(log)', x = 'Year', y = 'Seasonal production(log)') + facet_grid(.~Season))
    
  output$mainplot = renderPlot(ggplot(df_crop_year_new())+
                                 aes(x = Crop, y = log(t_production))+
                                 geom_bar(stat = 'identity', fill = 'light green')+
                                 theme(axis.text.x =element_text(angle = 90), axis.text.y =element_text(angle = 90, size = 6))+
                                 labs(x = 'Crop', y = 'log(Total Production)')
                                 )
}

# Run the application 
shinyApp(ui = ui, server = server)
