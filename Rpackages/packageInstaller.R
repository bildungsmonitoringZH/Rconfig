# installation of R packages in a biplaR setup
# 
# Author: Flavian Imlig <flavian.imlig@bi.zh.ch>
# Date: 19.05.2020
###############################################################################

# functions

## install all packages
installPkgs <- function(...)
{
    pkgs <- loadPkgList()
    stopifnot(is.character(pkgs))
    stopifnot(length(pkgs) > 0)
    
    detachPkgs()
    
    for( pkg in pkgs )
    {
        installPkg(pkg)
    }
}

## install single package
installPkg <- function(pkg)
{
    if( !pkg %in% row.names(installed.packages()) )
    {
        install.packages(pkg, type = 'binary')
    }
}

## load package list
loadPkgList <- function(...) 
{
    path <- url('https://raw.githubusercontent.com/bildungsmonitoringZH/Rconfig/master/Rpackages/installed_packages.csv')
    tbl <- suppressWarnings(try(utils::read.csv(path, as.is = TRUE), silent = TRUE))
    stopifnot(is.data.frame(tbl))
    stopifnot(identical(names(tbl), 'packages'))
    
    return(tbl$packages)
}

## detach all attached packages
detachPkgs <- function(...)
{
    pkgs <- union(names(sessionInfo()$otherPkgs), names(sessionInfo()$loadedOnly))
    
    for( pkg in pkgs )
    {
        suppressWarnings(detachPkg(pkg, character.only = TRUE))
        suppressWarnings(detachPkg(pkg, character.only = TRUE))
    }
}

# detach single package
detachPkg <- function(pkg, character.only = FALSE)
{
    if(!character.only)
    {
        pkg <- deparse(substitute(pkg))
    }
    
    search_item <- paste("package", pkg, sep = ":")
    
    while(search_item %in% search())
    {
        detach(search_item, unload = TRUE, character.only = TRUE)
    }
}