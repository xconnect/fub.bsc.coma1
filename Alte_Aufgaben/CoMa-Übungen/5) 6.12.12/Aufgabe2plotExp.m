%% 5. Übungszettel CoMa I WS 12/13
%% Aufgabe 3)
%% Valeria Zahoransky, Felix Lorenz, Konstantin Jaehne, Adrian Herrmann

function [] = Aufgabe2plot(x0, x1, k)

	v = [x0, x1]; %% Definiere Ausgabevektor und belege ihn mit x0 und x1
    vstoer = [x0, x1+0.00001];
    vrelF = [0, 0.00001./abs(x1)];
		
    for i = 2:k
		v(i+1) = (1./(2.^(i+1))).*((3-3.^i).*x0 - 2.*(1-3.^i)*x1); %% Definiere explizite Folge
	    vstoer(i+1) = (1./(2.^(i+1))).*((3-3.^i).*x0 - 2.*(1-3.^i)*x1);
        vrelF(i+1) = abs(v(i+1)-vstoer(i+1))./abs(v(i+1));
    end
    
    plot(vrelF);
    
end