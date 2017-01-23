%% 5. Übungszettel CoMa I WS 12/13
%% Aufgabe 3)
%% Valeria Zahoransky, Felix Lorenz, Konstantin Jaehne, Adrian Herrmann

function [v] = Aufgabe2exp(x0, x1, k)

	v = [x0, x1]; %% Definiere Ausgabevektor und belege ihn mit x0 und x1
		
    for i = 2:k
		v(i) = (1./(2.^(i+1))).*((3-3.^i).*x0 - 2.*(1-3.^i)*x1); %% Definiere explizite Folge
	end
    
end