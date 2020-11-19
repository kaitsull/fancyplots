#' scatter_plot_logx: plotting a scatter plot with a logarithmically scaled x axis.
#' @importFrom ggplot2 ggplot aes_string geom_point theme_bw scale_x_log10
#'
#' @param data Dataframe or tibble.
#' @param x String containing the name of a column from data to be the x axis. All column values **must** be **_numeric_**.
#' @param y String containing the name of a column from data to be the y axis.
#' @param logx A logical (default = TRUE.)
#' @param verbose A logical (default = TRUE.)
#' @param na.omit A logical (default = TRUE.)
#'
#'
#' @return A ggplot scatter plot with the x axis logarithmically scaled.
#' @export
#'
#' @examples \dontrun{scatter_plot_logx(gapminder, "pop", "lifeExp")}


scatter_plot_logx <- function(data, x, y, logx = TRUE,
                              verbose = TRUE, na.omit = TRUE){

  #throw errors for incorrect data input
  if(!is.data.frame(data)) {stop("The provided data argument is not a data frame. Please provide a data frame or tibble.")
  }
  if(!is.character(x)){
    stop("Please input a string value for x.")
  }
  if(!is.character(y)){
    stop("Please input a string value for y.")
  }
  if(!(x %in% names(data))){
    stop("The provided x value is not a column within your dataframe.")
  }
  if(!(y %in% names(data))){
    stop("The provided y value is not a column within your dataframe.")
  }

  #omit NAs from data as a default
  if(na.omit == TRUE){
    if (verbose == TRUE)
      cat("Removing NA values from the data set... \n")
    na.omit(data)
  }

  if (verbose == TRUE){
    cat("Plotting columns", deparse(x), "vs ", deparse(y), "\n")
  }

  #save scatter plot
  p <- data %>%
    ggplot2::ggplot(aes_string(x = x, y = y))+
    geom_point() +
    theme_bw()

  #by default, logarithmically scale the x and y axis
  if(logx == TRUE){
    if(verbose == TRUE){paste("Logarithmically scaling...")
    }

    #throw an error if column x does not contain numbers
    if(!is.numeric(data[[x]])){stop("The provided x variable is non-numeric and cannot be logarithmically scaled.")
    }

    #save scaled plot
    p <- p +
      scale_x_log10()
  }

  #print the saved ggplot
  if (verbose == TRUE){
    cat("Printing plot... \n")
  }

  p
}
