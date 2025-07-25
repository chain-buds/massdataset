% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/methods-summarize_samples.R
\name{summarise_samples}
\alias{summarise_samples}
\alias{summarize_samples}
\alias{summarise_samples.mass_dataset}
\title{merge samples}
\usage{
summarise_samples(
  object,
  what = c("mean_intensity", "median_intensity", "sum_intensity"),
  group_by,
  ...
)

summarize_samples(
  object,
  what = c("mean_intensity", "median_intensity", "sum_intensity"),
  group_by,
  ...
)

\method{summarise_samples}{mass_dataset}(
  object,
  what = c("sum_intensity", "mean_intensity", "median_intensity"),
  group_by,
  ...
)
}
\arguments{
\item{object}{mass_dataset}

\item{what}{which you want to use}

\item{group_by}{summarize samples by}

\item{...}{other params}
}
\value{
mass_dataset
}
\description{
merge samples
}
\examples{
library(methods)

# Simulate expression matrix
expression_data <- data.frame(
  sample1 = c(1.2, 3.4),
  sample2 = c(2.1, 4.3),
  row.names = c("feature1", "feature2")
)

# Variable metadata
variable_info <- data.frame(
  variable_id = c("feature1", "feature2"),
  mz = c(100.1, 200.2),
  rt = c(300, 400),
  row.names = c("feature1", "feature2")
)

# Sample metadata
sample_info <- data.frame(
  sample_id = c("sample1", "sample2"),
  class = c("QC", "Subject"),
  row.names = c("sample1", "sample2")
)

# Sample info annotations
sample_info_note <- data.frame(
  name = c("sample_id", "class"),
  meaning = c("Unique sample ID", "Sample classification"),
  row.names = c("sample_id", "class")
)

# Variable info annotations
variable_info_note <- data.frame(
  name = c("variable_id", "mz", "rt"),
  meaning = c("Feature ID", "Mass-to-charge ratio", "Retention time"),
  row.names = c("variable_id", "mz", "rt")
)

# Empty slots
ms2_data <- list()
annotation_table <- data.frame()
process_info <- list()
other_files <- list()
version <- "1.0.0"
activated <- "expression_data"

# Construct mass_dataset object
object <- new(
  Class = "mass_dataset",
  expression_data = expression_data,
  ms2_data = ms2_data,
  annotation_table = annotation_table,
  sample_info = sample_info,
  variable_info = variable_info,
  sample_info_note = sample_info_note,
  variable_info_note = variable_info_note,
  process_info = process_info,
  other_files = other_files,
  version = version,
  activated = activated
)

# Summarize by 'class' using mean intensity
object2 <- summarise_samples(object, what = "mean_intensity", group_by = "class")

# Inspect summarized expression and sample information
head(extract_expression_data(object2))
head(extract_sample_info(object2))
}
