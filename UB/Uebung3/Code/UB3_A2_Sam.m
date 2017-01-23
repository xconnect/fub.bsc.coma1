%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Computer-Orientierte Mathematik I    %
%				  %
%  Authoren:			  %
%	Nicolas Lehmann		  %
%	Samanta Scharmacher		  %
%				  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

###########################################
#zahl=runden(Zahl,Genauigkeit):	  #
#Annahme: 			  #
#    Alle x haben die Basis 10!!!	  #
#Idee: 				  #
#    Prüfe, ob die Zahl x positiv oder 	  #
#    negativ ist und speicher das.	  #
#    Bringe nun die Zahl |x| in die 	  #
#    Mantissen-Normalform (0.XYZ)	  #
#    Anschließend wird x um L stellen	  #
#    nach links verschoben (*10^L) damit  #
#    der zu rundene Betrag nun eine 	  #
#    ganze Zahl ist. Denn mit ganzen 	  #
#    Zahlen kennen wir und auch der 	  #
#    Computer uns aus!!!		  #
#    Nun muss nur noch der ganzzahlige 	  #
#    Teil von x bestimmt werden. 	  #
#    Je nach dem, ob nun der nicht 	  #
#    ganzzahlige Teil von x <= wird 	  #
#    noch auf den ganzzahligen Anteil 	  #
#    von x +1 gerechnet (Aufrunden).	  #
#    Anschließend muss die Zahl x wieder  #
#    wie in der Ausgangsform 		  #
#    zurückverschoben werden. 	  #
#    Sollte x negativ gewesen sein, 	  #
#    dann mache das Ergebnis wiede 	  #
#    negativ.			  #
###########################################
function erg=runden(x,L)
	shift_counter =0;	#Bestimmt die Richtung des Verschiebens
	x_is_neg=1; 	#Initialisierung des "x ist Negativ"-Flags wenn x positiv --> x_is_neg=1 || x negativ --> x_is_neg=-1. Wird dann später mit dem Ergebniss multipliziert

#Schritt 0: Prüfe ob x negativ ist, wenn ja, dann mache x positiv und merke dass sie mal negativ war
	if (x<0)
		x=x*-1;
		x_is_neg=-1;	
	end;
	
#Schritt 1: Bitshiften bis Mantissen-Normalform
	if (x>1)	#BSP: 12.3 --> 0.123
		while (x>1)
			x = x/10;
			shift_counter = shift_counter + 1;
		end;
	else	#BSP: 0.00123 --> 0.123
		while (x>0 && x<0.1)
			x = x*10;
			shift_counter = shift_counter - 1;
		end;		
	end;
	
#Schritt 3: Shifte die von x bleibenden Ziffern in den ganzzahligen Bereich, sodass L=3: 0.1234 --> 123.4
	x=x*10^L;
	
#Schritt 4.1: finde eine annähernde ganzzahlige Darstellung von x(Nachkommastellen abschneiden)
 	k=0;	#Initialisiere annähernde ganzzahlige Darstellung von x
 	while(k<x-1)
 		k=k+1;
 	end;
 	
#Schritt 4.2: finde den rest von x
 	rest=x-k;
 	
#Schritt 5: schaue ob gerundet werden muss
 	if(rest >=0.5)
 		k=k+1;
 	end;
 	
#Schritt 6.1: mache alle Shifts rückgängig
 	erg=k*10^(-L)*10^(shift_counter);
 	
#Schritt 6.2: Wenn x negativ war, dann ist in x_is_neg= -1 sonst x_is_neg=1;
 	erg=erg*x_is_neg;
end;
disp('runden')
runden(0.14,1)
runden(0.0014,1)
runden(0.0015,1)
runden(0.0015325,4)

runden(-0.14,1)
runden(-0.0014,1)
runden(-0.0015,1)
runden(-0.0015325,4)
u=runden(-1.0015325,4)
#BSP für eine schöne Ausgabe, ohne dass noch hinten Nullen stehen 
printf("TESTI: %.3f\rn",u);


