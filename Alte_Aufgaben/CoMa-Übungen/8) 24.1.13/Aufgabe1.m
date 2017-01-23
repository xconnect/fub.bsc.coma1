%% 8. Übungszettel CoMa I WS 12/13
%% Aufgabe 1)
%% Valeria Zahoransky, Felix Lorenz, Konstantin Jaehne, Adrian Herrmann

function [] = Aufgabe1(x)
    
    d = length(x); %% Länge des Eingabevektors
    max = x(1); %% Setze Maximum als erstes Element
    
    for i=1:d
        if max < x(i) %% Wenn momentantes Maximum kleiner ist als verglichener Wert, setze verglichenen Wert als neues Maximum
			max = x(i);
		end
    end
    
    max
    
end