#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

#system("pip install markovify")


library(shiny)
library(markovifyR)
library(tidyverse)

#source("markovify.R")
quote <- readLines("quotes.txt")
markov_model <-
    generate_markovify_model(
        input_text = quote,
        markov_state_size = 2L,
        max_overlap_total = 25,
        max_overlap_ratio = .85
    )

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$selected_var <- renderText({
        t <- markovify_text(
            markov_model = markov_model,
            maximum_sentence_length = NULL,
            start_words = unlist(str_split(input$text," ")),
            output_column_name = 'val',
            count = 25,
            tries = 100,
            only_distinct = TRUE,
            return_message = FALSE
        )
        
        test <- unlist(t$val)
        test
        #t$val

    })

})
