% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/FacileDataSet.R
\name{samples.FacileDataSet}
\alias{samples.FacileDataSet}
\title{Retrieves the sample identifiers for all samples in a FacileDataSet.}
\usage{
\method{samples}{FacileDataSet}(x, ...)
}
\arguments{
\item{x}{a \code{FacileDataSet}}
}
\value{
tibble of sample attributes
}
\description{
Sample identifiers are provided as \verb{dataset,sample_id tuples}.
}
\seealso{
Other API: 
\code{\link{fetch_assay_score.FacileDataSet}()},
\code{\link{fetch_custom_sample_covariates.FacileDataSet}()},
\code{\link{fetch_sample_covariates}()},
\code{\link{fetch_sample_statistics.FacileDataSet}()},
\code{\link{fetch_samples.FacileDataSet}()},
\code{\link{filter_features.FacileDataSet}()},
\code{\link{filter_samples.FacileDataSet}()},
\code{\link{organism.FacileDataSet}()}
}
\concept{API}
