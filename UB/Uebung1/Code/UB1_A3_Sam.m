%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Computer-Orientierte Mathematik I    %
%				  %
%  Authoren:			  %
%	Nicolas Lehmann		  %
%	Samanta Scharmacher		  %
%				  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#UB1 A3
#Methode zum Umrechnen vpn Dezimal Zahlen in Dualzahlen
function binNum=dez2bin(z,b)
		binNum=zeros(1,b);			#erstelle Ausgabe-Vektor
		i=b;				#LaufIndex
		while(and(z>=0,i>0))
			binNum(1,i)= mod(z,2);	#Berechne den Rest von tempZ/2
			z=floor(z/2);		#Berechne tempZ=tempZ/2 
			i--;			#nächste Stelle
		end
#		if (z>0)				#fehler abfangen
#			binNum=ones(1,b)*(-1); 	#Wenn nicht reinpasst, dann alles -1 --> ist Sinnvoll?
#		end
end

#Funktion zur Darstellung von Binärzahlen mit Vorzeichenbit
function dualVec = dual1(z,b)
	#Initialisiere AusgabeVector
	dualVec=zeros(1,b);
	#prüfe ob positiv oder negativ ist und füge dem entsprechend das Vorzeichenbit 1 vorne heran
	if (z<0)
		dualVec(1,1)=1;
		#rechne nun den betrag in binär um
		z*=-1; #da z=-a -->-a*-1=a 
		
	end
	#füge die errechnete Zahl z zum Ausgangsvector hinzu
	dualVec(1,2:b)=dez2bin(z,b-1);	 # wir haben nur noch b-1 Bits zur Darstellung von z übrig	
end

#Methode zum Addieren von Binärzahlen in Matrix-schreibweise
function BinVec= addBinMat(a,b)	#Algorithmus für einen Volladdierer --> Ist hauptsächlich nur für die Addition mit 1 getestet!!!! mehr soll er auch nicht können
	#Annahme zu addierenden Matrizen sind gleichlang
	n=size(a,2);
	BinVec=zeros(1,n);
	u=0;
	for i=0:n-1
		a_b=xor(a(1,n-i),b(1,n-i));	#berechne 1-Bit Summe ohne Übertrag für ai und bi
		BinVec(1,n-i)=xor(a_b,u);	#füge den Übertrag aus der Berechnung der niedrigeren Stelle hinzu
		u=and(a(1,n-i),b(1,n-i));	#berechne, ob es einen Übertrag gibt
	end
end

#Function zur Umrechnung in Binärzahl mit Zweierkomplement
function dualVec = dual2(z,b)
	dualVec=zeros(1,b);
	dualVec(1,2:b)=dez2bin(abs(z),b-1);
	if(z<0)
		#flippe alle Bits
		dualVec=not(dualVec);
		#addiere eine 1
		one=[zeros(1,b-1),1];	#--> entspricht 01 mit b bits
		dualVec=addBinMat(dualVec,one);
	end
end

##########TEST##################
testCase=	[15,8;	42,8;	-77,8;	714,16;	-512,16;	-77,16];

for i=1:size(testCase,1)
	i
	test_dual1=dual1(testCase(i,1),testCase(i,2))	
	test_dual2=dual2(testCase(i,1),testCase(i,2))
end