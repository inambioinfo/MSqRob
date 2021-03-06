% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/preprocess_MaxQuant.R
\name{preprocess_MSnSet}
\alias{preprocess_MSnSet}
\title{Preprocess MSnSet objects}
\usage{
preprocess_MSnSet(MSnSet, accession = "prot", exp_annotation = NULL,
  type_annot = NULL, logtransform = TRUE, base = 2,
  normalisation = "quantiles", smallestUniqueGroups = TRUE, split = NULL,
  useful_properties = NULL, filter = NULL, filter_symbol = NULL,
  minIdentified = 2, external_filter_file = NULL,
  external_filter_accession = NULL, external_filter_column = NULL,
  colClasses = NA, printProgress = FALSE, shiny = FALSE, message = NULL,
  details = NULL)
}
\arguments{
\item{MSnSet}{An \code{\link[=MSnSet-class]{MSnSet}} object.}

\item{accession}{A character indicating the column that contains the unit on which you want to do inference (typically the protein identifiers).}

\item{exp_annotation}{Either the path to the file which contains the experiment annotation or a data frame containing the experiment annotation. Exactly one colum in the experiment annotation should contain the mass spec run names. Annotation in a file can be both a tab-delimited text document or an Excel file. For more details, see \code{\link[utils]{read.table}} and \code{\link[openxlsx]{read.xlsx}}. As an error protection measurement, leading and trailing spaces in each column are trimmed off. The default, \code{NULL} indicates there is no annotation to be added.}

\item{type_annot}{If \code{exp_annotation} is a path to a file, the type of file. \code{type_annot} is mostly obsolete as supported files will be automatically recognized by their extension. Currently only \code{"tab-delim"} (tab-delimited file), \code{"xlsx"} (Office Open XML Spreadsheet file) and \code{NULL} (file type decided based on the extension) are supported. If the extension is not recognized, the file will be assumed to be a tab-delimited file. Defaults to \code{NULL}.}

\item{logtransform}{A logical value indicating whether the intensities should be log-transformed. Defaults to \code{TRUE}.}

\item{base}{A positive or complex number: the base with respect to which logarithms are computed. Defaults to 2.}

\item{normalisation}{A character vector of length one that describes how to normalise the \code{\link[=MSnSet-class]{MSnSet}} object. See \code{\link[=normalise-methods]{normalise}} for details. Defaults to \code{"quantiles"}. If no normalisation is wanted, set \code{normalisation="none"}.}

\item{smallestUniqueGroups}{A logical indicating whether protein groups for which any of its member proteins is present in a smaller protein group should be removed from the dataset. Defaults to \code{TRUE}.}

\item{split}{A character string that indicates the separator between protein groups. Only used when \code{smallestUniqueGroups} is set to \code{TRUE}.}

\item{useful_properties}{The columns of the \code{\link{featureData}} slot that are useful in the further analysis and/or inspection of the data and should be retained. Defaults to \code{NULL}, in which case no additional columns will be retained.}

\item{filter}{A vector of names corresponding to the columns in the \code{\link{featureData}} slot of the \code{\link[=MSnSet-class]{MSnSet}} object that contain a \code{filtersymbol} that indicates which rows should be removed from the data.
Typical examples are contaminants or reversed sequences. Defaults to \code{NULL}, in which case no filtering will be performed.}

\item{filter_symbol}{Only used when \code{filter} is not \code{NULL}. A character indicating the symbol in the columns corresponding to the \code{filter} argument that is used to indicate rows that should be removed from the data. Defaults to \code{NULL}, which will throw an error if \code{filter} is not \code{NULL} to alert the user to specify a filter symbol.}

\item{minIdentified}{A numeric value indicating the minimal number of times a peptide sequence should be identified in the dataset in order not to be removed. Defaults to 2.}

\item{external_filter_file}{The name of an external protein filtering file. Sometimes, users want to filter out proteins based on a separate protein file. This file should contain at least a column with name equal to the value in \code{external_filter_accession} containing proteins, and one or more columns on which to filter, with names equal to the input in \code{external_filter_column}. Proteins that need to be filtered out should have the \code{filter_symbol} in their \code{external_filter_column}. Defaults to \code{NULL}, in which case no filtering based on an external protein file will be done.}

\item{external_filter_accession}{Only used when \code{external_filter_file} is not \code{NULL}. A character indicating the column that contains the protein identifiers in the \code{external_filter_file}. Defaults to \code{NULL}, which will throw an error if \code{external_filter_file} is not \code{NULL} to alert the user to specify a filter column.}

\item{external_filter_column}{Only used when \code{external_filter_file} is not \code{NULL}. A vector of names containing the column name(s) on which to filter in the \code{external_filter_file}. Defaults to \code{NULL}, which will throw an error if \code{external_filter_file} is not \code{NULL} to alert the user to specify a filter column.}

\item{colClasses}{character. Only used when the \code{exp_annotation} argument is a filepath. A vector of classes to be assumed for the columns of the experimental annotation data frame. Recycled if necessary. If named and shorter than required, names are matched to the column names with unspecified values are taken to be NA.
Possible values are \code{NA} (the default, when \code{type.convert} is used), \code{NULL} (when the column is skipped), one of the atomic vector classes (\code{logical}, \code{integer}, \code{numeric}, \code{complex}, \code{character}, \code{raw}), or \code{factor}, \code{Date} or \code{POSIXct}. Otherwise there needs to be an as method (from package \code{methods}) for conversion from \code{character} to the specified formal class.}

\item{printProgress}{A logical indicating whether the R should print a message before performing each preprocessing step. Defaults to \code{FALSE}.}

\item{shiny}{A logical indicating whether this function is being used by a Shiny app. Setting this to \code{TRUE} only works when using this function in a Shiny app and allows for dynamic progress bars. Defaults to \code{FALSE}.}

\item{message}{Only used when \code{shiny=TRUE}. A single-element character vector: the message to be displayed to the user, or \code{NULL} to hide the current message (if any).}

\item{details}{Only used when \code{shiny=TRUE} or \code{printProgress=TRUE}. A character vector containing the detail messages to be displayed to the user, or \code{NULL} to hide the current detail messages (if any). The detail messages will be shown with a de-emphasized appearance relative to the message.}
}
\value{
A preprocessed \code{\link[=MSnSet-class]{MSnSet}} object that is ready to be converted into a \code{\link[=protdata-class]{protdata}} object.
}
\description{
This function allows to perform a standard preprocessing pipeline on \code{\link[=MSnSet-class]{MSnSet}} objects (Gatto et al., 2012).
By default, intensity values are log2 transformed and then quantile normalized. Next, the \code{\link[=smallestUniqueGroups]{smallestUniqueGroups}} function is applied,
which removes proteins groups for which any of its member proteins is present in a smaller protein group. Then, peptides that need to be filtered out are removed.
Next, irrelevant columns are dropped. Then, peptide sequences that are identified only once in a single mass spec run are removed because with only 1 identification, the model will be perfectly confounded. Finally, potential experimental annotations are added to the data frame.
}
\references{
Gatto L, Lilley KS. MSnbase - an R/Bioconductor package for isobaric tagged mass spectrometry data visualization, processing and quantitation. Bioinformatics. 2012 Jan 15;28(2):288-9. \url{https://doi.org/10.1093/bioinformatics/btr645}. PubMed PMID:22113085.
}
