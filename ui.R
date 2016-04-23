library(shiny)

shinyUI(pageWithSidebar(
        headerPanel('Word Predictor App'),
        sidebarPanel(
                h3('Context'),
                p('This application main function is to predict the next word given the provided sentence they typed before.'),
                p('The technique is mainly used in predictive keyboard functionalities in many mobile devices.'),
                h3('Methodology'),
                p('The prediction tool uses Katz Back-off model to predict the next word. This is a generative n-gram language model that estimates the conditional probability of a word given its history in the n-gram.'),
                p('It accomplishes this estimation by "backing-off" to models with smaller histories under certain conditions. Therefore, it will provide us the most reliable information about a given history to provide better results.'),
                h3('Guide'),
                p('To use the application, enter a sentence into the empty box and a suggested next word will be provided.')
        ),
        
        mainPanel(
                h3('Your sentence'),
                textInput("inputString", "Enter your sentence here: "),
                
                h3('Predicted'),
                verbatimTextOutput("prediction"),
                
                p('\uA9 Kenrick Setiobudi, 2016')

        )
)
)