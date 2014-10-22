library(shiny)

shinyUI(fluidPage(
        titlePanel("Brazil Population Forecast"),
        sidebarLayout(
                sidebarPanel(
                        
                        # Title
                        h3("Population Forecast by State"),
                        h4("(6 more populous)"),
                        
                        # Slider for Year and Growth Rate
                        sliderInput("par_year","Years - Forecast",min=2015,max=2050,value=2020,step=1),
                        sliderInput("par_rate","Rate - Annual Growth",min=0,max=10,value=3,step=0.25)
                ),
                
                mainPanel(
                        plotOutput("BrazilPop")
                )
        )
))