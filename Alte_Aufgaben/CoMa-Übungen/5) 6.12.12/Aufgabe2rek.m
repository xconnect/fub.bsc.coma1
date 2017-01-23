%% 5. Übungszettel CoMa I WS 12/13
%% Aufgabe 3)
%% Valeria Zahoransky, Felix Lorenz, Konstantin Jaehne, Adrian Herrmann

function [v] = Aufgabe2rek(x0, x1, k)

	v = [x0, x1]; %% Definiere Ausgabevektor und belege ihn mit x0 und x1
		
    for i = 2:k
		v(i) = 2*v(i-1) - (3./4).*v(i-2); %% Definiere rekursive Folge
	end
    
end