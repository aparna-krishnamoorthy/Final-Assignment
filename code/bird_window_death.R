#code for conducting hypothesis test on data. 
#Purpose: to find a relationship between the angle of windows 
#and the number of bird death

#remember to set your working directory to the "code" file 
#(Session --> Set working directory --> source file directory )

#read in files from raw data folder
birdData <- read.csv("../data/chap08q14BirdWindowCrash.csv")


#places data into a table
birdTable <- sort(table(birdData$angleDuringBirdCrash), decreasing = TRUE)

#organizes table by frequency
data.frame(Frequency = birdTable)

#remember to commit the x axis label
#exporting pdf to the results folder
pdf("../results/birdTableBarPlot.pdf")
barplot(birdTable, ylab = "Number of Deaths", xlab = "Angle of Window", cex.names = .5, las = 2, 
        main = "Frequency of Deaths at Each Window Angle",
        #colors the graph so there is a gradient
        col = c("#38CDFF" ,"#8DE2FF", "#E2F7FF"))
dev.off()

#chi-squared test
#save chi-squared test stats 
birdStat <- chisq.test(birdTable, y = NULL)
#outputs the stats into a txt file and saves in results folder
summaryStat <- capture.output(birdStat)
cat("results", summaryStat, file= "../results/summary.txt", 
    sep = "\n", append = FALSE)





