%$HeadURL$
\encoding{UTF-8}
\name{readRprof}
\alias{readRprof}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Read \code{\link{Rprof}} Output files and Stack Logs
}
\description{
Read a log of stack entries, such as the output of the \code{\link{Rprof}} function, and generate a more accessible representation.
}
\usage{
readRprof(filename = "Rprof.out", chunksize = 5000,
	interval = 0.02, 
	head = c("auto", "none", "Rprofmem"),
	 id = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
   \item{filename}{Name of a file produced by \code{Rprof()}.}
   \item{chunksize}{Number of lines to read at a time.}
   \item{interval}{Real number: time interval between samples, in s.
   Defaults to 0.02s for consistency with \code{Rprof}, 
   but shorter times should be used.}
   \item{head}{\code{c("auto", "none", "Rprofmem")} to interpret control information as provided by \code{Rprof} or \code{Rprofmem}. See details.}
   \item{id}{An optional identification  string. Defaults to filename and date.}
}
\details{
  This function reads a log file of stacks, one stack snapshot per line, stack entries separated by space.

  As profiling output file could be very large, it
  is read in blocks of \code{chunksize} lines.  Increasing \code{chunksize}
  will make the function run faster if sufficient memory is available.
  
  (This data structure is subject to change.)

  The input format is controlled by the \code{head} argument. Format \code{"auto"} tries to detect control lines as interspersed by \code{Rprof}. These lines are not included in the output.
 
 \code{"none"} ignores all control information and includes these lines as strange stacks.  
 
\code{"Rprofmem"} isolates headers as provided by  \code{Rprofmem}. \code{"Rprofmem"}  \code{new page} entries are encoded as \code{malloc} requests with length 0.
}
\value{
This data structure is subject to change.

Temporarily: A list with components
%\item{firstline}{A verbatim copy of the first line of the input file. 
%	Typically this contains timing or formatting information.}
\item{info}{Summary information.} 
\item{nodes}{A vector of node names. 
	This may include stray entries from interspersed lines.} 
\item{stacks}{Stacks, represented as reference list to nodes, and stack frequencies.}
\item{profiles}{Recorded data, as reference to stacks, and possibly additional data per reference.}

\code{nodes} is (conceptually) a data frame with entries
\tabular{ll}{name \tab node name\cr
self.time \tab nr of events with node as terminal leaf\cr
self.time \tab proportion of self.time with node as terminal leaf\cr
total.time \tab nr of events with node in stack\cr
self.time \tab proportion of total time with node as terminal leaf\cr
nr.runs \tab number of runs, over all run lengths and levels\cr
nr.runs \tab average of run length, over all run lengths and levels\cr
icol \tab current colour index
}

%{A vector of unique stacks found in input, stored as verbatim copies.}
%\item{stacksrenc}{A list of unique stacks in top down order (top first), 
%	encoded as vectors or references to \code{stacks}.}
%\item{data}{A vector encoding the data file as references to  \code{stacks}.}
%\item{timesRLE}{Vector of sampling intervals, in milliseconds. Run-length %encoded. defunct -- will be removed.}
%\item{freq}{A frequency table summarising \code{data}.} 

}

\references{  \url{http://sintro.r-forge.r-project.org/} }

\author{Günther Sawitzki <gsawitzki@users.r-forge.r-project.org>, based on the code of \code{\link{summaryRprof}}
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{summaryRprof}}

\code{\link{summaryRprof}}
 
%\code{\link[proftools]{ileData}} and 
\code{\link[proftools]{flatProfile}} in \code{library(proftools)}.

\code{\link[profr]{parse_rprof}} in \code{library(profr)}.
%\code{parse_rprof} in \code{library(profr)}.


The chapter on \dQuote{Tidying and profiling R code} in
  \dQuote{Writing \R Extensions} (see the \file{doc/manual} subdirectory
  of the \R source tree).

  
%\code{\link{ProfileData}} and  \code{\link{flatProfile}} in \code{library(proftools)}.
  
\code{\link{Rprof}} is a sampling profiler.

\code{\link{tracemem}} traces copying of an object via the C function  \code{duplicate}.

\code{\link{Rprofmem}} is a non-sampling memory-use profiler.

\url{http://developer.r-project.org/memory-profiling.html}
}
\examples{
\dontrun{
## Rprof() is not available on all platforms
profinterval <- 0.001
simruns <- 100

n <- 10000
x <- runif(n)
y0 <- 2+ 3 * x

sinknull <- textConnection(NULL, "w"); sink(sinknull)
Rprof(tmp <- tempfile(), interval = profinterval)
for (i in 1:simruns) {y <- y0 +  rnorm(n); xxx<- summary(lm(y~x))}
Rprof()

Rprof_out <- readRprof(tmp)

unlink(tmp)
sink(); close(sinknull)

str(Rprof_out)
}
}

\keyword{utilities}
