#Set working directory to where the data are
setwd("/Users/moritzdrupp/Dropbox/Discounting_Survey/Philosophers_paper/NCC_final/Replication package") #copy file path here
#setwd("C:\Users\cnx664\Dropbox\Discounting_Survey\Philosophers_paper\NCC_final\Replication package") #copy file path here

#read CSV file
data <- read.csv("Survey_data.csv")
data$Econ <- ifelse(data$Econ == 1,
                    "Economists",
                    "Philosophers")

#load required packages
install.packages("devtools")
library(ggplot2)
library(dplyr)
library(magrittr)
library(ungeviz)

data$Econ %<>% factor()
data$Econ %<>% relevel(ref = 2)

#generate plots
theme_set(theme_classic())

var_names <- c("puretp",
                  "eta",
                  "growthpc",
                  "SDR",
                  "realrfr",
                  "normative")
titles <- list("Pure time preference (in %)",
               "Elasticity of marginal utility",
               "Growth rate (in %)",
               "Social discount rate (in %)",
               "Risk-free interest rate (in %)",
               "Normative weight (in %)")

for (z in 1:length(var_names)){
ggplot(data = data, aes_string(y = var_names[z], x = "Econ", fill = "Econ")) + 
  geom_boxplot(outlier.shape = NA,
               coef = 0,
               width = .8, #width of boxplots
               fatten = 4) + #fatter median line
  geom_boxplot(aes(color = Econ),
               lwd = 1.5,
               coef = 0,
               width = .8, #width of boxplots
               fatten = NULL,
               outlier.shape = NA,
               fill = NA,
               show.legend = F) +
  coord_cartesian(ylim = c(0, ifelse(var_names[z] == "normative", 100, 3))) + #set range of values displayed
  stat_summary(fun = "mean", shape = 4, size = 3) + #include mean
  stat_summary(fun = "median", geom = "hpline", width = .81, size = 4) +
  labs(x = "", y = "", title = titles[z]) +
  theme(legend.position="none") +
  scale_color_manual(values = c("#ff0000", "#808080")) +
  scale_fill_manual(values = c("#ff0000", "white")) + #set colors using hexcodes
  theme(plot.title = element_text(size = 26, hjust = .5), #set text size
        axis.text = element_text(size = 26),
        axis.text.y = element_text(angle = 90, hjust= .5)) +
  scale_y_continuous(limits = c(0, 100), 
                     breaks = seq(0, 100, ifelse(var_names[z] == "normative", 10, .5))) #set y tick intervals

#save with custom image size
ggsave(paste0("BoxPlot_", var_names[z], ".pdf"),
       width = 6, #set image dimensions
       height = 10)
}
 