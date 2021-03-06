% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/FacileDataSet.R
\name{FacileDataSet}
\alias{FacileDataSet}
\title{Instantiates a FacileDataSet object from disk.}
\usage{
FacileDataSet(
  path,
  data.fn = NULL,
  sqlite.fn = NULL,
  hdf5.fn = NULL,
  meta.fn = NULL,
  anno.dir = NULL,
  cache_size = 80000,
  db.loc = c("reference", "temporary", "memory"),
  ...
)
}
\arguments{
\item{path}{The path to the FacileData repository}

\item{data.fn}{A custom path to the database (probably don't mess with this)}

\item{sqlite.fn}{name of SQLite data file in FacileDataSet}

\item{hdf5.fn}{name of HDF5 data file in FacileDataSet}

\item{meta.fn}{name of metadata YAML data file in FacileDataSet}

\item{anno.dir}{A directory to house custom annotations/sample covariates}

\item{cache_size}{A custom paramter for the SQLite database}

\item{db.loc}{single character, location for the data}

\item{...}{other args to pass down, not used at the moment}

\item{covdef.fn}{A custom path to the yaml file that has covariate mapping info}
}
\value{
a \code{FacileDataSet} object
}
\description{
The \code{FacileDataSet} is a reference data storage implementation that
implements the \strong{FacileData Access API}. It facilitates the storage and
retrieval of large amounts of data by leveraging a SQLite database to store
sample- and feature-level metadata ("\code{pData}" and "\code{fData}"), and an HDF5
file to store all of the dense assay (matrix) data (gene counts, microarray
intensities, etc.) run over the samples.
}
\details{
A \code{FacileDataSet} is materialized on disk by a well-structured directory,
which minimally includes the following items:
\enumerate{
\item A \code{data.sqlite} SQLite database that stores feature and sample metadata
\item A \code{data.h5} HDF5 file that stores a multitude of dense assay matrices that
are generated from the assays performed on the samples in the
\code{FacileDataSet}.
\item A \code{meta.yaml} file tha contains informaiton about the \code{FacileDataSet}.
To better understand the structure and contents of this file, you can
refer to the following:
a. The included \code{testdata/expected-meta.yaml} file, which is an
exemplar file for \code{\link[=exampleFacileDataSet]{exampleFacileDataSet()}}.
b. The help file provided by the \code{\link[=eav_metadata_create]{eav_metadata_create()}} function, which
describes in greater detail how we track a dataset's sample-level
covariates (aka, "pData" in the bioconductor world).
In the meantime, a short description of the entries found in the
\code{meta.yaml} file is provded here:
\itemize{
\item \code{name}: the name of the dataset (ie. \code{"FacileTCGADataSet"})
\item \code{organism}: \code{"Homo sapiens"}, \code{"Mus musculus"}, ec.
\item \code{default_assay}: the name of the assay to use by default if none is
specified in calls to \code{\link[=fetch_assay_data]{fetch_assay_data()}}, \code{\link[=with_assay_data]{with_assay_data()}}, etc.
(kind of like how \code{"exprs"} is the default assay used when working with
a \code{Biobase::ExpressionSet})
\item \code{datasets}: a section tha enumerates the datases included internally.
The datasets are further enumerated.
\item \code{sample_covariates}: a section that enumerates the covariatets that
are tracked over the samples inside the \code{FacileDataSet} (ie. a mapping
of the \code{pData} for the samples). Reference \code{\link[=eav_metadata_create]{eav_metadata_create()}}
for more information.
}
\item A \code{custom-annotation} directory, which stores custom \code{sample_covariate}
(aka "pData") informaiton that analysts can identify and describe during
the course of an analysis, or even add from external sources. Although
this directory is required in the directory structure of a valid
\code{FacileDataSet}, the \code{FacileDataSet()} constructor can be called with
a custom \code{anno.dir} parameter so that custom annotations are stored
elsewhere.
}
}
\examples{
fn <- system.file("extdata", "exampleFacileDataSet", package = "FacileData")
fds <- FacileDataSet(fn)
}
\seealso{
Other FacileDataSet: 
\code{\link{dbfn}()},
\code{\link{hdf5fn}()},
\code{\link{meta_file}()}
}
\concept{FacileDataSet}
