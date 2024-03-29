
#' Comparison of nearest neighbour distance matrices.
#'
#' @description The present function is used to calculate the nearest neighbour
#' distance within and between two samples.
#'
#' @param spatial_object_1 A pp3 object containing a 3D point pattern.
#' @param spatial_object_2 A pp3 object containing a second 3D point pattern.
#' @param name_1 A string to define the title of the plot that corresponds to
#' \code{spatial_object_1}.
#' @param name_2 A string to define the title of the plot that corresponds to
#' \code{spatial_object_2}.
#' @param create_external_plot A boolean TRUE or FALSE (default = FALSE) option
#' to create two popup windows with the plots of the distances between the marks
#' within and between each sample.
#'
#' @return Plots for the visualisation of the calculated nearest neighbour distances
#' between marks within and between samples.
#'
#' @seealso \code{\link{sp_distance_matrix}}, \code{\link{crossdist}},
#' \code{\link{nndist}}
#'
#' @section Bibliography:
#' A. Baddeley, E. Rubak and R.Turner. Spatial Point Patterns: Methodology and
#' Applications with R. Chapman and Hall/CRC Press, 2015.
#'
#' @examples
#' data("femur_right_circular1")
#' data("femur_right_linear1")
#' example_data1 <- load_marks(femur_right_circular1, mark_type = "circular")
#' example_data2 <- load_marks(femur_right_linear1, mark_type = "linear")
#' example_sp_object1 <- extract_spatial_data(example_data1, "circular")
#' example_sp_object2 <- extract_spatial_data(example_data2, "linear")
#' example_distance_matrices <- sp_distance_matrices(
#'   example_sp_object1, example_sp_object2,
#'   name_1 = "circular", name_2 = "linear"
#' )
#' @export

sp_distance_matrices <- function(spatial_object_1, spatial_object_2,
                              name_1, name_2,
                              create_external_plot = FALSE) {


  `%!in%` = Negate(`%in%`)

  if(missing(spatial_object_1) | missing(spatial_object_2)) {
    stop("No spatial objects have been defined.")
  }

  if("pp3" %!in% class(spatial_object_1) |
     "pp3" %!in% class(spatial_object_2)) {
    stop("Invalid spatial objects")
  }

  if (!is.logical(create_external_plot)) {
    stop("create_external_plot must be either TRUE or FALSE")
  }

  if(missing(name_1)) {
    stop("name_1 is missing")
  }
  if(missing(name_2)) {
    stop("name_2 is missing")
  }

  name_1 <- as.character(name_1)
  name_2 <- as.character(name_2)

  pd_1 <- spatstat.geom::nndist(spatial_object_1)
  pd_2 <- spatstat.geom::nndist(spatial_object_2)

  if(create_external_plot == TRUE) {
    dev.new(); par(mfrow = c(1,2))
  } else {
    par(mfrow = c(1,2))
  }

  plot(pd_1, pch = 19, xlab = "Nearest Neighbour Distance", ylab = "Index",
       main = paste("Distance between ", name_1, sep = ""))
  plot(pd_2, pch = 19, xlab = "Nearest Neighbour Distance", ylab = "Index",
       main = paste("Distance between ", name_2, sep = ""))
  par(mfrow = c(1,1))

  if(create_external_plot == TRUE) {
    dev.new(); par(mfrow = c(1,1))
  } else {
    par(mfrow = c(1,1))
  }

  cd <- spatstat.geom::nndist(
    spatstat.geom::crossdist(spatial_object_1, spatial_object_2)
  )

  plot(cd, pch = 19, xlab = "Nearest Neighbour Distance", ylab = "Index",
       main = paste("Distance Matrix between ", name_1, " and ", name_2, sep = ""))

}
