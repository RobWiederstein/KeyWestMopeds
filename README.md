# Key West Mopeds <img src="reference/figures/logo.png" align="right" width="120" />

<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![Github: codesize](https://img.shields.io/github/languages/code-size/RobWiederstein/KeyWestMopeds)]
[![R version](https://img.shields.io/github/r-package/v/RobWiederstein/KeyWestMopeds)]
[![Codecov test coverage](https://codecov.io/gh/RobWiederstein/KeyWestMopeds/branch/main/graph/badge.svg)](https://codecov.io/gh/RobWiederstein/KeyWestMopeds?branch=main)
[![Travis build status](https://travis-ci.com/RobWiederstein/KeyWestMopeds.svg?branch=main)](https://travis-ci.com/RobWiederstein/KeyWestMopeds)
<!-- badges: end -->


### Overview

`KeyWestMopeds` is an exploratory analysis of motorcycle/moped crashes in Florida from 2012 through 2019.  A threshold requirement for understanding the data set is to understand what triggers a long form crash report and how a motor vehicle is defined.

According to the Florida Uniform Traffic Crash Manual, a long form crash report is required when:

- Resulted in death of, personal injury to, or any indication of complaints of pain or discomfort by any of the
parties or passengers involved in the crash;
- Leaving the scene involving damage to attended vehicles or property (F.S. 316.061(1));
- Driving while under the influence (F.S. 316.193);
- Rendered a vehicle inoperable to a degree that required a wrecker to remove it from the scene of the crash; or
- Involved a commercial motor vehicle.


### Getting started

The package consists of the dataset `crash_data`.  Assistance may be requested via the command `?crash_data`.

### Resources

* [Open an issue](https://github.com/RobWiederstein/KeyWestMopeds/issues) (GitHub issues for bug reports, feature requests)

### Installation

* Install latest development version from GitHub (requires [devtools](https://github.com/hadley/devtools) package):

```r
if (!require("devtools")) {
  install.packages("devtools")
}
devtools::install_github("RobWiederstein/KeyWestMopeds", dependencies = TRUE, build_vignettes = TRUE)
```

<!-- CONTACT -->
### Contact

Rob Wiederstein - [@RobWiederstein](https://twitter.com/RobWiederstein) - rob@robwiederstein.org

Project Link: [https://github.com/RobWiederstein/KeyWestMopeds](https://github.com/RobWiederstein/KeyWestMopeds)

<!-- ACKNOWLEDGEMENTS -->
### Acknowledgements
* [Florida Department of Transportation](https://www.webpagefx.com/tools/emoji-cheat-sheet)

### Code of Conduct

  Please note that the KeyWestMopeds project is released with a [Contributor Code of Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.
