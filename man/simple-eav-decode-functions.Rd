% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/entity-attribute-value.R
\name{eav_decode_real}
\alias{eav_decode_real}
\alias{eav_encode_real}
\alias{eav_encode_logical}
\alias{eav_decode_logical}
\alias{eav_encode_cSurv}
\alias{eav_decode_cSurv}
\alias{eav_decode_categorical}
\alias{eav_encode_categorical}
\title{Entity-attribute-value decoding for real values.}
\usage{
eav_decode_real(x, attrname = character(), def = list(), ...)

eav_encode_real(x, ...)

eav_encode_logical(x, ...)

eav_decode_logical(x, attrname = character(), def = list(), ...)

eav_encode_cSurv(x, ...)

eav_decode_cSurv(x, attrname = character(), def = list(), ...)

eav_decode_categorical(
  x,
  attrname = character(),
  def = list(),
  droplevels = TRUE,
  ...
)

eav_encode_categorical(x, ...)
}
\arguments{
\item{x}{the values column from the \code{EAV} table for this covariate}

\item{attrname}{the name of "attribute" (covariate) in the EAV table.}

\item{def}{the \code{covariate_definition} list for this covariate}
}
\value{
a \code{numeric} vector of \code{length(x)}
}
\description{
This is a simple function to handle converting numeric values in the EAV
table to numeric data in R.

This is essentially a pass through-function for categorical/character
values in the EAV table. If the \code{def} list contains a \code{levels} entry, then
the returned value is converted to a factor, with the levels in the order
as defined in \code{def$levels}. If more levels appear in \code{x} than exist in
\code{def$levels} they are appended to the end of the factor levels in
alphabetical order. If more levels are defined in \code{def$levels} than appear
in \code{x}, they are by default dropped, set \code{droplevels = FALSE} to keep them.
}
