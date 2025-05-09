% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lumpedModel.R
\name{lumpedMatrix}
\alias{lumpedMatrix}
\alias{lumpedModel}
\title{Combine alleles in a mutation matrix}
\usage{
lumpedMatrix(mutmat, lump, afreq = NULL, check = TRUE, labelSep = NULL)

lumpedModel(mutmod, lump, afreq = attr(mutmod, "afreq"), check = TRUE)
}
\arguments{
\item{mutmat}{A \code{mutationMatrix} object, typically made with
\code{\link[=mutationMatrix]{mutationMatrix()}}.}

\item{lump}{A vector containing the alleles to be lumped together, or a list
of several such vectors.}

\item{afreq}{A vector with allele frequencies, of the same length as the size
of \code{mutmat}. Extracted from the model if not given.}

\item{check}{A logical indicating if lumpability (i.e., the row-sum criterium
of Kemeny & Snell) should be checked before lumping. Default: TRUE.}

\item{labelSep}{A character used to name lumps by pasting allele labels. (For
debugging.)}

\item{mutmod}{A \code{mutationModel} object, typically made with
\code{\link[=mutationModel]{mutationModel()}}.}
}
\value{
A reduced mutation model. If the original matrix has dimensions
\eqn{n\times n}{n*n}, the result will be \eqn{k\times k}{k*k}, where \eqn{k
  = n - length(lump) + 1}.
}
\description{
Reduce a mutation matrix by combining a set of alleles into one \emph{lump}, if
this can be done without distorting the mutation process of the remaining
alleles. Such allele lumping can give dramatic efficiency improvements in
likelihood computations with multi-allelic markers, in cases where only some
of the alleles are observed in the pedigree.
}
\details{
The lumping implemented in this function is based on the Markov chain lumping
theory by Kemeny & Snell (1976). For other, specialised lumping, see
\code{\link[=lumpMutSpecial]{lumpMutSpecial()}}.
}
\examples{

af = c(.1, .2, .3, .4)
names(af) = 1:4

### Example 1: Lumping a mutation matrix
mat = mutationMatrix("eq", afreq = af, rate = 0.1)
mat

# Lump
lumpedMatrix(mat, lump = 3:4)
lumpedMatrix(mat, lump = 2:4)

# Example 2: Full model, proportional
mutrate = list(male = 0.1, female = 0.2)
mod = mutationModel("prop", afreq = af, rate = mutrate)
mod

# Lump
lumpedModel(mod, lump = 2:4)

}
\references{
Kemeny & Snell (1976). \emph{Finite Markov Chains}. Springer.
}
\seealso{
\code{\link[=lumpMutSpecial]{lumpMutSpecial()}}.
}
