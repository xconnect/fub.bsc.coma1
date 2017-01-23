%% 4. Übungszettel CoMa I WS 12/13
%% Aufgabe 3)
%% Valeria Zahoransky, Felix Lorenz, Konstantin Jaehne, Adrian Herrmann

function [sp] = Aufgabe3(x)

	v = [x.^2, x.^2, x.^2, (1-x).^2, (1-x).^2]; %% Definiere Funktion v
	w = [x.^2, 4.*x.*(1-x), 6.*((1-x).^2), 4.*x.*(1-x), (1-x).^2]; %% Definiere Funktion w

	sp = 0; %% Setze Ausgabewert Skalarprodukt zu Beginn gleich 0
	
    for i = 1:5 %% Berechne Skalarprodukt
		sp = sp + v(i).*w(i);
	end
    
end