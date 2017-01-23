%% 9. Übungszettel CoMa I WS 12/13
%% Aufgabe 3)
%% Valeria Zahoransky, Felix Lorenz, Konstantin Jaehne, Adrian Herrmann

function [] = Aufgabe3(A)

	[n,m] = size(A); %% n gibt die Anzahl der Zeilen, m der Spalten zurück

	%% Beginn Gauß-Algorithmus
	
	if A == 0
		R = 0;
	else
		x = n; %% x gibt die Anzahl der 0en in einer Spalte an
		s = 1; %% Initialisierung der Spalte
		while s <= m && x == n %% Erhalte die erste Nicht-Nullspalte
			x = 0;
			z = 1; %% Initialisierung der Zeile
			while z <= n && A(z,s) == 0
				x = x + 1;
				z = z + 1;
			end
			s = s + 1;
		end
		
		
	end
    
end