%$HeadURL$
% source('~/projects/rforge/sintro/pkg/sprof/R/barplot_s.R', chdir = TRUE)
\encoding{utf8}
\name{barplot_s}
\alias{barplot_s}
\title{Sorted Bar Plots}
\description{
  Creates a sorted bar plot with vertical or horizontal bars.}

\usage{
barplot_s(height, 
	sort_by, decreasing = TRUE, 
	lowtrim, hightrim, trimlegend = TRUE, 
	col, coli, colfun, 
	main, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
   \item{height}{either a vector or matrix of values describing the
    bars which make up the plot. See \code{\link{barplot}}.}
    \item{sort_by}{a variable to sort by. Defaults to \code{height}.}
  \item{decreasing}{boolean. Sorting direction.}
  \item{lowtrim}{A optional lower trim value. Observations with \code{sort_by} values up to \code{lowtrim} are discarded.}
  \item{hightrim}{A optional upper trim value. Observations with \code{sort_by} values from \code{lowtrim} are discarded.}  
  \item{trimlegend}{Boolean. Show a legend about trimmed values.}
  \item{col}{a vector of colors for the bars or bar components.
    By default, grey is used if \code{height} is a vector, and a
    gamma-corrected grey palette if \code{height} is a matrix.}
    
  \item{coli}{An index into the  \code{col} table, based on original sorting.}
  \item{colfun}{A function to generate a \code{col} palette. \code{grey} is rescaled to 1..n.}
  \item{main}{overall title for the plot}
  \item{\dots}{Passed to \code{barplot} 
}
}
\details{To come.
	Plots are from this collection:

\if{html}{\figure{barplots.png}}
\if{latex}{\figure{barplots.pdf}}

}
\value{Invisible: A data frame with components
  \item{\code{x}}{height}
  \item{\code{perm}}{the permutation applied}
  \item{coli}{the colour index applied}
  \item{col}{optional: the colours selected}
}
%\references{
%% ~put references to the literature/web site here ~
%}
\author{Günther Sawitzki <gsawitzki@r-forge.r-project.org>}

\note{Part of this could go to the \R base function \code{\link{barplot}}.}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
	\code{\link{barplot}}
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
x <- runif(10)

barplot_s(x)

rm(x)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{hplot}