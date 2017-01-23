%% 1. Übungszettel CoMa I WS 12/13
%% Aufgabe 3)
%% Valeria Zahoransky, Felix Lorenz, Konstantin Jaehne, Adrian Herrmann

function [r] = Aufgabe3(x)

    r = []; %% Array mit Resten
    n = ceil(log2(x)); %% Berechne Anzahl der Stellen in der Binärdarstellung

    if log2(x) == ceil(log2(x)) %% Wenn Eingabewert Zweierpotenz, hat die Binärdarstellung eine zusätzliche Stelle
        n = n + 1;
    end

    while x > 0 %% while-Schleife teilt vorheriges Ergebnis durch 2 (Startwert x) und speichert die Reste in einem Array (Euklidischer Algorithmus!!!)
        r(n) = mod(x,2);
        x = floor(x./2);
        n = n - 1;
    end
    
end