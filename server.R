library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
        
        output$BrazilPop <- renderPlot({

                # Get date imputed in the sliders
                year <- c(2014:input$par_year)
                rate <- 1 + input$par_rate/100
                
                # Set the initial data - Source: IBGE - Brazil
                state <- as.character(c("São Paulo","Minas Gerais","Rio de Janeiro","Bahia","Rio Grande do Sul","Parana"))
                population <- as.numeric(c(44,20.7,16.4,15.1,11.2,11.8)) #Population in millions
                my_result <- NULL
                
                # Calculate growth for each State
                for (x in 1:length(state)) {
                        
                        # Reset the control dataset
                        my_pop <- NULL
                        my_pop <- population[x]
                        
                        # Calculate growth for each year
                        for (i in 1:(year[length(year)]-2014)) {
                                my_pop[i+1] <- my_pop[i] * rate
                        }
                        
                        # Join the result to the final dataset
                        my_pop <- data.frame(state[x],year,my_pop)
                        my_result <- rbind(my_result,my_pop)
                }
                
                # Set column name
                names(my_result) <- c("state","year","population")
                
                # Plot the final result
                # Year by Population - Group by State
                ggplot(data = my_result, aes(x=year,y=population)) + 
                        geom_line(aes(colour=state)) + ggtitle("") + 
                        xlab("Year") + ylab("Population (million)") + labs(colour="Brazil State")

        })
        
})