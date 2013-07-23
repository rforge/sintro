#$HeadURL$
#$Id$
#$Date$
#$Author$
#$Revision$
#\encoding{utf8}
# setwd("")
# source('~/Documents/lectures/src/insider/profile/sprof/pkg/R/nodescloud.R', chdir = TRUE)
#! To Do
#!

nodescloud <- function(sprof,min.freq=3, col){
if (require(wordcloud)){
	wordcloud(sprof$nodes$name, freq = sprof$nodes$total.time,
		min.freq=min.freq, 
		random.order=FALSE,
		rot.per=0.3,
		colors = col[sprof$nodes$icol],
		ordered.colors=TRUE)
		} else {
			frame()
			legend("center","package wordcloud \n is required for this plot")}
	}