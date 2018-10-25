proc template;
	define statgraph inset;
		begingraph;
		entrytitle 'Framingham Heart Study';
		layout overlay;
			histogram cholesterol / binaxis=false datatransparency=0.5 
				display=(fillpattern outline fill) fillattrs=(color=lightred) 
				fillpatternattrs=(pattern=l3 color=red);
				densityplot cholesterol / datatransparency=0.5 lineattrs=(color=darkred);
			layout gridded / width=300px height=200px halign=right valign=top;
				layout overlay / yaxisopts=(label='Blood Pressure' 
					linearopts=(thresholdmax=1)) xaxisopts=(linearopts=(thresholdmax=1));
					regressionplot x=cholesterol y=diastolic / lineattrs=(color=blue pattern=2) 
					name='Diastolic';
					regressionplot x=cholesterol y=systolic / lineattrs=(color=green) 
					name='Systolic';
					discretelegend 'Diastolic' 'Systolic' / across=2;
				endlayout;
			endlayout;
		endlayout;
		endgraph;
	end;
run;

proc sgrender data=sashelp.heart template=inset;
run;
