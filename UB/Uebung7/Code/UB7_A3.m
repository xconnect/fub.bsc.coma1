%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 	CoMa UB 7 A3	%
% =========================== %
%	octave-Script	%
% --------------------------- %
% Author: Samanta Scharmacher	%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
function erg = mittelwert(x)
	n=size(x,1);
	erg = (1/n)*sum(x,1);
end;

%Varianz mit standartformel
function erg = stichprobenVarStandart(x)
	n=size(x,1);
	erg = sum((x.-mittelwert(x)).^2,1)/(n-1);
end;

%Varianz mit Verschiebungssatz bzw. Satz von Steiner
function erg = stichprobenVarSteiner(x) 	
	n=size(x,1);
	erg = (sum((x.^2),1)-(n*(mittelwert(x)^2)))/(n-1);
end;
%%%% --- (a) --- %%%%
stichprobe=randn(10000,1)+500;

%%%% --- (b) --- %%%%
S_a=stichprobenVar_a(stichprobe)
S_b=stichprobenVar_b(stichprobe)

%prüfe mit octave eigener variante der Varianz und mittelwert
test_var=var(stichprobe,0,1)
 
%%%% --- (c) --- %%%%
%{
 Beide Funktionen erzeugen ein identisches und korrektes Ergebnis (vergleiche Test mit Octave-Funktion)
%}