
#' Create pair histograms.
#'
#' @description The present function is used to compare the frequency of marks
#' along a specific bone axis recorded in two different samples. 
#'
#' @param group_1 A pp3 object containing a 3D point pattern.
#' @param group_2 A pp3 object containing a second 3D point pattern.
#' @param sample_1_name A string to define the label of \code{group_1}.
#' @param sample_2_name A string to define the label of \code{group_2}.
#' @param dimension A character to define the axis; "x" refers to the proximodistal axis,
#' "y" to the mediolateral axis, and "z" to the craniocaudal axis.
#' @param bone_type A string to define the element; possible bones are "femur",
#' "humerus", "metacarpus", "radius", "tibia, and "metatarsus".
#' @param create_external_plot A boolean TRUE or FALSE option (default = FALSE)
#' to create a popup window with the plot for the distribution of both samples.
#'
#' @return A list containing the number of breaks and counts for both samples,
#' and a plot for the visual comparison of the mark frequencies along the selected axis.
#'
#' @seealso \code{\link{wavelet_analysis}}, \code{\link{sm.density.compare}}.
#'
#' @author Lloyd A.courtenay
#'
#' @section Bibliography:
#' Bowman, A.W. and Azzalini, A. (1997). Applied Smoothing Techniques for Data
#' Analysis: the Kernel Approach with S-Plus Illustrations. Oxford University Press, Oxford.
#'
#' @examples
#' data("femur_right_circular1")
#' data("femur_right_linear1")
#' example_data1 <- load_marks(femur_right_circular1, mark_type = "circular")
#' example_data2 <- load_marks(femur_right_linear1, mark_type = "linear")
#' example_sp_object1 <- extract_spatial_data(example_data1, "circular")
#' example_sp_object2 <- extract_spatial_data(example_data2, "circular")
#' example_time_series <- two_sample_histogram_distributions(
#'   example_sp_object1, example_sp_object2,"circular", "linear","x", "femur"
#' )
#' @export

