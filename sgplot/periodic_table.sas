%let name=periodic_table;
filename odsout '.';

%let cellwidth=1.1;
%let cellheight=1.2;
%let gap=.05;

/*
This example creates a periodic table using SAS/Graph gmap & annotate,
and allows the coloring of the cells in the table to be controlled by 
the 'color' variable, and the text to be controlled via the 'text' variable.
The numbering for the rows & columns of the table starts at the bottom/left 
corner (since that's the origin of gmap's coordinate system).
*/

data table_data;
infile datalines pad truncover;
input column row number $ 10-12 abbreviation $ 14-16 element $ 18-33 description $ 35-100;
datalines;
 1 10      1   H Hydrogen         Nonmetals, Primordial, Gas
 1  9      3  Li Lithium          Alkali metals, Primordial, Solid
 1  8     11  Na Sodium           Alkali metals, Primordial, Solid
 1  7     19   K Potassium        Alkali metals, Primordial, Solid
 1  6     37  Rb Rubidium         Alkali metals, Primordial, Solid
 1  5     55  Cs Caesium          Alkali metals, Primordial, Solid
 1  4     87  Fr Francium         Alkali metals, Natural radio, Solid
 2  9      4  Be Beryllium        Alkaline earth metals, Primordial, Solid
 2  8     12  Mg Magnesium        Alkaline earth metals, Primordial, Solid
 2  7     20  Ca Calcium          Alkaline earth metals, Primordial, Solid
 2  6     38  Sr Strontium        Alkaline earth metals, Primordial, Solid
 2  5     56  Ba Barium           Alkaline earth metals, Primordial, Solid
 2  4     88  Ra Radium           Alkaline earth metals, Natural radio, Solid
 3  7     21  Sc Scandium         Transition metals, Primordial, Solid
 4  7     22  Ti Titanium         Transition metals, Primordial, Solid
 5  7     23   V Vanadium         Transition metals, Primordial, Solid
 6  7     24  Cr Chromium         Transition metals, Primordial, Solid
 7  7     25  Mn Manganese        Transition metals, Primordial, Solid
 8  7     26  Fe Iron             Transition metals, Primordial, Solid
 9  7     27  Co Cobalt           Transition metals, Primordial, Solid
10  7     28  Ni Nickel           Transition metals, Primordial, Solid
11  7     29  Cu Copper           Transition metals, Primordial, Solid
12  7     30  Zn Zinc             Transition metals, Primordial, Solid
 3  6     39   Y Yttrium          Transition metals, Primordial, Solid
 4  6     40  Zr Zirconium        Transition metals, Primordial, Solid
 5  6     41  Nb Niobium          Transition metals, Primordial, Solid
 6  6     42  Mo Molybdenum       Transition metals, Primordial, Solid
 7  6     43  Tc Technetium       Transition metals, Natural radio, Solid
 8  6     44  Ru Ruthenium        Transition metals, Primordial, Solid
 9  6     45  Rh Rhodium          Transition metals, Primordial, Solid
10  6     46  Pd Palladium        Transition metals, Primordial, Solid
11  6     47  Ag Silver           Transition metals, Primordial, Solid
12  6     48  Cd Cadmium          Transition metals, Primordial, Solid
 4  5     72  Hf Hafnium          Transition metals, Primordial, Solid
 5  5     73  Ta Tantalum         Transition metals, Primordial, Solid
 6  5     74   W Tungsten         Transition metals, Primordial, Solid
 7  5     75  Re Rhenium          Transition metals, Primordial, Solid
 8  5     76  Os Osmiumm          Transition metals, Primordial, Solid
 9  5     77  Ir Iridium          Transition metals, Primordial, Solid
10  5     78  Pt Platinum         Transition metals, Primordial, Solid
11  5     79  Au Gold             Transition metals, Primordial, Solid
12  5     80  Hg Mercury          Transition metals, Primordial, Liquid
 4  4    104  Rf Rutherfordium    Transition metals, Synthetic, UnknownPhase
 5  4    105  Db Dubnium          Transition metals, Synthetic, UnknownPhase
 6  4    106  Sg Seaborgium       Transition metals, Synthetic, UnknownPhase
 7  4    107  Bh Bohrium          Transition metals, Synthetic, UnknownPhase
 8  4    108  Hs Hassium          Transition metals, Synthetic, UnknownPhase
 9  4    109  Mt Meitnerium       Unknown chemical properties, Synthetic, UnknownPhase
