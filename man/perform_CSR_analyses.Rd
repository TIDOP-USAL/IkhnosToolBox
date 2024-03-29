% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/perform_CSR_analyses.R
\name{perform_CSR_analyses}
\alias{perform_CSR_analyses}
\title{Spatial analysis on 3D point patterns.}
\usage{
perform_CSR_analyses(
  spatial_object,
  n_permutations = 1000,
  create_external_plot = FALSE
)
}
\arguments{
\item{spatial_object}{A pp3 object containing the 3D point pattern.}

\item{n_permutations}{A positive, non-zero integer to define the number of
permutations (default = 1000, min n = 101).}

\item{create_external_plot}{A boolean TRUE or FALSE option (default = FALSE)
to create three popup windows with the plots for the four functions and their
respective square root versions.}
}
\value{
Plots for the output of the \code{K3est}, \code{F3est}, \code{G3est}
and \code{pcf3est} functions, and for the square root versions of the \code{K3est},
\code{F3est} and \code{G3est} functions.
}
\description{
The present function conducts spatial analyses on the
3D point patterns representing the marks using the \code{K3est},
\code{F3est}, \code{G3est} and \code{pcf3est} functions that, respectively,
estimate the K-function, the empty space function, the nearest-neighbour
distance distribution function, and the pair correlation function from a 3D
point pattern. Square root versions of the \code{K3est}, \code{F3est} and
\code{G3est} functions are included to stabilise variance if needed.
}
\section{Notes}{

Functions assume that point distribution is homogeneous and could therefore
inflate the identification of clustering patterns when inhomogeneous
distributions are present. Functions for inhomogeneous patterns are not
available for 3D point patterns yet.
}

\section{Bibliography}{

Baddeley, A.J, Moyeed, R.A., Howard, C.V. and Boyde, A. (1993) Analysis of a
three-dimensional point pattern with replication. Applied Statistics 42, 641-668.

Baddeley, A.J. and Gill, R.D. (1997) Kaplan-Meier estimators of interpoint
distance distributions for spatial point processes. Annals of Statistics 25, 263-292.

Borgefors, G. (1986) Distance transformations in digital images. Computer Vision,
Graphics and Image Processing 34, 344-371.

Chiu, S.N. and Stoyan, D. (1998) Estimators of distance distributions for spatial
patterns. Statistica Neerlandica 52, 239-246.

Hanisch, K.-H. (1984) Some remarks on estimators of the distribution function
of nearest neighbour distance in stationary spatial point patterns. Mathematische
Operationsforschung und Statistik, series Statistics 15, 409-412.

Ohser, J. (1983) On estimators for the reduced second moment measure of point
processes. Mathematische Operationsforschung und Statistik, series Statistics, 14, 63-71.

Ripley, B.D. (1977) Modelling spatial patterns (with discussion). Journal of
the Royal Statistical Society, Series B, 39, 172-212.
}

\examples{
data("femur_right_circular1")
example_data <- load_marks(femur_right_circular1, mark_type = "circular")
example_sp_object <- extract_spatial_data(example_data, "circular")
example_CSR_analyses <- perform_CSR_analyses(
  example_sp_object, n_permutations = 101
)
}
\seealso{
\code{\link{spatstat.explore}}, \code{\link{K3est}}, \code{\link{F3est}},
\code{\link{G3est}}, \code{\link{pcf3est}}
}
