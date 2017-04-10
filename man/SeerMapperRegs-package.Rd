\name{SeerMapperRegs-package}
\alias{SeerMapperRegs-package}
\docType{package}
\title{\var{SeerMapper}-Supplemental 2000 Census Tract boundary datasets for 15 states 
  with Seer Registries}
\description{
 The \var{SeerMapperRegs} package provides 2000 Census Tract boundary datasets 
 for 15 states containing Seer Registries for use with \var{SeerMapper} package.  
 
 The \var{SeerMapperWest} data only package contains the 2000 
 census tract boundary dataset for 14 states
 west of the Mississippi river 
 that do not contain NCI Seer Registries. The \var{SeerMapperEast} data only 
 package contains the 2000 census trace boundary datasets for 21 states, 
 District of Columbia and Puerto Rico that do not have Seer Registries and are 
 east of the Mississippi river.
 
 By loading these packages (via the library function) expands the \var{SeerMapper}
 package abilities to map 2000 census tract level data in any of the 50 states, 
 the District of Columbia and Puerto Rico.
}
\details{
    \tabular{ll}{
      Package:  \tab SeerMapperRegs\cr
      Type:     \tab Package\cr
      Version:  \tab 1.2.0\cr
      Date:     \tab 2017-04-10\cr
      License:  \tab GPL-2\cr
      LazyLoad: \tab no\cr
    } 

No special action is required by the user to install this package or load it when running
\var{SeerMapper}.  The defined interdependencies of the packages automatically install the 
supplemental 2000 census tract boundary packages when \var{SeerMapper} is install.
When \var{SeerMapper} is called, if it determines that one or more supplemental 
packages need to be loaded, it initiates the loading for the caller.
\preformatted{  
  library(SeerMapper)
  
  rateDate <- data.frame(FIBS=stateFibs, 
                         Rate=stateRateVector, 
                         pValue=stateRatePValue)
  
  SeerMapper(rateData, Title=c("Test Map"))
 }

If the package attachment or dataset load fails, the caller is 
notified of the problem and mapping is terminated.  

The \var{SeerMapperRegs} package contains the 2000 census tract bouondary dataset for:
\preformatted{
    FIPS   Name        # of Registries
     02     Alaska      1
     04     Arizona     1
     06     California  4
     09     Connecticut 1
     13     Georgia     3
     15	    Hawaii      1
     19     Iowa        1
     21     Kentucky    1
     22     Louisiana   1
     26     Michigan    1
     34     New Jersey  1
     35     New Mexico  1
     40     Oklahoma    1
     49     Utah        1
     53     Washington  1           
}

The \var{SeerMapperEast} package contains the 2000 census tract boundary dataset for:
\preformatted{
    FIPS   Name
     01     Alabama
     10     Delaware
     11	    District of Columbia
     12	    Florida
     17	    Illinois
     18	    Indiana
     23     Maine
     24     Maryland
     25     Massachusetts
     28	    Mississippi
     33	    New Hampshire
     36	    New York
     37	    North Carolina
     39	    Ohio
     42     Pennsylvania
     44	    Rhode Island
     45	    South Carolina
     47	    Tennessee
     50	    Vermont
     51	    Virginia
     54     West Virginia
     55	    Wisconsin
     72	    Puerto Rico
  }

The \var{SeerMapperWest} package contains the 2000 census tract boundary dataset for:
\preformatted{
    FIPS   Name
     08     Colorado
     16     Idaho
     20     Kansas
     17     Illinois
     18     Indiana
     30     Montana
     38     North Dakota
     31     Nebraska
     32     Nevada
     39     Ohio
     41     Oregon
     46     South Dakota
     48     Texas
     55     Wisconsin
     56     Wyoming
  }
}  
\author{
Jim Pearson \email{jpearson@statnetconsulting.com} and U. S. Census Bureau \email{geo.tiger@census.gov}\cr 
Maintainer: "Jim Pearson" \email{jpearson@statnetconsulting.com}\cr 
Package compiled by "Jim Pearson" \email{jpearson@statnetconsulting.com}
}