10  4    110  Ds Darmstadtium     Unknown chemical properties, Synthetic, UnknownPhase
11  4    111  Rg Roentgenium      Unknown chemical properties, Synthetic, UnknownPhase
12  4    112  Cn Copernicium      Transition metals, Synthetic, UnknownPhase
13  8     13  Al Aluminium        Poor metals, Primordial, Solid
13  7     31  Ga Gallium          Poor metals, Primordial, Solid
13  6     49  In Indium           Poor metals, Primordial, Solid
13  5     81  Tl Thallium         Poor metals, Primordial, Solid
14  6     50  Sn Tin              Poor metals, Primordial, Solid
14  5     82  Pb Lead             Poor metals, Primordial, Solid
15  5     83  Bi Bismuth          Poor metals, Primordial, Solid
13  4    113 Uut Ununtrium        Unknown chemical properties, Synthetic, UnknownPhase
14  4    114 Uuq Ununquadium      Unknown chemical properties, Synthetic, UnknownPhase
15  4    115 Uup Ununpentium      Unknown chemical properties, Synthetic, UnknownPhase
16  4    116 Uuh Ununhexium       Unknown chemical properties, Synthetic, UnknownPhase
17  4    117 Uus Ununseptium      Unknown chemical properties, Synthetic, UnknownPhase
18  4    118 Uuo Ununoctium       Unknown chemical properties, Synthetic, UnknownPhase
18 10      2  He Helium           Noble gases, Primordial, Gas
18  9     10  Ne Neon             Noble gases, Primordial, Gas
18  8     18  Ar Argon            Noble gases, Primordial, Gas
18  7     36  Kr Krypton          Noble gases, Primordial, Gas
18  6     54  Xe Xenon            Noble gases, Primordial, Gas
18  5     86  Rn Radon            Noble gases, Natural radio, Gas
17  9      9   F Fluorine         Halogens, Primordial, Gas    
17  8     17  Cl Chlorine         Halogens, Primordial, Gas    
17  7     35  Br Bromine          Halogens, Primordial, Liquid    
17  6     53   I Iodine           Halogens, Primordial, Solid    
17  5     85  At Astatine         Halogens, Natural radio, Solid    
16  9      8   O Oxygen           Nonmetals, Primordial, Gas    
16  8     16   S Sulfur           Nonmetals, Primordial, Solid    
16  7     34  Se Selenium         Nonmetals, Primordial, Solid    
15  9      7   N Nitrogen         Nonmetals, Primordial, Gas    
15  8     15   P Phosphorous      Nonmetals, Primordial, Solid    
14  9      6   C Carbon           Nonmetals, Primordial, Solid    
13  9      5   B Boron            Metalloids, Primordial, Solid    
14  8     14  Si Silicon          Metalloids, Primordial, Solid    
14  7     32  Ge Germanium        Metalloids, Primordial, Solid    
15  7     33  As Arsenic          Metalloids, Primordial, Solid    
15  6     51  Sb Antimony         Metalloids, Primordial, Solid    
16  6     52  Te Tellurium        Metalloids, Primordial, Solid    
16  5     84  Po Polonium         Metalloids, Natural radio, Solid    
 3  2     57  La Lanthanum        Lanthanoids, Primordial, Solid
 4  2     58  Ce Cerium           Lanthanoids, Primordial, Solid
 5  2     59  Pr Praseodynium     Lanthanoids, Primordial, Solid
 6  2     60  Nd Neodymium        Lanthanoids, Primordial, Solid
 7  2     61  Pm Promethium       Lanthanoids, Natural radio, Solid
 8  2     62  Sm Samurium         Lanthanoids, Primordial, Solid
 9  2     63  Eu Europium         Lanthanoids, Primordial, Solid
10  2     64  Gd Gadolinium       Lanthanoids, Primordial, Solid
11  2     65  Tb Terbium          Lanthanoids, Primordial, Solid
12  2     66  Dy Dysprosium       Lanthanoids, Primordial, Solid
13  2     67  Ho Holium           Lanthanoids, Primordial, Solid
14  2     68  Er Erbium           Lanthanoids, Primordial, Solid
15  2     69  Tm Thulium          Lanthanoids, Primordial, Solid
16  2     70  Yb Ytterbium        Lanthanoids, Primordial, Solid
17  2     71  Lu Lutetium         Lanthanoids, Primordial, Solid
 3  1     89  Ac Actinium         Actinoids, Natural radio, Solid
 4  1     90  Th Thorium          Actinoids, Primordial, Solid
 5  1     91  Pa Protactinium     Actinoids, Natural radio, Solid
 6  1     92   U Uranium          Actinoids, Primordial, Solid
 7  1     93  Np Neptunium        Actinoids, Natural radio, Solid
 8  1     94  Pu Plutonium        Actinoids, Primordial, Solid
 9  1     95  Am Americium        Actinoids, Synthetic, Solid
10  1     96  Cm Curium           Actinoids, Synthetic, Solid
11  1     97  Bk Berkelium        Actinoids, Synthetic, Solid
12  1     98  Cf Californium      Actinoids, Synthetic, Solid
13  1     99  Es Einsteinium      Actinoids, Synthetic, Solid
14  1    100  Fm Fermium          Actinoids, Synthetic, Solid
15  1    101  Md Mendelevium      Actinoids, Synthetic, Solid
16  1    102  No Nobelium         Actinoids, Synthetic, Solid
17  1    103  Lr Lawrencium       Actinoids, Synthetic, Solid
;
run;