###########################################
#zahl=taschenrechner(Genaugkeit,Zahl,Zahl,#
#       Operant([0='+'|1='-'|2='*'|3='/'])#
#Annahme: 			  #
#    x und y müssen noch nicht auf L 	  #
#    stellen gerundet worden sein.	  #
#Idee:				  #
#    Bringe x und y in die selbe 	  #
#    Rundungsklasse.		  #
#    Anschließend prüfe, welche Operation #
#    angewedet werden soll.		  #
#    Anschließend lasse Matlab/Octave wie #
#    gewohnt rechnen und runde das 	  #
#    Ergebnis.			  #
###########################################
function erg=taschenrechner(L,x,y,op)
#Schritt 0: Runde die Eingabe
	x=runden(x,L);
	y=runden(y,L);
	
#Schritt 1: Werte die auszuführende Operation aus
	switch (op)
		case 0
			erg=runden(x+y,L);
		case '+'
			erg=runden(x+y,L);
			
		case 1
			erg=runden(x-y,L);
		case '-'
			erg=runden(x-y,L);
			
		case 2
			erg=runden(x*y,L);
		case '*'
			erg=runden(x*y,L);
			
		case 3	
			erg=runden(x/y,L);
		case '/'	
			erg=runden(x/y,L);
		otherwise
			error('Unknown Operator!!')
	end;
end;
disp('tasch');
taschenrechner(3,0.123,0.006,'+')
taschenrechner(2,0.123,0.006,'+')
taschenrechner(3,0.123,0.006,0)
taschenrechner(2,0.123,0.006,0)

#Binomische Formel-Test
a=0.12345;
b=-0.1234;
L=5;
#(a+b)²
a_plus_b=taschenrechner(L,a,b,'+');
linkerTerm=taschenrechner(L,a_plus_b,a_plus_b,'*')
#a²+2ab+b²
a_quad=taschenrechner(L,a,a,'*');
b_quad=taschenrechner(L,b,b,'*');
a_mul_b=taschenrechner(L,a,b,'*');
ab_mul_2=taschenrechner(L,2.0,a_mul_b,'*');
aq_plus_bq=taschenrechner(L,a_quad,b_quad,'+');
rechterTerm=taschenrechner(L,aq_plus_bq,ab_mul_2,'+')

#Der rechte Term ist die schlechtere Darstellung,
#da viel mehr Operationen ausgeführt werden müssen, 
#die zu größeren Rundungsungenauigkeiten führen. 
#Besonders schlimm im rechten Term gibt es mehr 
#Multiplikationen als im linken Term!!!

#####################################################
#					  #
#####################################################
#{
Runden Version, die zum Abtrennen der Nachkommastellen einen int-Cast nutzt(int-Casts runden in Octave automatisch richtig!!!)
function erg=runden(x,L)
	t=0;
	isNeg=0;
	#prüfe, ob x negativ ist. wenn ja dann mach sie positiv und merke dir, dass sie mal negativ war!
	if (x<0)
		x*=-1;
		isNeg=1;	
	end;
	#bringe x in Normalform
	while((x<1) && (x<0.1))
		t++;
		x*=10;
	end;
	
	#shifte bis L stellen eine Ganzzahl ist
	x*=10^(L);
	#caste mit int64 --> schneide dabei die Nachkommastellen ab. (uintXX rundet auch gleich richtig :) )
	xCuted=uint64(x); 	#uint64 rundet schon richtig xD --> kann ja nicht negativ sein, da wir oben den Fall abfangen, dass x negativ ist.
	#mache aus der Ganzenzahel wieder eine Kommazahl (double)
	x=double(xCuted)/10^(L)/10^t;
	#falls x mal negativ war, dann mach sie wieder negativ!!!
	if (isNeg==1)
		x*=-1;	
	end;
	erg=x;
end;
#}
