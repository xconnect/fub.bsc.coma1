%% 3. Übungszettel CoMa I WS 12/13
%% Aufgabe 2)
%% Valeria Zahoransky, Felix Lorenz, Konstantin Jaehne, Adrian Herrmann

function [] = Aufgabe2()

    epsNeu = 1; %% Startwert für Schleife, Endwert entspricht unserer Definition von eps

    while 1 + epsNeu > 1 %% Wenn Mantissenlänge erreicht, wird durch Rundung Schleifenbedingung falsch
        epsNeu = 0.5 .* epsNeu; %% x wird halbiert, um den Startwert immer um eine Stelle nach rechts zu verschieben
    end
    
    epsNeu %% eps nach unserer Definition
    eps %% eps nach der Definition von MATLAB
    
end