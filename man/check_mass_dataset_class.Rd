% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/0-mass_dataset_class.R
\docType{methods}
\name{check_mass_dataset_class}
\alias{check_mass_dataset_class}
\title{Check the Validity of a mass_dataset Object}
\usage{
check_mass_dataset_class(object)
}
\arguments{
\item{object}{An object of class \code{mass_dataset}.}
}
\value{
Returns \code{TRUE} if the object is valid, otherwise returns a character vector of error messages.
}
\description{
This function checks the validity of a mass_dataset object.
It performs various checks on the object's slots to ensure they meet the required criteria.
}
\examples{
data("expression_data")
data("sample_info")
data("variable_info")
object <-
  create_mass_dataset(expression_data = expression_data,
                      sample_info = sample_info,
                      variable_info = variable_info)
  check_mass_dataset_class(object)
}
\author{
Xiaotao Shen
\email{shenxt1990@outlook.com}
}
