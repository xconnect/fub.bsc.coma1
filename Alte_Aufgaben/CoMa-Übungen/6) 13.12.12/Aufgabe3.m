%% 6. Übungszettel CoMa I WS 12/13
%% Aufgabe 3)
%% Valeria Zahoransky, Felix Lorenz, Konstantin Jaehne, Adrian Herrmann

function [] = Aufgabe3()

	x = 0; %% Initialisiere x
	format long f1 = x - (sqrt(x+1)-1)(sqrt(x+1)-1 + 2); %% f(f^-1(x))
	format long f2 = x - sqrt(x(x+2)+1)-1; %% f^-1(f(x))
	
	i = 4; %% Initialisiere Startwert für for-Schleife
	
	for i:2:12
		i
		f1(-1+10.^-i)
		f2(-1+10.^-i)
	end
    
end