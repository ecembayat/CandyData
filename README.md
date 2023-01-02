# CandyData Visualizing with ggplot2

The "gg" in "ggplot" stands for "the grammar of graphics". Plots in ggplot2 are "built up" using multiple functions connected with the plus sign (+). The first function, ggplot(), just draws the outline of the plot, including the the axes and tick marks. It takes two arguments: The dataset that you want to plot.
A function, aes(), short for aesthetic. This function can take multiple arguments, and each argument tells ggplot which variables in the dataset you want to be mapped to which part of the plot. By default, the first two arguments will be assigned to the x-axis and y-axis.
The ggplot() function itself doesn't actually plot anything, it just creates the outline of the plot. To actually plot something in that outline, we need to add a geom layer to our plot. There are lots of different geom layers (you can see a full list of them here) and you can add multiple layers to the same plot.

geom_point() makes a scatter plot, where each data point is represented by a point on the plot
geom_bar() makes a bar chart, where each bar shows the number of observations in a given category
geom_line() makes a line plot, where points are connected by a straight line

The CandydData dataset contains information about different candies, including how expensive they are and how much sugar is in them. In this data set, you can find the answer to whether there is a relationship between the price of a candy and the amount of sugar in it. We can use a scatterplot to see if this is the case.To make a scatterplot, we need to create a blank chart with mapping for both x and y aesthetics and then add a geom_point() layer.Scatter plots are great if you're looking at numeric variables (where the thing you're looking at can be measured with a number). But what if you're looking at something like whether one of your observations belongs to a certain group or not?

In this dataset, we have a lot of information about qualities each candy has. Does it contain chocolate? Is it fruit flavored? Is there caramel in the candy? These are what are called categorical variables, because a given candy candy belongs to one specific category.One of the most common ways of visualizing categorical data is to use a bar chart.

Bar chart: a data visualization with categories along the x axis and the count of observations from each category on the y axis.

In ggpolt2, we can make a bar chart using the layer geom_bar().

Line charts are most commonly used when you want to show how a measurement has changed over time. The time points are usually shown on the x axis while the value for the measurement is shown on the y axis. Each two adjacent points are connected with a line, hence the name. In ggplot2, you can make a line chart by adding the geom_line() layer.


