%% 9. Übungszettel CoMa I WS 12/13
%% Aufgabe 3)
%% Valeria Zahoransky, Felix Lorenz, Konstantin Jaehne, Adrian Herrmann

function [] = Aufgabe3(R,b)

	[n,n] = size(R);

	%% Beginn Gauß-Algorithmus, berechne Matrix R
	
    for k=1:n
        if k=1
			j = k; %% erste Nichtnullspalte
		end
        s = k;
        null = 0;
        while s >= j && s <= n && null == 0 %% erhalte erste Nichtnullspalte
            for l=k:n %% überprüfe alle Elemente des Spaltenvektors
                if R(l,s) == 0
                else
                    null = null + 1;
                end
            end
            j = s;
            s = s + 1;
        end
		 
        max = R(k,j); %% finde Position des größtes Elements in Spalte j
        for i=k:n
			if max < R(i,j)
				max = R(i,j);
				maxpos = i;
			end
        end
        
        R([k,maxpos],[j,n]) = R([maxpos,k],[j,n]); %% vertausche Zeilen 1 der Teilmatrix und i

        for i=k+1:n
			R(i,[j,n]) = R(i,[j,n]) - (R(i,j)./R(k,j))*R(k,[j,n]); %% addiere das (-a_ij/a_1j)-fache der ersten Zeile der Teilmatrix zur i-ten Zeile
			L(i,j) = R(i,j)./R(k,j);
        end
    end
    
    R
	
	
	
	%% Berechne Matrix L
	
	for i=1:n
		L(i,i) = 1; %% Diagonaleinträge sind 1
		for j=i+1:n
			L(i,j) = 0; %% Einträge rechts der Diagonalen sind 0
		end
	end
	
	L
	
	
	
    %% Vorwärtssubstitution
	
	for i=1:n
		y(i) = b(i);
		for j=1:i-1
			y(i) = y(i) - L(i,j).*y(j);
		end
	end
	
	y
	
	
	
	%% Rückwärtssubstitution
	
	for i=0:n-1
		x(n-i) = y(n-i);
		for j=1:i
			x(n-i) = x(n-i) - R(n-i,n-j).*x(n-j);
		end
	end
	
	x
	
end
