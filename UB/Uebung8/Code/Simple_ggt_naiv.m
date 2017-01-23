function ggT=Simple_ggt_naiv(a,b)

    % suche den kleineren Wert von beiden um damit die obere Schranke fuer die While Schleife festzulegen
    ggTschranke=min(a,b);		
	% Es reicht nur i zu initialisieren, da alles durch 1 teilbar ist und mindestens einmal in die While-Schleife gesprungen wird
    i=1;
	% gehe in ganzzahligen Schritten bis zur groessten Zahl
    while(i<=ggTschranke)		
		if (teilbar(i,a) && teilbar(i,b))
			ggT=i;	
		end;
		i=i+1;
    end
end