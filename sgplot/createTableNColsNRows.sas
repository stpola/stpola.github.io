/* Create a table with 1000 rows and 120 columns */

data STANLIB.cols120 (DROP = i j);
array results (120) res1-res120;
	do i = 1 to 1000;
		do j = 1 to 120;
			results(j) = i *rand("ERLANG",1);
		end;
	output;
    end;
run;