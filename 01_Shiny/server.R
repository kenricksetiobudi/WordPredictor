# Load the relevant packages
library(shiny)
library(stringr)
library(tm)

# Load the data
n1_gram <- readRDS("n1_gram_data.rds")
n2_gram <- readRDS("n2_gram_data.rds")
n3_gram <- readRDS("n3_gram_data.rds")
n4_gram <- readRDS("n4_gram_data.rds")

# Load the formula that both cleans the input and the string
predictNgrams <- function(text) {
        
        word <- gsub("[^a-zA-Z\n\']", " ", text)
        word <- tolower(word)
        trim <- function(x) return(gsub("^ *|(?<= ) | *$", "", x, perl=T))
        word <- trim(word)
        word <- VCorpus(VectorSource(word))
        word <- tm_map(word, content_transformer(tolower))
        word <- tm_map(word, removePunctuation)
        word <- tm_map(word, removeNumbers)
        word <- tm_map(word, stripWhitespace)
        word <- tm_map(word, removeWords, stopwords("english"))
        word <- as.character(word[[1]])
        wordinput <- word
        
        str <- unlist(str_split(word, " "))
        len <- length(str)
        back_off <- 0
        
        
        if (len >= 3){
                ngram <- paste(str[len-2], str[len-1], str[len])
                index <- grep(ngram, n4_gram$Search)
                hit <- length(index)
                gram_source <- n4_gram
                name_gram_source <- "4-gram"
                
                if (hit == 0){
                        back_off <- 1
                }
        }
                
        if (len == 2 | back_off == 1){
                ngram <- paste(str[len-1], str[len])
                index <- grep(ngram, n3_gram$Search)
                hit <- length(index)
                gram_source <- n3_gram
                name_gram_source <- "3-gram"
                back_off <- 0
                
                if (hit == 0){
                        back_off <- 1
                }
        }
        
        if (len ==1 | back_off == 1){
                ngram <- paste(str[len])
                index <- grep(ngram, n2_gram$Search)
                hit <- length(index)
                gram_source <- n2_gram
                name_gram_source <- "2-gram"
        }

        
        word <- gram_source[index,]
        word$Counts <- as.numeric(word$Counts)
        word <- word[max(word$Counts) == word$Counts,]
        word <- as.character(data.frame(word$Predict)[1:length(word$Predict),1])
        
        if (is.null(word) == TRUE){
                word <- sample(n1_gram[,1],1)
                name_gram_source <- "1-gram"
        }
        
        return(word)   
        #return(name_gram_source)

}

# Add shiny server here
shinyServer(function(input,output){
        
        nextword <- reactive({predictNgrams(input$inputString)})
        
        output$prediction <- renderPrint({
                nextword()
        })
        
        output$text1 <- renderText({
                paste("Enter your sentence here: ", input$inputString)
        })
        
}
)