#' @title [ method
#' @description Subsetting method for mass_dataset using [ operator. This allows extracting rows (variables) and columns (samples) from the object.
#' @author Xiaotao Shen
#' \email{shenxt1990@@outlook.com}
#' @method [ mass_dataset
#' @param x x
#' @param i i
#' @param j j
#' @param drop drop
#' @param ... Other parameters
#' @export
#' @return mass_dataset
`[.mass_dataset` <-
  function(x, i, j, drop = FALSE, ...) {
    if (missing(i) & missing(j)) {
      return(x)
    }
    # browser()
    ####don't provide i
    if (!missing(i)) {
      if (is.character(i)) {
        i <- match(i, rownames(x@expression_data))
      }
    } else{
      i = seq_len(nrow(x@expression_data))
    }
    
    ####don't provide j
    if (!missing(j)) {
      if (is.character(j)) {
        j <- match(j, colnames(x@expression_data))
      }
    } else{
      j = seq_len(ncol(x@expression_data))
    }
    
    ####NA in j
    if (sum(is.na(j)) > 0) {
      j = j[!is.na(j)]
      if (length(j) == 0) {
        j = seq_len(ncol(x))
        warning("All sample index (j) are not in the object. Please check.")
      } else{
        warning("Some sample index (j) are not in the object. Please check.")
      }
    }
    
    ####if j is negative and some j is not in range
    if (j[1] < 0 & any(!abs(j) %in% seq_len(ncol(x)))) {
      warning("Some sample index (j) are not in the object. Please check.")
      j = j[j %in% -seq_len(ncol(x))]
    }
    
    ####if j is positive and some j is not in range
    if (j[1] > 0 & any(!j %in% seq_len(ncol(x)))) {
      warning("Some sample index (j) are not in the object. Please check.")
      j = j[j %in% seq_len(ncol(x))]
    }
    
    ###NA in j
    if (sum(is.na(i)) > 0) {
      i = i[!is.na(i)]
      if (length(i) == 0) {
        i = seq_len(nrow(x))
        warning("Some variable index (i) are not in the object. Please check.")
      } else{
        warning("Some variable index (i) are not in the object. Please check.")
      }
      
    }
    
    ####if i is negative and some i is not in range
    if (i[1] < 0 & any(!abs(i) %in% seq_len(nrow(x)))) {
      warning("Some variable index (i) are not in the object. Please check.")
      i = i[i %in% -seq_len(nrow(x))]
    }
    
    ####if i is positive and some i is not in range
    if (i[1] > 0 & any(!i %in% seq_len(nrow(x)))) {
      warning("Some variable index (i) are not in the object. Please check.")
      i = i[i %in% seq_len(nrow(x))]
    }
    
    ###add paramters
    ####add parameters
    process_info <-
      extract_process_info(x)
    
    parameter <- new(
      Class = "tidymass_parameter",
      pacakge_name = "massdataset",
      function_name = "[",
      parameter = list("i" = i,
                       "j" = j),
      time = Sys.time()
    )
    
    if (all(names(process_info) != "subset")) {
      process_info$subset <-
        parameter
    } else{
      process_info$subset <-
        c(process_info$subset, parameter)
    }
    
    x@process_info <-
      process_info
    
    expression_data <-
      x@expression_data[i, j, drop = drop]
    
    if (!is.data.frame(expression_data)) {
      # expression_data = as.numeric(expression_data)
      return(expression_data)
    }
    
    x@expression_data <-
      x@expression_data[i, j, drop = drop]
    x@sample_info <-
      x@sample_info[j, , drop = FALSE]
    x@variable_info <-
      x@variable_info[i, , drop = FALSE]
    
    return(x)
  }



#' @title $ method
#' @description $ method of mass_dataset
#' @method $ mass_dataset
#' @param x A mass_dataset class
#' @param name A [name] or a string.
#' @return a column from expression_data by name if it exists
#' @export
`$.mass_dataset` <- function(x, name) {
  out <- .subset2(x@expression_data, name)
  if (is.null(out)) {
    warn(paste0("Unknown or uninitialised column: ", tick(name), "."))
  }
  out
}

tick <- function(x) {
  ifelse(is.na(x), "NA", encodeString(x, quote = "`"))
}