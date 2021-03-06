% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/squeezePars.R
\name{update_protLM}
\alias{update_protLM}
\title{Update protLM object with new parameter variances and residual variances}
\usage{
update_protLM(protLM, theta, sigmas = NULL, df_sigmas = NULL,
  printProgress = FALSE, shiny = FALSE, message = NULL, ...)
}
\arguments{
\item{theta}{A numeric matrix wherein each column contains parameter variances (theta values) that will replace the theta values in all \code{\link[=lmerMod-class]{lmerMod}} objects present in the \code{model} slot of the \code{\link[=protLM-class]{protLM}} object. Column names should be corresponding to random effects and/or ridge groups (e.g. "ridgeGroup.1") present in the model.}

\item{sigmas}{A vector of length equal to the \code{\link[=protLM-class]{protLM}} object containing residual variances that should replace the existing residual variances in each object present in the \code{model} slot of the \code{\link[=protLM-class]{protLM}} object.}

\item{df_sigmas}{A vector of length equal to the \code{\link[=protLM-class]{protLM}} object containing residual degrees of freedom that should replace the existing residual degrees of freedom in each object present in the \code{model} slot of the \code{\link[=protLM-class]{protLM}} object.}

\item{printProgress}{A logical indicating whether the R should print a message before performing each preprocessing step. Defaults to \code{FALSE}.}

\item{shiny}{A logical indicating whether this function is being used by a Shiny app. Setting this to \code{TRUE} only works when using this function in a Shiny app and allows for dynamic progress bars. Defaults to \code{FALSE}.}

\item{message}{Only used when \code{printProgress=TRUE} and \code{shiny=TRUE}. A single-element character vector: the message to be displayed to the user during the updating of the models, or \code{NULL} to hide the current message (if any).}

\item{...}{Other arguments to be passed to the \code{\link{update.lmerMod}} function.}

\item{object}{A \code{\link[=protLM-class]{protLM}} object of which the  all of its \code{\link[=lmerMod-class]{lmerMod}} object in the \code{model} slot should have one or more parameter parameter variances \code{theta} replaced by given theta values. Optionally residual variances can also be updated.}
}
\value{
A \code{\link[=lmerMod-class]{lmerMod}} object of which the parameter variances are replaced by the ones given in the \code{theta} input argument.
}
\description{
This function changes the parameter variances \code{theta} of all \code{\link[=lmerMod-class]{lmerMod}} objects present in the \code{model} slot of a \code{\link[=protLM-class]{protLM}} object to a given vector and updates these models accordingly.
}
\examples{
....
}
\references{
Bolker (2016). Wald errors of variances, https://rpubs.com/bbolker/waldvar
}
