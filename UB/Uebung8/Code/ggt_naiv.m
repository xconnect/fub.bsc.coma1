function varargout = ggt_naiv(a,b)

	if (nargout<1)
		error('Nicht genug Ausgabe Parameter definiert: Es wird mindestens 1 Parameter fuer den ggT benoetigt!');
		return;
    end
    
    ggTschranke=min(a,b);		% suche den kleineren Wert von beiden um damit die obere Schranke fuer die While Schlefe festzu legen
	i=1; % Es reicht nur i zu initialisieren, da alles durch 1 teilbar ist und mindestens einmal in die While-Schleife gesprungen wird
	
    if (nargout>1)
		varargout{2}=0;		%%Bisher noch keine Div und ist Initialisierung
    end
    
    % gehe in ganzzahligen Schritten bis zur groessten Zahl
	while (i<=ggTschranke)
        
		if (teilbar(i,a) && teilbar(i,b))
			varargout{1}=i;		
        end
	
        if(nargout>1)
            % pro Iteration haben wir 2 Divisionen, da 2-Mal die Teilbarkeit geprueft werden soll
			varargout{2} = varargout{2} + 2;
        end
		i= i+1;
    end		
end