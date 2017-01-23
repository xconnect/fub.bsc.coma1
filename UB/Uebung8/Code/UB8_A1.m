%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 	CoMa UB8 A1	%
% =========================== %
%	octave-Script	%
% --------------------------- %
% Author: Samanta Scharmacher	%
% TODO: 			%
%  Fixe TEX geprintete Plots!	%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
#clf reset
#close all

cd "/home/samas/repo/CoMa/UB/Uebung8/Code"

%Rückgabe: Boolean ob teilbar oder nicht
function erg=teilbar(teiler,vielfaches)
	erg=mod(vielfaches,teiler)==0;	% uns ist dabei egal wie oft teiler in vielfaches passt
end;

function ggT=Simple_ggt_naiv(a,b)
	ggTschranke=min(a,b);		% suche den kleineren Wert von beiden um damit die obere Schranke für die While Schlefe festzu legen
	i=1;				%Es reicht nur i zu initialisieren, da alles durch 1 teilbar ist und mindestens einmal in die Whileschleife gesprungen wird
	while(i<=ggTschranke)		%gehe in ganzzahligen Schritten bis zur größten Zahl
		if (teilbar(i,a) && teilbar(i,b))
			ggT=i;	
		end;
		i++;
	end;	
end;

function ggT=Simple_ggt_rw(a,b)
	ggTschranke=min(a,b);
	while(ggTschranke>0)
		if (teilbar(ggTschranke,a)&& teilbar(ggTschranke,b))	% hier wird mindestens im Fall ggTschranke==1 hinein gegangen
			ggT=ggTschranke;
			return;					%Wir wollen den größten haben, d.h. sobald wir einen gefunden haben muss das auch der größte sein!
		end;
		ggTschranke--;
	end;
end;

function ggT=Simple_ggt_euklid(a,b)
	ggT=max(a,b);
	ggTschranke=min(a,b);
	while(ggTschranke>0)
		rest= mod(ggT,ggTschranke);
		ggT=ggTschranke;
		ggTschranke=rest;
	end;
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%function-Variante mit variaben Return-Paras
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function varargout=ggt_naiv(a,b)
	if(nargout<1)
		error("Nicht genu ausgabe Parameter definiert: Es wird mindestens 1 Parameter für den ggT benötigt!");
		return;
	end;
	ggTschranke=min(a,b);		% suche den kleineren Wert von beiden um damit die obere Schranke für die While Schlefe festzu legen
	i=1;				%Es reicht nur i zu initialisieren, da alles durch 1 teilbar ist und mindestens einmal in die Whileschleife gesprungen wird
	if (nargout>1)
		varargout{2}=0;		%%Bisher noch keine Div und ist Initialisierung
	end;
	while(i<=ggTschranke)		%gehe in ganzzahligen Schritten bis zur größten Zahl
		if (teilbar(i,a) && teilbar(i,b))
			varargout{1}=i;		
		end;
		if(nargout>1)
			varargout{2}+=2; 	%Pro Iteration haben wir 2 Divisionen!! da 2-Mal die Teilbarkeit geprüft werden soll
		end;
		i++;
	end;		
end;


%Hat meist eine Divsion mehr, da das min einmal auf Teilbarkeit und dann auch noch mal als letztes der ggT selber.
function varargout=ggt_rw(a,b)
	if(nargout<1)
		error("Nicht genu ausgabe Parameter definiert: Es wird mindestens 1 Parameter für den ggT benötigt!");
		return;
	end;
	ggTschranke=min(a,b);
	if (nargout>1)
		varargout{2}=0;		%%Bisher noch keine Div und ist Initialisierung
	end;
	while(ggTschranke>0)
		%WIr zählen schon hier die Division, da wir davon ausgehen, dass unser Programm nicht in iner Iteration abstürzt
		if(nargout>1)
			varargout{2}+=2;			%Wir haben pro Iteration 2-Divisionen!!
		end;
		if (teilbar(ggTschranke,a)&& teilbar(ggTschranke,b))	% hier wird mindestens im Fall ggTschranke==1 hinein gegangen
			varargout{1}=ggTschranke;
			return;					%Wir wollen den größten haben, d.h. sobald wir einen gefunden haben muss das auch der größte sein!
		end;
		ggTschranke--;
	end;
