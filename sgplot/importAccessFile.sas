/*	Example of using SAS LIBNAME using SAS PC Files Server (installed on client Windows PC)
	to read a MS Access database as if it were a SAS dataset */
LIBNAME myaccdb PCFILES PORT=9621 SERVER=D79905 PATH='c:\Users\stpola\Documents\37ImportCars.accdb';

/*	Example of using SAS LIBNAME using MS Access Runtime 2013 (installed on server)
	to read a MS Access database as if it were a SAS dataset */
LIBNAME myaccdb ACCESS PATH='C:/Users/stpola/Documents/My SAS Files/9.4/37test/37ImportCars.accdb';

PROC DATASETS LIBRARY=myaccdb;
QUIT;

/*	Example of PROC IMPORT that works with SAS Studio 3.7 Basic for Linux; 
	requires 'SAS PC Files Server' to be installed on Windows client */
PROC IMPORT
	DBMS=ACCESSCS DATATABLE='cars' OUT=CARSACCESS REPLACE;
	DATABASE='c:\Users\stpola\Documents\37ImportCars.accdb';
	SERVER='d79905.na.sas.com';
	PORT=9621;
RUN;

/*	Example of PROC IMPORT that works with SAS Studio 3.7 Enterprise/Windows; 
	requires 'Microsoft Access Runtime 2013' to be installed on Windows server */
PROC IMPORT DATATABLE="cars"
	DBMS=ACCESS
	OUT=WORK.mycars;
	DATABASE="C:/Users/stpola/Documents/My SAS Files/9.4/37test/37ImportTest1.accdb";
RUN;

PROC CONTENTS DATA=WORK.mycars; RUN;