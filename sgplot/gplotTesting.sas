title "Testing Gplot";
proc gplot data=sashelp.class;
plot height*weight;
run;
quit;