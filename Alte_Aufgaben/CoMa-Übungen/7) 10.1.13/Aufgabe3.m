%% 7. �bungszettel CoMa I WS 12/13
%% Aufgabe 3)
%% Valeria Zahoransky, Felix Lorenz, Konstantin Jaehne, Adrian Herrmann

function [] = Aufgabe3(p,q)

	if p < 0 %% wenn p negativ
		x2 = -p./2 + sqrt((p.^2)./4 - q); %% x2 ist das gr��ere
		x1 = q./x2; %% q = x1 * x2
	else %% wenn p positiv
		x1 = -p./2 - sqrt((p.^2)./4 - q);
		x2 = q./x1;
    end
    
    x1
    x2
    
end