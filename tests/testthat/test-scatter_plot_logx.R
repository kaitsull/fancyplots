library(gapminder)

#test that the function outputs a ggplot
test_that("Correct output obejct", {

  #save gapminder as a new variable
  data <- gapminder::gapminder
  #save the function output
  gap2 <- scatter_plot_logx(data, "pop", "year", verbose = FALSE)
  #ensure function output is a ggplot
  expect_is(gap2, "ggplot")
})


#test the inputs are correct
test_that("Correct inputs", {
  #saving variables
  data <- gapminder::gapminder
  x <- "pop"
  y <- "year"
  gap2 <- scatter_plot_logx(data, "pop", "year", verbose = FALSE)

  #data should be a dataframe
  expect_that(data, equals(gap2$data))
  expect_is(data, "data.frame")
  #inputs for x and y should be strings
  expect_is(x, "character")
  expect_is(y, "character")

})


#test that the function errors when input is incorrect
test_that("Correct errors", {

  #proper data input
  data <- gapminder::gapminder
  #improper data input
  data2 <- "Hi, nice to meet you"

  #proper x input
  x <- "pop"
  #improper x input(refers to a column of factors rather than numbers)
  x2 <- "country"

  #proper y input
  y <- "year"


  expect_error(scatter_plot_logx(data2, x, y, verbose = FALSE))
  expect_error(scatter_plot_logx(data, x2, y, verbose = FALSE))
})
