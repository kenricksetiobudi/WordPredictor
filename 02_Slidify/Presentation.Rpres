Text Prediction
========================================================
author:  Kenrick Setiobudi
date: 24th of April, 2016

Objective
========================================================
The objective of the text predictor is to build a predictive text model, based on the concept of a smart keyboard that makes it easier for people to type on mobile devices.

This presentation is sub-divided into sections that encompasses the methodology, the data or corpus that is used to predict the next set of word, as well as the relevant link to the Text Predictor app.

The Text Predictor app is located in the following link with built-in instructions: 


Methodology
========================================================
The prediction tool uses Katz Back-off model to predict the next word. This is a generative n-gram language model that estimates the conditional probability of a word given its history in the n-gram, which uses the concept of Bayesian inference. 

It accomplishes this estimation by "backing-off" to models with smaller histories under certain conditions. Therefore, it will provide us the most reliable information about a given history to provide better results.


Corpus
========================================================
For the purpose of this exercise, a maximum of 4-gram is used to predict the next set of words. The corpora that is used is randomly selected from a compiled dataset ranging from Twitter, blogs and news. 10,000 tweets, 10,000 news articles and 10,000 blogs are used to support the application.

The datafile is located in this link: http://www.corpora.heliohost.org/aboutcorpus.html

Future Considerations
========================================================

* For simplicity purposes, a maximum of 4-gram is used. However, it might be useful to use higher grams (perhaps up to 6-gram).
* Using more than a set of 30,000 lines of data may help the accuracy of the model. The number of lines chosen here is to ensure that the model runs quick enough for demonstration purposes.
* Create a closed-loop system which adds the input of the app user back into the set of corpora for analysis may prove to be useful. This can be useful when developing an actual smart keyboard through a personalised prediction.
* There are other text predictive algorithms for consideration including Kneser-Ney smoothing which, similar to Katz back-off model, also uses a Bayesian approach.


