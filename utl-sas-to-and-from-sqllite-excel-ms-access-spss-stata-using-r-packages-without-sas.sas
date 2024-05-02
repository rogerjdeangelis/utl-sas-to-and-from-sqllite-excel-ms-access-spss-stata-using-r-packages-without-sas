%let pgm=utl-sas-to-and-from-sqllite-excel-ms-access-spss-stata-using-r-packages-without-sas;

SAS to and from sqllite excel ms access spss stata using r packages without sas

 All SAS datasets are created using Stattransfer
 SAS is not required for any of these imports/exports

  1 SAS to SPSS
    Install SAS clone PSPP to check R created SPSS
    Open nicely in PSPP
  2 SPSS to SAS


  3 SAS to EXCEL
    Install LibreOffice to check excel file
    Looks like excel in LibreOffice
  4 EXCEL to SAS


  5 SAS to STATA
    Install Gretl
    Lookd good in Gretl
  6 Stat to SAS


  7 MS Access to SAS
    Install LibreOffice and open the access database
    The mdb looks good. I prefer mdb over accdb (mdb has better meta data
    Access is a small databse product?
  8 SAS to MS Access


  9 SAS to Sqlite
    Install SQLite data base (has a nice command line option)
    Install User Interface DB Drowser
    Looks good in SQLite
 10 SQLite to SAS


github
https://tinyurl.com/ykvxnvuy
https://github.com/rogerjdeangelis/utl-sas-to-and-from-sqllite-excel-ms-access-spss-stata-using-r-packages-without-sas

Related
github
https://tinyurl.com/36zvd8w8
https://github.com/rogerjdeangelis/utl-without-ms-access-send-sas-dataset-to-access-subset-and-return-table-to-sas-rodbc

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

options validvarname=upcase;
libname sd1 "d:/sd1";
data sd1.have;
  set sashelp.class;
run;quit;

/*                   _
/ |  ___  __ _ ___  | |_ ___    ___ _ __  ___ ___
| | / __|/ _` / __| | __/ _ \  / __| `_ \/ __/ __|
| | \__ \ (_| \__ \ | || (_) | \__ \ |_) \__ \__ \
|_| |___/\__,_|___/  \__\___/  |___/ .__/|___/___/
                                   |_|
*/

%utl_rbegin;
parmcards4;
library(rio)
library(haven)
have <-read_sas("d:/sd1/have.sas7bdat")
export(have, "d:/sav/have.sav")
;;;;
%utl_rend;

/*----                                                                    ----*/
/*---- Check the SPSS file using the free PSPP ptoduct                    ----*/
/*---- after you install the SPSS clone,click on d:/sav/have.sav          ----*/
/*---- and you will get this screen in the free PSPP program              ----*/
/*----                                                                    ----*/

/**************************************************************************************************************************/
/*                                                                                                                        */
/* d:/sav/have.sav                                                                                                        */
/*                                                                                                                        */
/*  Viewing the output using the Free PSPP SPSS Clone                                                                     */
/*                                                                                                                        */
/*   File Edit View Data Transform Analyze Graphs Utilities Windows Help                                                  */
/*                                                                                                                        */
/*   +------------+-------------                                                                                          */
/*   |  1:NAME    |  ALFRED    |                                                                                          */
/*   +------------+------------+                                                                                          */
/*                                                                                                                        */
/*   +------+----------------------------------------------------------------+                                            */
/* 1 | CASE |  NAME      |   SEX      |    AGE     |  HEIGHT    |  WEIGHT    |                                            */
/*   +------+------------+------------+------------+------------+------------+                                            */
/* 2 |  1   | ALFRED     |    M       |    14      |    69      |  112.5     |                                            */
/*   +------+------------+------------+------------+------------+------------+                                            */
/*    ...    ...                                                                                                          */
/*   +------+------------+------------+------------+------------+------------+                                            */
/* N | 19   | WILLIAM    |    M       |    15      |   66.5     |  112       |                                            */
/*   +------+------------+------------+------------+------------+------------+                                            */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*___                        _
|___ \   ___ _ __  ___ ___  | |_ ___    ___  __ _ ___
  __) | / __| `_ \/ __/ __| | __/ _ \  / __|/ _` / __|
 / __/  \__ \ |_) \__ \__ \ | || (_) | \__ \ (_| \__ \
|_____| |___/ .__/|___/___/  \__\___/  |___/\__,_|___/
            |_|
*/

%utl_rbegin;
parmcards4;
library(rio)
source("c:/temp/fn_tosas9.R")
want <- import("d:/sav/have.sav")
fn_tosas9(dataf=want)
;;;;
%utl_rend;

libname tmp "c:/temp";
proc print data=tmp.want;
run;quit;

/**************************************************************************************************************************/
/*                                                                                                                        */
/* TMP.WANT total obs=19                                                                                                  */
/*                                                                                                                        */
/* Obs   ROWNAMES    NAME       SEX    AGE    HEIGHT    WEIGHT                                                            */
/*                                                                                                                        */
/*  1        1       Alfred      M      14     69.0      112.5                                                            */
/*  2        2       Alice       F      13     56.5       84.0                                                            */
/*  3        3       Barbara     F      13     65.3       98.0                                                            */
/*  4        4       Carol       F      14     62.8      102.5                                                            */
/*  5        5       Henry       M      14     63.5      102.5                                                            */
/*  6        6       James       M      12     57.3       83.0                                                            */
/*  ...                                                                                                                   */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*____                  _                            _
|___ /  ___  __ _ ___  | |_ ___     _____  _____ ___| |
  |_ \ / __|/ _` / __| | __/ _ \   / _ \ \/ / __/ _ \ |
 ___) |\__ \ (_| \__ \ | || (_) | |  __/>  < (_|  __/ |
|____/ |___/\__,_|___/  \__\___/   \___/_/\_\___\___|_|

*/

%utl_rbegin;
parmcards4;
library(rio)
library(haven)
have <-read_sas("d:/sd1/have.sas7bdat")
export(have, "d:/xls/want.xlsx")
;;;;
%utl_rend;

/**************************************************************************************************************************/
/*                                                                                                                        */
/*  D:/XLS/want.XLSX -- LibreOffice                                                                                                     */
/*                                                                                                                        */
/*                                                                                                                        */
/*   +----------------------------------------------------------------+                                                   */
/*   |     A      |    B       |     C      |    D       |    E       |                                                   */
/*   +----------------------------------------------------------------+                                                   */
/* 1 |  NAME      |   SEX      |    AGE     |  HEIGHT    |  WEIGHT    |                                                   */
/*   +------------+------------+------------+------------+------------+                                                   */
/* 2 | ALFRED     |    M       |    14      |    69      |  112.5     |                                                   */
/*   +------------+------------+------------+------------+------------+                                                   */
/*    ...                                                                                                                 */
/*   +------------+------------+------------+------------+------------+                                                   */
/* N | WILLIAM    |    M       |    15      |   66.5     |  112       |                                                   */
/*   +------------+------------+------------+------------+------------+                                                   */
/*                                                                                                                        */
/* [Sheet1]                                                                                                               */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*  _                      _   _
| || |    _____  _____ ___| | | |_ ___    ___  __ _ ___
| || |_  / _ \ \/ / __/ _ \ | | __/ _ \  / __|/ _` / __|
|__   _||  __/>  < (_|  __/ | | || (_) | \__ \ (_| \__ \
   |_|   \___/_/\_\___\___|_|  \__\___/  |___/\__,_|___/

*/

%utl_rbegin;
parmcards4;
library(rio)
library(haven)
source("c:/temp/fn_tosas9.R")
want <- import("d:/xls/want.xlsx")
fn_tosas9(dataf=want)
;;;;
%utl_rend;

libname tmp "c:/temp";
proc print data=tmp.want;
run;quit;

/**************************************************************************************************************************/
/*                                                                                                                        */
/* TMP.WANT total obs=19                                                                                                  */
/*                                                                                                                        */
/* Obs   ROWNAMES    NAME       SEX    AGE    HEIGHT    WEIGHT                                                            */
/*                                                                                                                        */
/*  1        1       Alfred      M      14     69.0      112.5                                                            */
/*  2        2       Alice       F      13     56.5       84.0                                                            */
/*  3        3       Barbara     F      13     65.3       98.0                                                            */
/*  4        4       Carol       F      14     62.8      102.5                                                            */
/*  5        5       Henry       M      14     63.5      102.5                                                            */
/*  6        6       James       M      12     57.3       83.0                                                            */
/*  ...                                                                                                                   */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*___                  _              _        _
| ___| ___  __ _ ___  | |_ ___    ___| |_ __ _| |_ __ _
|___ \/ __|/ _` / __| | __/ _ \  / __| __/ _` | __/ _` |
 ___) \__ \ (_| \__ \ | || (_) | \__ \ || (_| | || (_| |
|____/|___/\__,_|___/  \__\___/  |___/\__\__,_|\__\__,_|

*/

%utl_rbegin;
parmcards4;
library(rio)
library(haven)
have <-read_sas("d:/sd1/have.sas7bdat")
export(have, "d:/dta/want.dta")
;;;;
%utl_rend;

/*            _                 _               _
| |_ ___  ___| |_    ___  _   _| |_ _ __  _   _| |_
| __/ _ \/ __| __|  / _ \| | | | __| `_ \| | | | __|
| ||  __/\__ \ |_  | (_) | |_| | |_| |_) | |_| | |_
 \__\___||___/\__|  \___/ \__,_|\__| .__/ \__,_|\__|
                                   |_|
*/

/*----                                                                   ----*/
/*---- after you install gretl https://sourceforge.net/projects/gretl/   ----*/
/*---- fireup gretl packages file->open navigate to c:/dta.want.dta      ----*/
/*---- list of variables will appear                                     ----*/
/*---- select file->export->select space delimited output                ----*/
/*---- and save i d:/txt/want.txt                                        ----*/
/*----                                                                   ----*/

/**************************************************************************************************************************/
/*                                                                                                                        */
/* d:/dta/want.dta                                                                                                        */
/*                                                                                                                        */
/* NAME SEX AGE HEIGHT WEIGHT                                                                                             */
/* "Alfred" "M" 14 69 112.5                                                                                               */
/* "Alice" "F" 13 56.5 84                                                                                                 */
/* "Barbara" "F" 13 65.3 98                                                                                               */
/* "Carol" "F" 14 62.8 102.5                                                                                              */
/* ...                                                                                                                    */
/* "Thomas" "M" 11 57.5 85                                                                                                */
/* "William" "M" 15 66.5 112                                                                                              */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*__         _        _          _
 / /_    ___| |_ __ _| |_ __ _  | |_ ___    ___  __ _ ___
| `_ \  / __| __/ _` | __/ _` | | __/ _ \  / __|/ _` / __|
| (_) | \__ \ || (_| | || (_| | | || (_) | \__ \ (_| \__ \
 \___/  |___/\__\__,_|\__\__,_|  \__\___/  |___/\__,_|___/

*/

%utlfkil(c:/tmp/want.sas7bdat);

%utl_rbegin;
parmcards4;
library(rio)
library(haven)
source("c:/temp/fn_tosas9.R")
want <- import("d:/dta/want.dta")
fn_tosas9(dataf=want)
;;;;
%utl_rend;

libname tmp "c:/temp";
proc print data=tmp.want;
run;quit;


/**************************************************************************************************************************/
/*                                                                                                                        */
/* TMP.WANT total obs=19                                                                                                  */
/*                                                                                                                        */
/* Obs   ROWNAMES    NAME       SEX    AGE    HEIGHT    WEIGHT                                                            */
/*                                                                                                                        */
/*  1        1       Alfred      M      14     69.0      112.5                                                            */
/*  2        2       Alice       F      13     56.5       84.0                                                            */
/*  3        3       Barbara     F      13     65.3       98.0                                                            */
/*  4        4       Carol       F      14     62.8      102.5                                                            */
/*  5        5       Henry       M      14     63.5      102.5                                                            */
/*  6        6       James       M      12     57.3       83.0                                                            */
/*  ...                                                                                                                   */
/*                                                                                                                        */
/**************************************************************************************************************************/

  ____                  _
|___  | ___  __ _ ___  | |_ ___    _ __ ___  ___    __ _  ___ ___ ___  ___ ___
   / / / __|/ _` / __| | __/ _ \  | `_ ` _ \/ __|  / _` |/ __/ __/ _ \/ __/ __|
  / /  \__ \ (_| \__ \ | || (_) | | | | | | \__ \ | (_| | (_| (_|  __/\__ \__ \
 /_/   |___/\__,_|___/  \__\___/  |_| |_| |_|___/  \__,_|\___\___\___||___/___/
 _ __  _ __ ___ _ __
| `_ \| `__/ _ \ `_ \
| |_) | | |  __/ |_) |
| .__/|_|  \___| .__/
|_|            |_|
*/

/*----                                                                   ----*/
/*----  create windows MS Access Driversdrivers                          ----*/
/*----                                                                   ----*/

%utl_submit_ps64('
Add-OdbcDsn -Name "have" -DriverName "Microsoft Access Driver (*.mdb, *.accdb)" -DsnType "User" -Platform "64-bit" -SetPropertyValue "Dbq=d:/mdb/simle.mdb
Get-OdbcDsn;
');
%utl_submit_ps64('
Add-OdbcDsn -Name "have" -DriverName "Microsoft Access Driver (*.mdb, *.accdb)" -DsnType "User" -Platform "32-bit" -SetPropertyValue "Dbq=d:/mdb/simle.mdb
Get-OdbcDsn;
');

/*----                                                                   ----*/
/*---- Because MS Access has changed the layout                          ----*/
/*---- of access databases many times you need to use                    ----*/
/*---- the simple.mdb that SAS provides or                               ----*/
/*---- get one off the net. Should also work with accdb.                 ----*/
/*----                                                                   ----*/
/*---- download simple.mdb from github                                   ----*/
/*----                                                                   ----*/

%utlfkil(d:/mdb/simple.mdb);
filename out "d:/mdb/simple.mdb";
proc http
  method = 'GET'
  url    = "https://tinyurl.com/yaxa7nty"
  out    =  out;
run;quit;

/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/

%utl_rbeginx;
parmcards4;
library(RODBC);
library(haven);
have<-read_sas("d:/sd1/have.sas7bdat");
myDB<-odbcDriverConnect("Driver={Microsoft Access Driver (*.mdb, *.accdb)};DBQ=d:/mdb/simple.mdb");
sqlQuery(myDB, paste("drop table have"));
sqlSave(myDB,have,rownames=FALSE);
;;;;
%utl_rendx;

/*            _                 _               _
| |_ ___  ___| |_    ___  _   _| |_ _ __  _   _| |_
| __/ _ \/ __| __|  / _ \| | | | __| `_ \| | | | __|
| ||  __/\__ \ |_  | (_) | |_| | |_| |_) | |_| | |_
 \__\___||___/\__|  \___/ \__,_|\__| .__/ \__,_|\__|
                                   |_|
*/

/*----                                                                   ----*/
/*---- Install LibreOffice and open a new odb database                   ----*/
/*---- Click on File Open                                                ----*/
/*---- navigate to d:/mdb/want.mdb and click on it                       ----*/
/*---- You may get a pop up that the mdb is corrupt, ignore it           ----*/
/*---- You are only intersested in the simplest for for a table          ----*/
/*---- No need for keys, foreging keys, triggers, schema...              ----*/
/*---- Click on the have table                                           ----*/
/*----                                                                   ----*/


/**************************************************************************************************************************/
/*                                                                                                                        */
/* d:/mdb/have.mdb                                                                                                        */
/*  _                                                                                                                     */
/* [_] have New datrabase -- LibreOffice Base Table Data View                                                             */
/*                                                                                                                        */
/*   File Edit View Insert Data Tools Window Help                                                                         */
/*                                                                                                                        */
/* +------+----------------------------------------------------------------+                                              */
/* |      |  NAME      |   SEX      |    AGE     |  HEIGHT    |  WEIGHT    |                                              */
/* +------+------------+------------+------------+------------+------------+                                              */
/* |      | ALFRED     |    M       |    14      |    69      |  112.5     |                                              */
/* +------+------------+------------+------------+------------+------------+                                              */
/*  ...    ...                                                                                                            */
/* +------+------------+------------+------------+------------+------------+                                              */
/* |      | WILLIAM    |    M       |    15      |   66.5     |  112       |                                              */
/* +------+------------+------------+------------+------------+------------+                                              */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*___                                                 _
 ( _ )  _ __ ___  ___    __ _  ___ ___ ___  ___ ___  | |_ ___    ___  __ _ ___
 / _ \ | `_ ` _ \/ __|  / _` |/ __/ __/ _ \/ __/ __| | __/ _ \  / __|/ _` / __|
| (_) || | | | | \__ \ | (_| | (_| (_|  __/\__ \__ \ | || (_) | \__ \ (_| \__ \
 \___/ |_| |_| |_|___/  \__,_|\___\___\___||___/___/  \__\___/  |___/\__,_|___/
*/

%utl_rbeginx;
parmcards4;
library(RODBC);
source("c:/temp/fn_tosas9.R");
myDB<-odbcDriverConnect("Driver={Microsoft Access Driver (*.mdb, *.accdb)};DBQ=d:/mdb/simple.mdb");
want<-sqlQuery(myDB, paste("select * from have"));
want;
fn_tosas9(dataf=want);
str(want);
;;;;
%utl_rendx;

libname tmp "c:/temp";
proc print data=tmp.want;
run;quit;

/**************************************************************************************************************************/
/*                                                                                                                        */
/* TMP.WANT total obs=19                                                                                                  */
/*                                                                                                                        */
/* Obs   ROWNAMES    NAME       SEX    AGE    HEIGHT    WEIGHT                                                            */
/*                                                                                                                        */
/*  1        1       Alfred      M      14     69.0      112.5                                                            */
/*  2        2       Alice       F      13     56.5       84.0                                                            */
/*  3        3       Barbara     F      13     65.3       98.0                                                            */
/*  4        4       Carol       F      14     62.8      102.5                                                            */
/*  5        5       Henry       M      14     63.5      102.5                                                            */
/*  6        6       James       M      12     57.3       83.0                                                            */
/*  ...                                                                                                                   */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*___                    _                    _ _ _       _____
 / _ \   ___  __ _ ___  | |_ ___    ___  __ _| (_) |_ ___|___ /
| (_) | / __|/ _` / __| | __/ _ \  / __|/ _` | | | __/ _ \ |_ \
 \__, | \__ \ (_| \__ \ | || (_) | \__ \ (_| | | | ||  __/___) |
   /_/  |___/\__,_|___/  \__\___/  |___/\__, |_|_|\__\___|____/
                                           |_|
*/

%utl_rbeginx;
parmcards4;
library(DBI)
library(RSQLite)
library(haven)
have<-read_sas("d:/sd1/have.sas7bdat")
con <- dbConnect(RSQLite::SQLite(), "d:/sqlite/have.db")
dbWriteTable(con, "d:/sqlite/have.db", have)
dbListTables(con)
dbDisconnect(con)
;;;;
%utl_rendx;

/*            _              _ _   _                 _ _ _            _       _        _
| |_ ___  ___| |_  __      _(_) |_| |__    ___  __ _| (_) |_ ___   __| | __ _| |_ __ _| |__   __ _ ___  ___
| __/ _ \/ __| __| \ \ /\ / / | __| `_ \  / __|/ _` | | | __/ _ \ / _` |/ _` | __/ _` | `_ \ / _` / __|/ _ \
| ||  __/\__ \ |_   \ V  V /| | |_| | | | \__ \ (_| | | | ||  __/  (_| | (_| | || (_| | |_) | (_| \__ \  __/
 \__\___||___/\__|   \_/\_/ |_|\__|_| |_| |___/\__, |_|_|\__\___| \__,_|\__,_|\__\__,_|_.__/ \__,_|___/\___|
                                                  |_|
 _ __  _ __ ___ _ __
| `_ \| `__/ _ \ `_ \
| |_) | | |  __/ |_) |
| .__/|_|  \___| .__/
|_|            |_|
*/


INSTALL SQLITE DATABSE (4MB)
============================

This is why they call it lite, not really lite?

C:\SQLITE

  download 64bit zip files
  https://www.sqlite.org/download.html

    sqlite-dll-win-x64-3450300.zip
    sqlite-tools-win-x64-3450300.zip

  Unzip you should get

    sqldiff.exe
    sqlite3.def
    sqlite3.dll
    sqlite3.exe
    sqlite3_analyzer.exe

Add c:/sqlite to your PATH enviroment variable
after run 'refreshenv' fram any command window

INSTALL USER INTERFACE
======================

  https://sqlitebrowser.org/dl/
  DB.Browser.for.SQLite-3.12.2-win64.msi

Add C:\Program Files\DB Browser for SQLite to your PATH enviroment variable
after run 'refreshenv' fram any command window

/**************************************************************************************************************************/
/*                                                                                                                        */
/* Open DB Browser by typing "DB Browser for SQLite" you need the quotes in any command window.                           */
/* You can create a shortcut                                                                                              */
/* file->open database                                                                                                    */
/* Navigate to d:/sqlite/have.db                                                                                          */
/* I list of variables will appear                                                                                        */
/* Click on browse data                                                                                                   */
/*                                                                                                                        */
/*    DB BROWSER SCREEN SHOT                                                                                              */
/*                                                                                                                        */
/*   +-------------------------------------------------------------------------------------------------------------+      */
/*   |                                                                                                             |      */
/*   | DB Browser for SQLite =d:/sqlite/have.db                                                                    |      */
/*   |                                                                                                             |      */
/*   | File Edit View Tools Help                                                                                   |      */
/*   |                                                                                                             |      */
/*   | New Database Open Database Write Changes Rever Changes Undo Open Project SAttach Database Close Databas     |      */
/*   |                                                                                                             |      */
/*   | Database Structure Browse Data Edit Pragmas Execute SQL                                                     |      */
/*   |                    -----------                                                                              |      */
/*   | Table  d:/sqlite/have.db  "Bunch of icons"                                                                  |      */
/*   |                                                                                                             |      */
/*   |                                                                                                             |      */
/*   |    +----------------------------------------------------------------+                                       |      */
/*   |  1 |  NAME      |   SEX      |    AGE     |  HEIGHT    |  WEIGHT    |                                       |      */
/*   |    +----------------------------------------------------------------+                                       |      */
/*   |    |  Filter    |  Filter    |  Filter    |   Filter   |   Filter   |                                       |      */
/*   |    +------------+------------+------------+------------+------------+                                       |      */
/*   |  2 | ALFRED     |    M       |    14      |    69      |  112.5     |                                       |      */
/*   |    +------------+------------+------------+------------+------------+                                       |      */
/*   |     ...                                                                                                     |      */
/*   |    +------------+------------+------------+------------+------------+                                       |      */
/*   | 19 | WILLIAM    |    M       |    15      |   66.5     |  112       |                                       |      */
/*   |    +------------+------------+------------+------------+------------+                                       |      */
/*   |                                                                                                             |      */
/*   |   |< < 19 of 19    Go To 1      SQL Log  Plot DB Schema  Remote UTF-8                                       |      */
/*   |                                                                                                             |      */
/*   |-------------------------------------------------------------------------------------------------------------+      */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*  ___              _ _ _         _
/ |/ _ \   ___  __ _| (_) |_ ___  | |_ ___    ___  __ _ ___
| | | | | / __|/ _` | | | __/ _ \ | __/ _ \  / __|/ _` / __|
| | |_| | \__ \ (_| | | | ||  __/ | || (_) | \__ \ (_| \__ \
|_|\___/  |___/\__, |_|_|\__\___|  \__\___/  |___/\__,_|___/
                  |_|
*/

%utl_rbeginx;
parmcards4;
library(DBI)
library(RSQLite)
con <- dbConnect(RSQLite::SQLite(), "d:/sqlite/have.db")
want <- dbReadTable(conn, "have")
want;
dbDisconnect(con)
;;;;
%utl_rendx;

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
