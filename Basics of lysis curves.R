library(tidyverse)
library(ggplot2)
library(ggprism)
library(ggrepel)
Mcurve %>%
  #for a new lysis curve, import your data and then change the name
  # in line 5
  #also change the max y based on the data line 29
  pivot_longer(!Time, names_to= "sample", values_to= "OD") -> longdata
#pivot_longer makes the data more favorable to graph

print(longdata) #this will give you an output of what you did
#longdata %>% tail() 
ggplot(longdata, aes(x=Time, y=OD))+
  geom_line(
    aes(color=sample), 
    size=1.25,)+
  geom_point(aes(shape= sample),
             size=1.50,
             fill="black",
             na.rm=T)+
  theme_prism(border=T, palette = "colors")+
  scale_x_continuous(breaks=seq(0,max(longdata$Time),30), 
                     guide=guide_prism_minor(),
                     expand=c(0,0))+
#line 21 is changing the scale on the x-axis
# theme like prism plot, makes the plot black and white
# To comment on multiple lines, use crtl-shift-c
  scale_y_log10(limits=c(0.01,2.0))+
#to change the OD limits change the variables in line 29
#this is changing the y-axis to log scale.
#vignette("ggplot2-specs") will bring up a help page
# for aesthetic questions
  labs(x="Time (min)",
       y="A550") #this is changing the labels on the x and y axis
