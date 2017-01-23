%% 2. �bungszettel CoMa I WS 12/13
%% Aufgabe 4)
%% Valeria Zahoransky, Felix Lorenz, Konstantin Jaehne, Adrian Herrmann

function [] = Aufgabe4(x,y)

    if y == 0
        disp('Division durch 0 nicht definiert :P')
    else

        z = x./y;
        zGanz = floor(z);
        zKomma = z - zGanz;
    
        %% Beginn Berechnung Ganzzahlanteil
		
		rGanz = []; %% Array mit Resten f�r den Ganzzahlanteil
		nGanz = ceil(log2(zGanz)); %% Berechne Anzahl der Stellen in der Bin�rdarstellung

		if log2(zGanz) == ceil(log2(zGanz)) %% Wenn Eingabewert Zweierpotenz, hat die Bin�rdarstellung eine zus�tzliche Stelle
			nGanz = nGanz + 1;
		end

		while zGanz > 0 %% while-Schleife teilt vorheriges Ergebnis durch 2 (Startwert zGanz) und speichert die Reste in einem Array (Euklidischer Algorithmus!!!)
			rGanz(nGanz) = mod(zGanz,2);
			zGanz = floor(zGanz./2);
			nGanz = nGanz - 1;
        end
        
        %% Ende Berechnung Ganzzahlanteil
		
        
        %% Beginn Berechnung Nachkommaanteil
	
		gKomma = []; %% Array mit Ganzzahlanteilen des Eukl.Alg. f�r den Nachkommaanteil
		nKomma = 1; %% Laufvariable f�r Eukl.Alg.

		while zKomma > 0 %% while-Schleife nimmt vorherigen Rest mal 2 (Startwert zKomma) und speichert die Reste in einem Array (Euklidischer Algorithmus!!!)
			gKomma(nKomma) = floor(zKomma.*2);
			zKomma = (zKomma.*2) - gKomma(nKomma);
			nKomma = nKomma + 1;
        end
        
        %% Ende Berechnung Nachkommaanteil
        
        disp('rGanz stellt den Ganzzahlanteil dar, gKomma den Nachkommaanteil. [] entspricht 0.')
        rGanz
        gKomma
        
    end
    
end