data table_data; set table_data;
length cell_id $20;
cell_id=trim(left(row))||'_'||trim(left(column));
length category $100;
category=trim(left(scan(description,1,',')));
length my_html $1000;
my_html='title='||quote(
 trim(left(element))||','||'0d'x||
 'Atomic Number: '||trim(left(number))||','||'0d'x||
 trim(left(description))
 )
 ||' href='||quote('http://en.wikipedia.org/wiki/'||trim(left(element)))
 ;
run;

/* 
Create the geometry (4 corners for each cell in the table)
for the SAS/Graph gmap.
*/
data table_map; set table_data;
x=column*&cellwidth; y=row*&cellheight; output;
x=x+&cellwidth; output;
y=y+&cellheight; output;
x=x-&cellwidth; output;
run;

data anno_color; 
length function color $8 style $20;
 set table_data;
xsys='2'; ysys='2'; 
/* Annotate a colored bar behind the cell.  */
when='b'; 
function='move'; x=column*&cellwidth; y=row*&cellheight; output;
function='bar'; style='solid'; x=x+&cellwidth-&gap; y=y+&cellheight-&gap; 
 color=cell_color; 
     if category='Alkali metals' then color='cxff6666';
else if category='Alkaline earth metals' then color='cxffdead';
else if category='Inner transition metals' then color='cxeeeeee';
else if category='Lanthanoids' then color='cxffbfff';
else if category='Actinoids' then color='cxff99cc';
else if category='Transition metals' then color='cxffc0c0';
else if category='Poor metals' then color='cxcccccc';
else if category='Metalloids' then color='cxcccc99';
else if category='Nonmetals' then color='cxa0ffa0';
else if category='Halogens' then color='cxffff99';
else if category='Noble gases' then color='cxc0ffff';
else if category='Unknown chemical properties' then color='cxe8e8e8';
else color='cyan';
 output;
/* Annotate the appropriate border around each element's colored box */
when='a'; 
function='move'; x=column*&cellwidth; y=row*&cellheight; output;

/* set the border line type */
if index(description,'Natural radio')^=0 then line=3; /* dash */
else if index(description,'UnknownPhase')^=0 then line=33; /* dotted */
else if ( index(description,'Actinoids')^=0 and ((number>=95) and (number<=103)) ) then line=33;
else line=1; /* solid */

/* set the border color */
if index(description,'Natural radio')^=0 then color='cx773300'; /* brown-ish dashes */
else if index(description,'UnknownPhase')^=0 then color='cx7ab3f7'; /* blue dots */
else if ( index(description,'Actinoids')^=0 and ((number>=95) and (number<=103)) ) then color='cx7ab3f7'; /* blue dots */
else color='cx8811ff';  /* purple */

function='draw'; 
x=x+&cellwidth-&gap; output;
y=y+&cellheight-&gap; output;
x=x-&cellwidth+&gap; output;
y=y-&cellheight+&gap; output;
run;

/* 
Annotate the text values for each cell, at the center of each x/y gmap area.
*/
proc sql;
create table anno_text as 
select unique cell_id, avg(x) as x_center, avg(y) as y_center, number, abbreviation, description
from table_map
group by cell_id;
quit; run;
data anno_text; 
length function color $8 style $20;
 set anno_text;
xsys='2'; ysys='2'; when='a'; 
function='label'; 
x=x_center;
/* the annotate 'position' didn't provide enough flexibility,
   so I also added a little offset, using the &gap macro variable
*/
position='b'; y=y_center+&gap;
style="albany amt"; text=trim(left(number));
 if index(description,'Gas')^=0 then color='red'; 
 else if index(description,'Liquid')^=0 then color='green'; 
 else if index(description,'Solid')^=0 then color='black'; 
 else color='gray';
 output;
position='e'; y=y_center-&gap;
style="albany amt/bold"; text=trim(left(abbreviation)); 
 color='cx0645ad';
 output;
run;

data anno_all; set anno_color anno_text;
run;


/* 
You will need to set the size & proportions of the page big enough
to accommodate the number of rows & columns in your table (you might
even want to do this dynamically, via counting the number of rows & 
columns, and setting macro variables, and using those in the xpixels
and ypixels, if your data changes a lot ...
*/


goptions gunit=pct htitle=4.5 htext=2.2 ftitle="albany amt/bold" ftext="albany amt";
 
goptions border cback=cxf7f7e9;
pattern1 c=white v=empty repeat=1000;

title1 ls=1.5 "Periodic Table";
title2 a=90 h=3pct " ";
title3 a=-90 h=3pct " ";

footnote1 h=2.8 c=gray55 "mouse over boxes for more info, click boxes to drill down";
footnote2 h=.5 " ";

proc gmap map=table_map data=table_data anno=anno_all;
id cell_id; 
choro cell_id /  
 coutline=same  
 nolegend
 html=my_html
 des='' name="&name";
run;

quit;

