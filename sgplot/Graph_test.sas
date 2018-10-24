/* Note: on Unix systems, this program will give warnings as follows:
WARNING: The font Times New Roman is not available. Albany AMT will be used.
See http://sww.sas.com/ds/DefectsSearch/S1070/S1070535.html  */

goptions ftext='Albany AMT' ftitle='Albany AMT';  

title1 h=13pt c=blue "Release is &sysvlong";
proc gslide;
run;
quit;

data anno;
  function='label'; 
  xsys='3'; ysys='3'; 
  x=50;y=50;
  size=3; 
  text="Release is &sysvlong";
  output;
run;

proc ganno annotate=anno;
run;
quit;

data one;
   do x=1 to 10;
     x1=ranuni(0);
     y=ranuni(1);
     z=x;
   output;
   end;
run;

title1 "Release is &sysvlong";
symbol1 i=none v=dot;  
proc gplot;
  plot y*x;
run;
quit;

proc gchart;
  vbar x / discrete sumvar=y subgroup=x nolegend;  
run;
quit;

proc g3grid data=one out=two;
  grid y*x1=z;
run;
quit;

proc g3d data=one;
  scatter y*x1=z;
run;
quit;

proc g3d data=two;
  plot y*x1=z;
run;
quit;

proc gcontour data=two;
  plot y*x1=z;
run;
quit;

proc gproject data=maps.states out=state;
  id state;
run;

proc sort data=state;
  by state; run; 

data state1; 
  set state;
  by state; 
  if first.state then output; 
run;

proc gmap data=state1 map=state;
  id state;
  choro state/nolegend;
run;
quit;

proc greplay nofs igout=work.gseg;
  replay g3d;
run;
quit;

proc greplay nofs igout=work.gseg tc=sashelp.templt 
   template=l2r2;
   treplay 1:gmap 2:gcontour 3:1 4:4;
run;
quit;

data sample;
  do mid='A','B','C';
     resp=ranuni(0)*100;
     output;
  end;
run;

proc gradar;
  chart mid / sumvar=resp;
run;
quit;

data sample;
do mid='A','B','C';
   resp=ranuni(0)*100;
   num=ranuni(0)*10;
   output;
end;
run;

proc gbarline;
  bar mid / sumvar=resp;
  plot / sumvar=num;
run;
quit;

proc sgplot data=sashelp.class;
  scatter x=height y=weight / group=sex datalabel=age;
  discretelegend;
  xaxis  valueattrs=(family='Albany AMT' size=12 weight=bold); 
  yaxis  labelattrs=(family='Albany AMT' size=12 weight=bold); 
run;
quit;

proc sgscatter data=sashelp.iris;
  title "Scatterplot Matrix for Iris Data";
  matrix sepallength petallength sepalwidth petalwidth
         / group=species;
run;

proc sort data=sashelp.heart out=heart; 
  by smoking_status; 
run; 

title1 "Cholesterol Distribution in Heart Study"; 
proc sgpanel data=heart noautolegend;
   panelby sex; 
   histogram cholesterol;
   density cholesterol;
   by smoking_status; 
run; 


proc template;
      define statgraph Scatter;
         begingraph;
            entrytitle "Simple Scatter Plot of the Class Data Set";
            layout overlay;
               scatterplot y=weight x=height / datalabel=name;
            endlayout;
         endgraph;
      end;
   run;
   
proc sgrender data=sashelp.class template=scatter;
run;