end;

function varargout=ggt_euklid(a,b)
	if(nargout<1)
		error("Nicht genu ausgabe Parameter definiert: Es wird mindestens 1 Parameter für den ggT benötigt!");
		return;
	end;
	
	ggT=max(a,b);
	ggTschranke=min(a,b);
	if (nargout>1)
		varargout{2}=0; 	%fangen bei 0 ann, da wir bisher keine Division durchgeführt haben und das eine Initialisierung ist.
	end;
	while(ggTschranke>0)
		rest= mod(ggT,ggTschranke);
		ggT=ggTschranke;
		ggTschranke=rest;
		if(nargout>1)
			varargout{2}++;
		end;
	end;
	varargout{1}=ggT;
end;
  
disp('Start des Skripts');
n=1000; 
%Erzeuge 1000x2 Integer Matrix mit Werten zwischen 100 und 1000, wobei die 1. Spalte a_i und die 2. b_i ist.
stichprobe=randi([100 , 1000],n,2);

%gehe mit Forschleife durch die Stichprobe!
%k ist eine nx3 Matrix, in der die Zeilen die jeweilige Iteration i beschreibt und die Spalten enthalten die Anzahl der Divisionen der ggT-Varianten (1=naiv;2=rw;3=euklid)
disp('berechne ggT mit den ggT-ALgorithmen')
for (i=1:n)
	[GGT(i,1) k(i,1)]=ggt_naiv(stichprobe(i,1),stichprobe(i,2));
	[GGT(i,2) k(i,2)]=ggt_rw(stichprobe(i,1),stichprobe(i,2));
	[GGT(i,3) k(i,3)]=ggt_euklid(stichprobe(i,1),stichprobe(i,2));
end;
%berechne nun den Mittelwert über die k_i
disp('Berechen den Mittelwert')
k_Mittelwert=mean(k)
disp('Berechne das Maximum jedes Algorithmus')
max_k=max(k)
disp('Berechne das Minimum jeder Variante')
min_k=min(k)

%Plotten der Histogramme:
disp('Plote Naiven Algorithus')
figure(1)
hist(k(:,1));
hold on
c=strcat('Naiver Algorithmus: min k_i= ', num2str(min_k(1,1)),' ; max k_i= ',num2str(max_k(1,1)),' ; mean_{k}= ',num2str(k_Mittelwert(1,1)));
title(c);
xlabel('k_i');
ylabel('absolute Häufigkeiten');
hold off
print -dpng naiverAlgo_Histogramm.png;

disp('Plote Rückwärts Algorithus')
figure(2)
hist(k(:,2));
hold on
c=strcat('Rückwärts Algorithmus: min k_i= ', num2str(min_k(1,2)),' ; max k_i= ',num2str(max_k(1,2)),' ; mean_{k}= ',num2str(k_Mittelwert(1,2)));
title(c);
xlabel('k_i');
ylabel('absolute Häufigkeiten');
hold off
print -dpng rwAlgo_Histogramm.png;

disp('Plote Euklidscher Algorithus')
figure(3)
hist(k(:,3));
hold on
c=strcat('Euklidscher Algorithmus: min k_i= ', num2str(min_k(1,3)),' ; max k_i= ',num2str(max_k(1,3)),' ; mean_{k}= ',num2str(k_Mittelwert(1,3)));
title(c);
xlabel('k_i');
ylabel('absolute Häufigkeiten');
hold off
print -dpng euklidAlgo_Histogramm.png;


disp('Ende des Skripts')




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%allgemeiner Test:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('Allgemeiner Funktionstest');
disp('möglicher Worstcase für ggt_rw: ggt_rw(1000,999)')
a=999;
b=1000;
[naivGGT k_naiv]=ggt_naiv(a,b)
[rwGGT k_rw]=ggt_rw(a,b)
[euklidGGT k_euklid]=ggt_euklid(a,b)
