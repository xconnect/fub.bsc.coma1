%%% Aufgabe 1 %%%

%%% clean environment
clear all
clc
close all

disp('Start des Skripts');
n=1000; 
% Erzeuge 1000x2 Integer Matrix mit Werten zwischen 100 und 1000, wobei die 1. Spalte a_i und die 2. b_i ist.
stichprobe=randi([100 , 1000],n,2);

% gehe mit Forschleife durch die Stichprobe!
% k ist eine nx3 Matrix, in der die Zeilen die jeweilige Iteration i beschreibt und die Spalten enthalten die Anzahl der Divisionen der ggT-Varianten (1=naiv;2=rw;3=euklid)
disp('berechne ggT mit den ggT-ALgorithmen')
for i=1:n
	[GGT(i,1) k(i,1)] = ggt_naiv(stichprobe(i,1),stichprobe(i,2));
	[GGT(i,2) k(i,2)] = ggt_rw(stichprobe(i,1),stichprobe(i,2));
	[GGT(i,3) k(i,3)] = ggt_euklid(stichprobe(i,1),stichprobe(i,2));
end
% berechne nun den Mittelwert ueber die k_i
disp('Berechen den Mittelwert')
k_Mittelwert = mean(k)
disp('Berechne das Maximum jedes Algorithmus')
max_k = max(k)
disp('Berechne das Minimum jeder Variante')
min_k = min(k)

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

disp('Plote Rueckwaerts Algorithmus')
figure(2)
hist(k(:,2));
hold on
c=strcat('Rueckwaerts Algorithmus: min k_i= ', num2str(min_k(1,2)),' ; max k_i= ',num2str(max_k(1,2)),' ; mean_{k}= ',num2str(k_Mittelwert(1,2)));
title(c);
xlabel('k_i');
ylabel('absolute Haeufigkeiten');
hold off
print -dpng rwAlgo_Histogramm.png;

disp('Plote Euklidscher Algorithus')
figure(3)
hist(k(:,3));
hold on
c=strcat('Euklidscher Algorithmus: min k_i= ', num2str(min_k(1,3)),' ; max k_i= ',num2str(max_k(1,3)),' ; mean_{k}= ',num2str(k_Mittelwert(1,3)));
title(c);
xlabel('k_i');
ylabel('absolute Haeufigkeiten');
hold off
print -dpng euklidAlgo_Histogramm.png;


disp('Ende des Skripts')

% allgemeiner Test:

disp('Allgemeiner Funktionstest');
disp('moeglicher Worstcase fuer ggt_rw: ggt_rw(1000,999)')
a=999;
b=1000;
[naivGGT k_naiv] = ggt_naiv(a,b)
[rwGGT k_rw] = ggt_rw(a,b)
[euklidGGT k_euklid] = ggt_euklid(a,b)
