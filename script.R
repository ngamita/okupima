# Richard Ngamita
# ngamita@gmail.com
# General scripts for the PiMaa dashboards. 

# TODO: Always run the mysql_connect.R to get the DF 

head(df)


# http://stackoverflow.com/questions/3777174/plotting-two-variables-as-lines-using-ggplot2-on-the-same-graph
# 
ggplot(df, aes(x=(timestamp), y=value, colour=description)) +
  geom_line()


set.seed(1234)
dat <- data.frame(cond = factor(rep(c("A","B"), each=200)), 
                  rating = c(rnorm(200),rnorm(200, mean=.8)))
# df 
test_data <-
  data.frame(
    var0 = 100 + c(0, cumsum(runif(49, -20, 20))),
    var1 = 150 + c(0, cumsum(runif(49, -10, 10))),
    date = seq(as.Date("2002-01-01"), by="1 month", length.out=100)
  )

ggplot(test_data, aes(date)) + 
  geom_line(aes(y = var0, colour = "var0")) + 
  geom_line(aes(y = var1, colour = "var1"))



# Overlaid histograms
ggplot(df, aes(x=value, fill=description)) +
  geom_histogram(binwidth=.5, alpha=.5, position="identity")





library(ggplot2)
library(tidyr)

test_data <-
  data.frame(
    var0 = 100 + c(0, cumsum(runif(49, -20, 20))),
    var1 = 150 + c(0, cumsum(runif(49, -10, 10))),
    date = seq(as.Date("2002-01-01"), by="1 month", length.out=100)
  )

test_data %>%
  gather(key,value, var0, var1) %>%
  ggplot(aes(x=date, y=value, colour=key)) +
  geom_line()




library("reshape2")
library("ggplot2")

test_data_long <- melt(test_data, id="date")  # convert to long format

ggplot(data=test_data_long,
       aes(x=date, y=value, colour=variable)) +
  geom_line()



library(ggplot2)
dfr <- data.frame(x = rlnorm(100, sdlog = 3))



