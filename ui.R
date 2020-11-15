#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(markovifyR)
library(shinythemes)

#source("markovify.R")

# Define UI for application that draws a histogram
shinyUI(fluidPage( theme = shinytheme("slate"),

    # Application title
    titlePanel("Magic Tool"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            textInput("text", h3("Word Input"), 
                      value = "Life Love")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            textOutput("selected_var")
        )
    )
))
