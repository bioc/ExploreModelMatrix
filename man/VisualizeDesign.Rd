% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/VisualizeDesign.R
\name{VisualizeDesign}
\alias{VisualizeDesign}
\title{Visualize design matrix}
\usage{
VisualizeDesign(
  sampleData,
  designFormula = NULL,
  flipCoordFitted = FALSE,
  flipCoordCoocc = FALSE,
  textSizeFitted = 5,
  textSizeCoocc = 5,
  textSizeLabsFitted = 12,
  textSizeLabsCoocc = 12,
  lineWidthFitted = 25,
  addColorFitted = TRUE,
  colorPaletteFitted = scales::hue_pal(),
  dropCols = NULL,
  designMatrix = NULL
)
}
\arguments{
\item{sampleData}{A \code{data.frame} of \code{DataFrame} with sample
information.}

\item{designFormula}{A \code{formula}. All components of the terms must be
present as columns in \code{sampleData}.}

\item{flipCoordFitted, flipCoordCoocc}{A \code{logical}, whether to flip the
coordinate axes in the fitted values/co-occurrence plot, respectively.}

\item{textSizeFitted, textSizeCoocc}{A \code{numeric} scalar giving the text
size in the fitted values/co-occurrence plot, respectively.}

\item{textSizeLabsFitted, textSizeLabsCoocc}{A \code{numeric} scalar giving
the text size for the axis labels in the fitted values/co-occurrence plot,
respectively.}

\item{lineWidthFitted}{A \code{numeric} scalar giving the maximal length of a
row in the fitted values plot, before it is split and printed on multiple
lines}

\item{addColorFitted}{A \code{logical} scalar indicating whether the terms
in the fitted values plot should be shown in different colors.}

\item{colorPaletteFitted}{A \code{function} returning a color palette to use
for coloring the model coefficients in the fitted values plot.}

\item{dropCols}{A character vector with columns to drop from the design
matrix, or NULL if no columns should be dropped.}

\item{designMatrix}{A \code{numeric} matrix, which can be supplied as an
alternative to \code{designFormula}. Rows must be in the same order as
the rows in \code{sampleData}.}
}
\value{
A list with the following elements:
\itemize{
\item \code{sampledata}: A \code{data.frame}, expanded from the input
\code{sampleData}
\item \code{plotlist}: A list of plots, displaying the fitted values for
each combination of predictor values, in terms of the model coefficients.
\item \code{designmatrix}: The design matrix, after removing any columns in
\code{dropCols}
\item \code{pseudoinverse}: The pseudoinverse of the design matrix
\item \code{vifs}: A \code{data.frame} with calculated variance inflation
factors
\item \code{colors}: A vector with colors to use for different model
coefficients
\item \code{cooccurrenceplots}: A list of plots, displaying the
co-occurrence pattern for the predictors (i.e., the number of observations
for each combination of predictor values)
\item \code{totnbrrows}: The total number of "rows" in the list of plots
of fiitted values. Useful for deciding the required size of the plot canvas.
}
}
\description{
Given a sample table and a design formula, generate a collection of
static plots for exploring the resulting design matrix graphically.
This function is called internally by \code{ExploreModelMatrix()}, but
can also be used directly if interactivity is not required.
}
\details{
Note that if a design matrix is supplied (via the \code{designMatrix}
argument), caution is required in order to interpret especially the
cooccurrence plot in the situation where the provided \code{sampleData}
contains additional columns not used to generate the design matrix (or
when it does not contain all the relevant columns).
}
\examples{
VisualizeDesign(
  sampleData = data.frame(genotype = rep(c("A", "B"), each = 4),
                          treatment = rep(c("treated", "untreated"), 4)),
  designFormula = ~genotype + treatment
)

}
\author{
Charlotte Soneson
}
