%% 7. Übungszettel CoMa I WS 12/13
%% Aufgabe 1)
%% Valeria Zahoransky, Felix Lorenz, Konstantin Jaehne, Adrian Herrmann

function [s] = Aufgabe1(x)
    
    d = length(x); %% Länge des Eingabevektors
    s = 0; %% Initialisierung der Summenvariable
    
    for i=1:d
        s = x(i).^2 + s;
    end        
    
end