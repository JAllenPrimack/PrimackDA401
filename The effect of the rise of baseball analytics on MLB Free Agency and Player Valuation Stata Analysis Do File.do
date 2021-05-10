import excel "/Users/allenprimack/Downloads/MLBFreeAgentData.xlsx", sheet("Sheet1") firstrow clear
*Model with all variables included
regress Guarantee Year Age Years HR RBI IBB SB AVG BB K BBK OBP SLG ISO BABIP wOBA wRAA wRC RAR WPA RE24 REW
*Test for multicollinearity
vif
*Removing variable showing severe multicollinearity and statistically insignificant variables 
regress Guarantee Year Years HR IBB OBP SLG wRC RAR WPA
*Model for years 1999-2006       
regress Guarantee Year Years HR IBB OBP SLG wRC RAR WPA if Year > 1998 & Year < 2007
eststo Model1
*Model for years 2000-2007
regress Guarantee Year Years HR IBB OBP SLG wRC RAR WPA if Year > 1999 & Year < 2008
eststo Model2
*Model for years 2001-2008
regress Guarantee Year Years HR IBB OBP SLG wRC RAR WPA if Year > 2000 & Year < 2009
eststo Model3
*Model for years 2002-2009
regress Guarantee Year Years HR IBB OBP SLG wRC RAR WPA if Year > 2001 & Year < 2010
eststo Model4
*Model for years 2003-2010
regress Guarantee Year Years HR IBB OBP SLG wRC RAR WPA if Year > 2002 & Year < 2011
eststo Model5
*Model for years 2004-2011
regress Guarantee Year Years HR IBB OBP SLG wRC RAR WPA if Year > 2003 & Year < 2012
eststo Model4
*Model for years 2005-2012
regress Guarantee Year Years HR IBB OBP SLG wRC RAR WPA if Year > 2004 & Year < 2013
eststo Model5
*Model for years 2006-2013
regress Guarantee Year Years HR IBB OBP SLG wRC RAR WPA if Year > 2005 & Year < 2014
eststo Model6
*Model for years 2007-2014
regress Guarantee Year Years HR IBB OBP SLG wRC RAR WPA if Year > 2006 & Year < 2015
eststo Model6
*Model for years 2008-2015
regress Guarantee Year Years HR IBB OBP SLG wRC RAR WPA if Year > 2007 & Year < 2016
eststo Model7
*Model for years 2009-2016
regress Guarantee Year Years HR IBB OBP SLG wRC RAR WPA if Year > 2008 & Year < 2017
eststo Model8
*Model for years 2010-2017
regress Guarantee Year Years HR IBB OBP SLG wRC RAR WPA if Year > 2009 & Year < 2018
eststo Model9
*Model for years 2011-2018
regress Guarantee Year Years HR IBB OBP SLG wRC RAR WPA if Year > 2010 & Year < 2019
eststo Model10
*Model for years 2012-2019
regress Guarantee Year Years HR IBB OBP SLG wRC RAR WPA if Year > 2011 & Year < 2020
eststo Model11
*Model for years 2013-2020
regress Guarantee Year Years HR IBB OBP SLG wRC RAR WPA if Year > 2012 & Year < 2021
eststo Model12
*Comparing model for years 1999-2006 with model for years 2012-2019
esttab  Model1 Model11,  mtitles(“1999-2006” “2012-2019”) title(“Comparing two rolling samples) nonumber star(* 0.10 ** 0.05 *** 0.01) staraux  b(3) se(3) o (_cons) scalars( "r2_a Adj R-Squared" "rmse SEE" "F F-ratio" "rss SSR") varwidth(16)
*Comparing first 3 time interval models
esttab  Model1 Model2 Model3,  mtitles(“1999-2006” “2000-2007” “2001-2008”) title(“Comparing models for different time intervals) nonumber star(* 0.10 ** 0.05 *** 0.01) staraux  b(3) se(3) o (_cons) scalars( "r2_a Adj R-Squared" "rmse SEE" "F F-ratio" "rss SSR") varwidth(16)
*Comparing next 3 time interval models
esttab  Model4 Model5 Model6,  mtitles(“2002-2009” “2003-2010” “2004-2011”) title(“Comparing models for different time intervals) nonumber star(* 0.10 ** 0.05 *** 0.01) staraux  b(3) se(3) o (_cons) scalars( "r2_a Adj R-Squared" "rmse SEE" "F F-ratio" "rss SSR") varwidth(16)
*Comparing next 3 time intervals
esttab  Model7 Model8 Model9,  mtitles(“2005-2012” “2006-2013” “2007-2014”) title(“Comparing models for different time intervals) nonumber star(* 0.10 ** 0.05 *** 0.01) staraux  b(3) se(3) o (_cons) scalars( "r2_a Adj R-Squared" "rmse SEE" "F F-ratio" "rss SSR") varwidth(16)
*Comparing last 3 time intervals
esttab  Model8 Model9 Model10,  mtitles(“2008-2015” “2009-2016” “2010-2017”) title(“Comparing models for different time intervals) nonumber star(* 0.10 ** 0.05 *** 0.01) staraux  b(3) se(3) o (_cons) scalars( "r2_a Adj R-Squared" "rmse SEE" "F F-ratio" "rss SSR") varwidth(16)
*Developing models to compare defined pre-Moneyball and post-Moneyball time periods 
*Pre-Moneyball Model
regress Guarantee Year Age Years pastWAR RBI IBB SB AVG BB K ISO WPA if Year > 1998 & Year < 2005
eststo PreMoneyball
*Post-Moneyball Model
regress Guarantee Year Age Years pastWAR RBI IBB SB AVG BB K ISO WPA if Year > 2004 & Year < 2011
eststo PostMoneyball
*Comparing pre-and-post Moneyball Models
esttab  PreMoneyball PostMoneyball,  mtitles(“Pre-Moneyball” “Post-Moneyball””) title(“Comparing models pre-and-post Moneyball) nonumber star(* 0.10 ** 0.05 *** 0.01) staraux  b(3) se(3) o (_cons) scalars( "r2_a Adj R-Squared" "rmse SEE" "F F-ratio" "rss SSR") varwidth(16)
