% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/protLM.R
\docType{methods}
\name{getAnnotations,protLM-method}
\alias{getAnnotations,protLM-method}
\title{Extract the annotation slot of a protLM object}
\usage{
\S4method{getAnnotations}{protLM}(object)
}
\arguments{
\item{object}{A \code{\link[=protLM-class]{protLM}} object of which the \code{annotation} slot needs to be extracted.}
}
\value{
A character matrix containing the annotations present in the \code{\link[=protLM-class]{protLM}} object. Rows correspond to accessions, while columns correspond to different annotations.
}
\description{
\code{getAnnotations} extracts the \code{annotation} slot from a \code{\link[=protLM-class]{protLM}} object.
}
