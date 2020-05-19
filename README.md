# Rconfig

Kanton Zürich, Bildungsplanung, R configuration files

## R Profile

File `.Rprofile`

* manual site configuration: place Rprofile.site in R_HOME directory
* manual user configuration: place .Rprofile in R_USER directory (recommended)
* manual project configuration: place .Rprofile in working/project directory

File `.Rprofile_defaultpackages` is accessed in `.Rprofile` via GitHub. (Optional) It can be placed in R_USER directory as fall back option.

## R Packages

File `installed_packages.csv`

* List of packages to be installed

Script `packageInstaller.R`

* To install all missing packages `source()` the script and run `installPkgs()`
