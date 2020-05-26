# user R configurations template
#
# Author: Flavian Imlig <flavian.imlig@bi.zh.ch>
# Date: 26.05.2019
###############################################################################

# Usage options
#
# manual site configuration: place Rprofile.site in R_HOME directory
# (default) manual user configuration: place .Rprofile in R_USER directory
# manual project configuration: place .Rprofile in working/project directory
###############################################################################

# Installation
#
# see https://github.com/bildungsmonitoringZH/Rconfig
###############################################################################

# function to set R author
.set_author <- function()
{
    author <- utils::person('Flavian', 'Imlig', email = 'flavian.imlig@bi.zh.ch')
    return(author)
}

# function to set R environment variables
.set_env <- function(load = TRUE)
{
    if( load ) {
        # set CRAN mirror
        local({r <- getOption("repos")
        r["CRAN"] <- "https://stat.ethz.ch/CRAN"
        options(repos=r)})
        
        # set to never compile CRAN packages from source
        options(install.packages.compile.from.source='newer')
        
        # set proxy
        Sys.setenv(http_proxy="http://proxy.kt.ktzh.ch:8080")
        Sys.unsetenv('https_proxy')
    }
}

# function to set additional default packages
.set_defpacks <- function(load = TRUE)
{
    # no load option
    if( isFALSE(load) ) {
        message('No additional defaultPackages set in .Rprofile! (load = FALSE)')
        return(invisible(NULL))
    }
    
    # table locations
    file_1 <- url('http://raw.githubusercontent.com/bildungsmonitoringZH/Rconfig/master/Rprofile/.Rprofile_defaultpackages')
    file_2 <- file.path(Sys.getenv('R_USER'), '.Rprofile_defaultpackages')
    
    # get package table
    tbl_1 <- suppressWarnings(try(utils::read.csv(file_1, as.is = TRUE), silent = TRUE))
    tbl_2 <- suppressWarnings(try(utils::read.csv(file_2, as.is = TRUE), silent = TRUE))
    try(close(file_1), silent = TRUE)
    
    # check package table
    f_check <- function(tbl)
    {
        if( is(tbl, 'try-error') ) return(FALSE)
        if( !is(tbl, 'data.frame') ) return(FALSE)
        if( !identical(names(tbl), 'defaultPackages') ) return(FALSE)
        if( nrow(tbl) < 1 ) return(FALSE)
        return(TRUE)
    }
    
    if( f_check(tbl_1) )
    {
        options(defaultPackages = unique(c(getOption('defaultPackages'), tbl_1$defaultPackages)))
        return(invisible(NULL))
    } else if( f_check(tbl_2) ) {
        options(defaultPackages = unique(c(getOption('defaultPackages'), tbl_2$defaultPackages)))
        return(invisible(NULL))
    }

    # return on failure
    message('No additional defaultPackages set in .Rprofile! (failure)')
    return(invisible(NULL))
}

# Startup function
.First <- function()
{
    # set author
    author <- .set_author()
    
    # set environment variables
    .set_env(load = TRUE)
    
    # set default packages
    .set_defpacks(load = TRUE)
    
    # set additional options
    if( 'devtools' %in% rownames(utils::installed.packages()) ) {
        options(devtools.desc.author = author)
    } else {
        message(sprintf('%s: Package %s not installed!', as.character(match.call()[[1]]), 'devtools'))
    }
    
    # load system fonts
    if( !'extrafont' %in% rownames(utils::installed.packages()) )
    {
        message(sprintf('%s: Package %s not installed!', as.character(match.call()[[1]]), 'extrafont'))
    } else {
        if( is.null(extrafont::fonts()) )
        {
            message('No fonts imported (extrafont package)!')
        } else {
            pdfFonts <- grDevices::pdfFonts
            extrafont::loadfonts('pdf', quiet = TRUE)
            windowsFonts <- grDevices::windowsFonts
            extrafont::loadfonts('win', quiet = TRUE)
            postscriptFonts <- grDevices::postscriptFonts
            extrafont::loadfonts('postscript', quiet = TRUE)
        }
    }
    
    # echo author
    message(sprintf('Profile for %s loaded.', author))
}