two_sample_histogram_distributions <- function(
  group_1, group_2,
  sample_1_name, sample_2_name,
  dimension, bone_type,
  create_external_plot = FALSE
) {

  `%!in%` = Negate(`%in%`)

  if(missing(group_1) | missing(group_2)) {
    stop(
      "This function is for the comparison of two samples, yet only one has been provided"
    )
  } else if (class(group_1)[1] != "pp3" | class(group_2)[1] != "pp3") {
    stop("Invalid spatial object")
  }

  if(missing(sample_1_name)) {
    stop("Missing sample 1 name")
  } else {
    sample_1_name <- as.character(sample_1_name)
  }

  if(missing(sample_2_name)) {
    stop("Missing sample 2 name")
  } else {
    sample_2_name <- as.character(sample_2_name)
  }

  if (!is.logical(create_external_plot)) {
    stop("create_external_plot must be either TRUE or FALSE")
  }

  possible_dimensions <- c("x","y","z")

  if(missing(dimension)) {
    stop("The dimension under study must be specified")
  } else if (dimension %!in% possible_dimensions) {
    stop("Please choose 'x', 'y' or 'z' as a possible dimension")
  }

  possible_bones <- c("femur","humerus","metacarpus","radius",
                      "tibia","metatarsus")

  if(missing(bone_type)) {
    stop("The user must specify the bone under study")
  } else if (bone_type %!in% possible_bones) {
    stop("Invalid bone type")
  }

  if (dimension == "x") {
    group_1_coords <- as.data.frame(group_1$data[,1])
    group_2_coords <- as.data.frame(group_2$data[,1])
  } else if (dimension == "y") {
    group_1_coords <- as.data.frame(group_1$data[,2])
    group_2_coords <- as.data.frame(group_2$data[,2])
  } else {
    group_1_coords <- as.data.frame(group_1$data[,3])
    group_2_coords <- as.data.frame(group_2$data[,3])
  }

  if (bone_type == possible_bones[1]) { # femur
    if (dimension == "x") {
      x_lim = c(0,300)
      breaks = seq(x_lim[1], x_lim[2], 10)
    } else if (dimension == "y") {
      x_lim = c(0,85) # 85
      breaks = seq(x_lim[1], x_lim[2], 3)
    } else {
      x_lim = c(0,85)
      breaks = seq(x_lim[1], x_lim[2], 3)
    }
  } else if(bone_type == possible_bones[2]) { # humerus
    if (dimension == "x") {
      x_lim = c(0,300)
      breaks = seq(x_lim[1], x_lim[2], 10)
    } else if (dimension == "y") {
      x_lim = c(0,85) # 85
      breaks = seq(x_lim[1], x_lim[2], 3)
    } else {
      x_lim = c(0,85)
      breaks = seq(x_lim[1], x_lim[2], 3)
    }
  } else if(bone_type == possible_bones[3]) { # metacarpus
    if (dimension == "x") {
      x_lim = c(0,300)
      breaks = seq(x_lim[1], x_lim[2], 10)
    } else if (dimension == "y") {
      x_lim = c(0,70) # 85
      breaks = seq(x_lim[1], x_lim[2], 3)
    } else {
      x_lim = c(0,70)
      breaks = seq(x_lim[1], x_lim[2], 3)
    }
  } else if(bone_type == possible_bones[4]) { # radius
    if (dimension == "x") {
      x_lim = c(0,350)
      breaks = seq(x_lim[1], x_lim[2], 10)
    } else if (dimension == "y") {
      x_lim = c(0,85) # 85
      breaks = seq(x_lim[1], x_lim[2], 3)
    } else {
      x_lim = c(0,95)
      breaks = seq(x_lim[1], x_lim[2], 3)
    }
  } else if(bone_type == possible_bones[5]) { # tibia
    if (dimension == "x") {
      x_lim = c(0,350)
      breaks = seq(x_lim[1], x_lim[2], 10)
    } else if (dimension == "y") {
      x_lim = c(0,90) # 85
      breaks = seq(x_lim[1], x_lim[2], 3)
    } else {
      x_lim = c(0,85)
      breaks = seq(x_lim[1], x_lim[2], 3)
    }
  } else { # metatarsus
    if (dimension == "x") {
      x_lim = c(0,300)
      breaks = seq(x_lim[1], x_lim[2], 10)
    } else if (dimension == "y") {
      x_lim = c(0,80) # 85
      breaks = seq(x_lim[1], x_lim[2], 3)
    } else {
      x_lim = c(0,80)
      breaks = seq(x_lim[1], x_lim[2], 3)
    }
  }

  group_1_coords$Sample <- rep(sample_1_name, nrow(group_1_coords))
  group_2_coords$Sample <- rep(sample_2_name, nrow(group_2_coords))
  comparison <- rbind(group_1_coords, group_2_coords)
  comparison$Sample <- as.factor(comparison$Sample)

  if (create_external_plot == TRUE) {
    dev.new(); sm::sm.density.compare(comparison[,1],
                                  comparison$Sample,
                                  xlim = x_lim,
                                  col = c("black", "red"),
                                  lwd = 2,
                                  xlab = paste(
                                    toupper(dimension), " Axis", sep = ""
                                  ))
  } else {
    sm::sm.density.compare(comparison[,1],
                           comparison$Sample,
                           xlim = x_lim,
                           col = c("black", "red"),
                           lwd = 2,
                           xlab = paste(
                             toupper(dimension), " Axis", sep = ""
                           ))
  }

  title(main = paste(
    "Comparison between: ", sample_1_name, " and ", sample_2_name, sep = ""
  ))
  legend("topleft", levels(as.factor(comparison$Sample)),
         fill = c("black", "red"), inset = 0.05)

  group_1_counts <- hist(group_1_coords[,1], plot = FALSE, breaks = breaks)$counts
  group_2_counts <- hist(group_2_coords[,1], plot = FALSE, breaks = breaks)$counts
  freq_breaks <- seq(1, length(group_1_counts))
  time_series_1 <- cbind(freq_breaks, group_1_counts)
  time_series_2 <- cbind(freq_breaks, group_2_counts)

  return(list(first_sample_ts = time_series_1,
              second_sample_ts = time_series_2))

}
