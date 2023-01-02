library(tidyverse) 
library(ggthemes) 

library(readr)
candy_data <- read_csv("Desktop/candy-data.csv")
View(candy_data)

library(readr)
candy_production <- read_csv("Desktop/candy_production.csv")
View(candy_production)

#First we need to set up our plot and add a layer of points
ggplot(data = candy_data, aes(x = sugarpercent, y = pricepercent)) +geom_point()

#And then add a fitted line

ggplot(data = candy_data, aes(x = sugarpercent, y = pricepercent)) +  geom_point() + geom_smooth(method = "lm")


# first we need to set up our plot
ggplot(data = candy_data, aes(x = sugarpercent, 
                                 y = pricepercent, 
                                 label = competitorname)) + #make sure to add the label aes!
  geom_point() + # then add a layer of points
  geom_smooth(method = "lm") + # and then add a fitted line
  geom_text() # and then add labels to the points

#Clear Version
ggplot(data = candy_data, aes(x = sugarpercent, 
                                 y = pricepercent, 
                                 label = competitorname)) +
  geom_point() + 
  geom_smooth(method = "lm") + 
  geom_text(check_overlap = T,
            vjust = "bottom", 
            nudge_y = 0.01, 
            angle = 30,
            size = 2 
  ) 



# first we need to set up our plot
ggplot(data = candy_data, aes(x = sugarpercent, 
                                 y = pricepercent, 
                                 label = competitorname
)) +
  geom_point() + # then add a layer of points
  geom_smooth(method = "lm") + # and then add a fitted line
  geom_text(check_overlap = T,# automatically reduce overlap (deletes some labels)
            vjust = "bottom", # adjust the vertical orientation
            nudge_y = 0.01, # move the text up a bit so it doesn't touch the points
            angle = 30,# tilt the text 30 degrees
            size = 2 # make the text smaller (to reduce overlap more)
  ) + # and then add labels to the points
  labs(title = "More sugary candies are more expensive", # plot title
       x = "Sugar content (percentile)", # x axis label
       y = "Price (percentile)" # y axis label
  )


# first we need to set up our plot
ggplot(data = candy_data, aes(x = sugarpercent, 
                                 y = pricepercent, 
                                 label = competitorname
)) +
  geom_smooth(method = "lm") + # and then add a fitted line
  geom_text(check_overlap = T,# automatically reduce overlap (deletes some labels)
            angle = 30,# tilt the text 30 degrees
            size = 2.5 # make the text smaller (to reduce overlap more)
  ) + # and then add labels to the points
  labs(title = "More sugary candies are more expensive", # plot title
       x = "Sugar content (percentile)", # x axis label
       y = "Price (percentile)" # y axis label
  )
# select out the columns that have the features of the candy (chocolate, caramel, etc.)
candyFeatures <- candy_data %>% select(2:10)
# make sure that these are booleans (logical)
candyFeatures[] <- lapply(candyFeatures, as.logical)

# make a bar plot
ggplot(candyFeatures, aes(x = chocolate)) + # set up the plot
  geom_bar() # add the barpot

ggplot(candyFeatures, aes(x = chocolate,
                          fill = caramel # map the fill color to caramel           
)) + # set up the plot
  geom_bar() # add the barpot

# make a bar plot
ggplot(candy_data, aes(x = chocolate,
                          fill = caramel # map the fill color to caramel           
)) + # set up the plot
  geom_bar(position = "dodge") + # add the barpot
  facet_wrap(c("caramel")) # put each level of "caramel" in a different facet


# make a bar plot
ggplot(candyFeatures, aes(x = chocolate,
                          fill = caramel # map the fill color to caramel
)) + # set up the plot
  geom_bar(position = "dodge", size = 2) + # add the barpot
  facet_wrap(c("caramel")) + # put each level of "caramel" in a different facet
  scale_fill_manual(values=c("#BBBBBB", # a nice, neuteral grey 
                             "#E69F00")) # a gold caramel color

# make a bar plot
ggplot(candy_data, aes(x = chocolate,
                          fill = caramel # map the fill color to caramel
)) + # set up the plot
  geom_bar(position = "dodge", size = 2) + # add the barpot
  facet_wrap(c("caramel")) + # put each level of "caramel" in a different facet
  scale_fill_manual(values=c("#BBBBBB", # a nice, neuteral grey 
                             "#E69F00")) + # a gold caramel color
  labs(title = "Chocolate candies are more likely to have caramel", # title
       x = "Is the candy chocolate?", # x axis
       y = "Count of candies") + # y axis
  theme(legend.position = c(0.9, 0.9), # move legend inside plot
        strip.background = element_blank(), # remove strip from top of facets
        strip.text.x = element_blank())  # remove text from top of facets

ggplot(data = candy_production, aes(x = observation_date, y = IPG3113N)) +
  geom_line() + # add a line chart
  geom_smooth() # add a smoothing function

linePlot <- ggplot(data = candy_production, aes(x = observation_date, y = IPG3113N)) +
  geom_line() + 
  geom_smooth() +
  labs(title = "Monthly candy production (US)",
       x = "", # making the axis label blank will remove it
       y = "As percent of 2012 production")

# plot with the Economist theme
linePlot + theme_economist()
# plot with the 538 theme
linePlot + theme_fivethirtyeight()
# plot with the theme based on Few (2001)
linePlot + theme_few()
# plot with the theme based on older Excel plots
linePlot + theme_excel()
