/* Sample 56933: Display special symbols as axis values using PROC FORMAT with PROC SGPLOT */
/* http://support.sas.com/kb/56/933.html */
proc format;
   value agefmt
   20-30 = "20 (*ESC*){unicode '2264'x} 30"
   31-40 = "31 (*ESC*){unicode '2264'x} 40"
   41-50 = "41 (*ESC*){unicode '2264'x} 50"
   51-60 = "51 (*ESC*){unicode '2264'x} 60"
   61-70 = "61 (*ESC*){unicode '2264'x} 70"
   ;
run;

proc sgplot data=sashelp.heart noautolegend;
   title1 "Cholesterol Level by Age Range";
   styleattrs datacolors=(red green purple orange cyan) backcolor=vpav wallcolor=pwh;
   vbox cholesterol / category=AgeAtStart group=AgeAtStart;
   format AgeAtStart agefmt.;
run;