% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/processing-mass_dataset.R
\name{rbind_mass_dataset}
\alias{rbind_mass_dataset}
\title{Row-wise Binding of mass_dataset Objects}
\usage{
rbind_mass_dataset(x, y, deparse.level = 1)
}
\arguments{
\item{x}{A mass_dataset object. If missing, the function returns \code{y}.}

\item{y}{A mass_dataset object. If missing, the function returns \code{x}.}

\item{deparse.level}{Not used, for compatibility only.}
}
\value{
A new mass_dataset object that is the row-wise combination of \code{x} and \code{y}.
}
\description{
This function combines two mass_dataset objects by rows. It checks for
compatibility in terms of sample information, variable information, and other
attributes before performing the row-wise binding.
}
\examples{
library(magrittr)
# Create first mass_dataset object
expression_data_x <- data.frame(
  sample1 = c(1.1, 2.2, 3.3),
  sample2 = c(1.5, 2.5, 3.5),
  row.names = c("feature1", "feature2", "feature3")
)

sample_info_x <- data.frame(
  sample_id = c("sample1", "sample2"),
  batch = c(1, 1),
  age = c(30, 32),
  class = c("QC", "QC"),
  row.names = c("sample1", "sample2")
)

sample_info_note_x <- data.frame(
  name = colnames(sample_info_x),
  meaning = c("Sample ID", "Batch ID", "Age", "Sample Class"),
  row.names = colnames(sample_info_x)
)

variable_info_x <- data.frame(
  variable_id = c("feature1", "feature2", "feature3"),
  row.names = c("feature1", "feature2", "feature3")
)

variable_info_note_x <- data.frame(
  name = colnames(variable_info_x),
  meaning = "Feature ID",
  row.names = colnames(variable_info_x)
)

mass_x <- new(
  Class = "mass_dataset",
  expression_data = expression_data_x,
  sample_info = sample_info_x,
  sample_info_note = sample_info_note_x,
  variable_info = variable_info_x,
  variable_info_note = variable_info_note_x,
  ms2_data = list(),
  annotation_table = data.frame(),
  process_info = list(),
  other_files = list(),
  version = "1.0.0",
  activated = "expression_data"
)

# Create second mass_dataset object
expression_data_y <- data.frame(
  sample1 = c(1.3, 2.3, 3.4),
  sample2 = c(1.7, 2.7, 3.8),
  row.names = c("feature4", "feature5", "feature6")
)

sample_info_y <- data.frame(
  sample_id = c("sample1", "sample2"),
  batch = c(2, 2),
  age = c(31, 34),
  class = c("Subject", "Subject"),
  row.names = c("sample1", "sample2")
)

sample_info_note_y <- data.frame(
  name = colnames(sample_info_y),
  meaning = c("Sample ID", "Batch ID", "Age", "Sample Class"),
  row.names = colnames(sample_info_y)
)

variable_info_y <- data.frame(
  variable_id = c("feature4", "feature5", "feature6"),
  row.names = c("feature4", "feature5", "feature6")
)

variable_info_note_y <- data.frame(
  name = colnames(variable_info_y),
  meaning = "Feature ID",
  row.names = colnames(variable_info_y)
)

mass_y <- new(
  Class = "mass_dataset",
  expression_data = expression_data_y,
sample_info = sample_info_y,
  sample_info_note = sample_info_note_y,
  variable_info = variable_info_y,
  variable_info_note = variable_info_note_y,
  ms2_data = list(),
  annotation_table = data.frame(),
  process_info = list(),
  other_files = list(),
  version = "1.0.0",
  activated = "expression_data"
)

rbind_mass_dataset_object <- rbind_mass_dataset(mass_x, mass_y)

# View result
rbind_mass_dataset_object@expression_data

}
\author{
Xiaotao Shen \href{mailto:shenxt1990@outlook.com}{shenxt1990@outlook.com}
}
