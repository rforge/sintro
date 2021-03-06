#$HeadURL$
#$Id$
#$Revision$
#$Date$
#$Author$

# source('~/projects/rforge/sintro/pkg/sprof/tests/igraphKK.R', chdir = TRUE)

# setwd("")
#! To Do
#!
library(sprof)
if (require("igraph")) {
	
data(sprof01lm)
sprof <- sprof01lm

as_igraph_sprof <- function(sprof, layoutfun, params=NULL,...){
	adj <- adjacency(sprof)
	adj[adj!=0] <-1
	sprof_igraph <- graph.adjacency(adj)
	sprof_igraph <- set.graph.attribute(sprof_igraph, "layout", 
		layoutfun(sprof_igraph,params=params,...),...)
	V(sprof_igraph)$color <- "yellow"
	V(sprof_igraph)$shape <- "circle"
	#V(sprof_igraph)$size <- 15
	V(sprof_igraph)$size2 <- 12
	E(sprof_igraph)$color <- "#0000FF40"
	E(sprof_igraph)$width <- c(1,5,10)
	return(sprof_igraph)
}

# see 
#<<fig=TRUE, label=sprof_igraphkamada,width=8, height=8>>=
sprof_ig_auto <- as_igraph_sprof(sprof, layout.auto)
plot(sprof_ig_auto, 
	main=paste0("igraph auto layout\n", sprof$info$id))
	legend("topleft", 
		legend= paste0("class: ",class(sprof_ig_auto)),
		bg="#FFFFE040",
		seg.len=0
		)
		
		
} else warning("could not load igraph", immediate=TRUE)
