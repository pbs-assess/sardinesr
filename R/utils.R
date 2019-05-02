f <- function(x, dec.points = 0){
  ## Format x to have supplied number of decimal points
  ## Make thousands seperated by commas and the number of decimal points given by
  ##  dec.points
  format(round(x,dec.points), big.mark = ",", nsmall = dec.points)
}
