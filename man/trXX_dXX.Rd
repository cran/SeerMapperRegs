\name{trXX_dXX}
\alias{trXX_dXX}

\alias{trXX_d00}
\alias{tr02_d00}
\alias{tr04_d00}
\alias{tr06_d00}
\alias{tr09_d00}
\alias{tr13_d00}
\alias{tr15_d00}
\alias{tr16_d00}
\alias{tr19_d00}
\alias{tr21_d00}
\alias{tr22_d00}
\alias{tr25_d00}
\alias{tr26_d00}
\alias{tr34_d00}
\alias{tr35_d00}
\alias{tr36_d00}
\alias{tr40_d00}
\alias{tr49_d00}
\alias{tr53_d00}
\alias{tr55_d00}

\docType{data}
\title{
   Provides the U.S. 2000 Census Tract Boundary Datasets for 19 States 
   that have Seer Registries for use with 
   \var{SeerMapper} Package
}
\description{
 There are six supplemental census tract boundary packages for 
 use with \var{SeerMapper}.  The are \var{SeerMapperRegs}, \var{SeerMapperEast},
 \var{SeerMapperWest} for the 2000 census and \var{Seer2010MapperRegs},
 \var{Seer2010MapperEast} and \var{SeerMapper2010West} for the 2010 census.
 The combination of the either three provide a 
 set of census tract boundaries for one U. S. census year (either 2000 or 2010).
 The \var{SeerMapperRegs} and \var{Seer2010MapperRegs} packages contain 
 the census tract boundaries for the 19 states the have U. S. Seer Registries.
 The remaining census tract boundaries are split into two packages 
 for each census year based on whether the state is east or west of the 
 Mississippi river.  The census tracts for 20 states, district and territory without registries east 
 of the Mississippi river at contained in the \var{SeerMapperEast} 
 and \var{Seer2010MapperEast} packages.  
 The tract boundaries for the 13 states west of the Mississippi river are 
 in the \var{SeerMapperWest} and \var{Seer2010MapperWest} packages.  
 The states include the District of Columbia and Puerto Rico.
 This package contains the 2000 census tract boundaries for the 19 states
 with Seer Registries.
 }
\usage{data(tr02_d00)}
\format{
 Each file contains a set of SpatialPolygons structures for the 19 states
 with Seer Registries.
 Each state structure is a list of the census tracts boundaries that 
 the state. Refer to the documentation on the \var{sp} package for 
 details on the strucures.  Each list element is a "polygons" class 
 structure containing attributes of the census tract (label point, 
 area, ID, etc.) and a list of "Polygons" class elements that define 
 the boundary polygons.
 }
\details{
 The \var{SeerMapperRegs} and \var{SeerMapper2010Regs} packages contains 
 19 states with Seer Registries including:
 \preformatted{
    FIPS   Name
     02     Alaska
     04     Arizona
     06     California
     09	    Connecticut
     13     Georgia
     15     Hawaii
     16     Idaho
     19	    Iowa
     21     Kentucky
     22     Louisiana
     25     Massacussett 
     26     Michigan
     34     New Jersery
     35     New Mexico
     36     New York
     40     Oklahoma
     49	    Utah 
     53     Washington
     55     Wisconsin
}
 The \var{SeerMapper} package contains the state and county boundary
 data for all 51 states and DC and the Seer Registry boundary data for
 the 20 established registries.  Due to space limitations, the base
 packages cannot contain the census tract boundary data.

 Three supplemental data packages are used for each census year to
 provide the census tract boundary data to \var{SeerMapper} package.

 Each state ".rda" file (dataset) contains state's census tract
 boundary data. The file name structure is trXX_dYY, where tr
 identifies the file as census tract boundary data, "XX" is the state
 (2 digits) fips code and "YY" represents the census year (e.g., 00 =
 2000 or 10 for 2010)

 To conserve disk space and downloading/installation time, the rda
 files are compressed using the "xy" method.

 The U. S. Census Bureau census tract boundary shape file data was pre-
 processed by "www.MapShaper.org" website version 01.15 using modified
 Visvalingam method with the intersection repair and prevent shape
 removal options enabled, the coordinate precision value set to 0.0 and
 the simplify parameter set to 10%. This reduces the space requirements
 by 85% while maintaining a reasonable boundary image and edge
 alignments.

 When the \var{SeerMapper} package is install, the six (6) census tract
 boundary supplement packages are also install automatically by R. The
 \var{SeerMapper} package then manages the loading of the packages to
 ensure the needed boundary files are available.
}
\source{
 The census tract boundary shapefiles were downloaded from the 
 CENSUS.GOV web site for the 2000 Census census tract boundary shapefiles, 
 https://www2.census.gov/geo/tiger/PREVGENZ/tr/tr00shp/trXX_d00_shp.zip, 
 where XX is the state FIPS code.  
}
\examples{
  #
  #  These examples are a test to ensure each census tract file
  #  can be read and a plot of the state generated.
  #
  require("sp")
 
  #
  #  If you want to save the example output PDF files, change the 
  #  the following "tempDir()" to the path you want to save the output files.
  #                For Example:   outDir <- "c:/RTestPDFs"
  outDir    <- tempdir()
  cat("Output Directory used:",outDir,"\n")
  
  stList    <- c("02","04","06","09","13",
                 "15","16","19","21","22",
                 "25","26","34","35","36",
                 "40","49","53","55")
  stName    <- c("Alaska","Arizona","California","Connecticut","Georgia",
                 "Hawaii","Idaho","Iowa","Kentucky","Louisiana",
                 "Massachusett","Michigan","New Jersery","New Mexico","New York",
                 "Oklahoma","Utah","Washington","Wisconsin")
  cY        <- "00"

  outFile   <- paste0("SeerMapperRegs",cY,"-CT.pdf")
  outFN     <- file.path(outDir,outFile)
  cat("Output example PDF file:",outFN,"\n")

  pdf(outFN,width=7,height=10)

  for (stN in seq(from=1, to=length(stList), by=7)) {  # Test draw 3 of 19 states  (1, 8, 15)

     stID   <- stList[stN]
     stNa   <- stName[stN]
     trFN   <- paste0("tr",stID,"_d",cY)
     TT_tr  <- paste0("U. S. Census Tracts - ",stNa,"  Fips=",stID,"  file=",trFN)
     
     data(list=trFN)
     
     wrSP   <- get(trFN)
     #str(wrSP)
     
     plot(wrSP,main=TT_tr)
     rm(list=trFN)
  }

  dev.off()
}
\keyword{Census2000}
\keyword{Census2010}
\keyword{SeerMapper}
\keyword{datasets}
