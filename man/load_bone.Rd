% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/load_bone.R
\name{load_bone}
\alias{load_bone}
\title{Load bone for visualisation.}
\usage{
load_bone(bone_data)
}
\arguments{
\item{bone_data}{An IkhnosToolBox data object (e.g., data(left_femur)) containing
the 3D model of the bone being studied.}
}
\value{
A 3D popup window with the selected bone mesh points.
}
\description{
The present function creates a 3D popup window visualising
the bone under study. This can then be combined with functions such as
\code{load_marks} to visualise marks on the 3D model, and
\code{save_3d_image} to save the window to a *.png file.
}
\examples{
data("right_femur")
data("femur_right_circular1")
data("femur_right_linear1")
load_bone(right_femur)
load_marks(femur_right_circular1, mark_type = "circular", plot = TRUE, colour_value = "black")
load_marks(femur_right_linear1, mark_type = "linear", plot = TRUE, colour_value = "red")
save_3d_image("my_first_plot")
}
\seealso{
\code{\link{load_marks}}, \code{\link{save_3d_image}},
\code{\link{plot3d}}, \code{\link{aspect3d}}
}
