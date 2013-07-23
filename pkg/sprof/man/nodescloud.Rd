%$HeadURL$
%$Id$
%$Date$
%$Author$
%$Revision$
\encoding{utf8}
\name{nodescloud}
\alias{nodescloud}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Nodescloud of nodes fromrpofile data}
\description{
Show the nodes from a profile, with class encoded as colour and frequency encoded as size.}
\usage{
nodescloud(sprof, min.freq = 3, col)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sprof}{A data structure as returned by  \code{\link{readRprof}}.}
  \item{min.freq}{Minimum frequency to be included.}
  \item{col}{A colour palette.}
}
\details{
Note: these figures may be ourdated. Please run the examples.

Plots are from this collection:

\if{html}{\figure{snodes01cloudcol.png}}
\if{latex}{\figure{snodes01cloudcol.pdf}}
}

\value{
	Used for the side effect of showing the plots.
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\author{Günther Sawitzki <gsawitzki@r-forge.r-project.org>}
\note{See the vignette of package \code{sprof}.}

%% ~Make other sections like Warning with \section{Warning }{....} ~
\examples{
	\dontrun{
 		data(sprof01lm)
 		nodescloud(sprof01lm) 
 	}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{hplot}