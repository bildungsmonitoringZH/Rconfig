# Rconfig

Kanton Zürich, Bildungsplanung, R configuration files

## R Profile

File `.Rprofile`

* manual site configuration: place Rprofile.site in R_HOME directory
* manual user configuration: place .Rprofile in R_USER directory (recommended)
* manual project configuration: place .Rprofile in working/project directory

File `.Rprofile_defaultpackages` is accessed in `.Rprofile` via GitHub. (Optional) It can be placed in R_USER directory as fall back option.

### Installation

Requirements: Setup with RStudio, R, git and Notepad++, all paths set.

1. Open RStudio, create or open project `Rconfig`, as a local clone of https://github.com/bildungsmonitoringZH/Rconfig.git
2. In R Console, verify `R_USER` directory (`Sys.getenv('R_USER')`) -- should be something like `C:/Users/B251PFI`
3. Copy `.Rprofile` to `R_USER` directory (in Git Bash Terminal with `cp Rprofile/.Rprofile C:/Users/B251PFI`)
4. Open local copy of `.Rprofile` (in Terminal with `notepad++ C:/Users/B251PFI/.Rprofile`), change name and email on line 15, save and close
5. Copy `.Rprofile_defaultpackages` to `R_USER` directory (in Git Bash Terminal with `cp Rprofile/.Rprofile_defaultpackages C:/Users/B251PFI`)

## R Packages

File `installed_packages.csv`

* List of packages to be installed

Script `packageInstaller.R`

* To install all missing packages `source()` the script and run `installPkgs()`
