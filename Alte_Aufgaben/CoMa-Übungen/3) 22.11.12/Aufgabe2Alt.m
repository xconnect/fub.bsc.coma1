%% 3. Übungszettel CoMa I WS 12/13
%% Aufgabe 2)
%% Valeria Zahoransky, Felix Lorenz, Konstantin Jaehne, Adrian Herrmann

function [eps] = Aufgabe2(x, Basis, Mantis)

    temp = x.*(10.^(Mantis - 1));
	temp = temp - floor(temp); %% temp stellt die letzte Ziffer dar, die wir betrachten wollen
	
	if temp >= Basis./2 %% aufrunden
		rd = x + (10-temp).*(10 .^(-Mantis))
	else %% abrunden
		rd = x - temp.*(10 .^(-Mantis))
	end
	
	eps = abs(x - rd)./x %% relativer Rundungsfehler
    
end