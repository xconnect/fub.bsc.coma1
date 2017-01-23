function varargout=ggt_rw(a,b)

    if(nargout<1)
		error('Nicht genug Ausgabe Parameter definiert: Es wird mindestens 1 Parameter fuer den ggT benoetigt!');
		return;
    end
    
	ggTschranke=min(a,b);
	
    if (nargout>1)
		varargout{2}=0;		%%Bisher noch keine Div und ist Initialisierung
    end
    
	while(ggTschranke>0)
		%Wir zaehlen schon hier die Division, da wir davon ausgehen, dass unser Programm nicht in iner Iteration abstürzt
		if(nargout>1)
			varargout{2} = varargout{2}+2;			%Wir haben pro Iteration 2-Divisionen!!
        end
        
		if (teilbar(ggTschranke,a)&& teilbar(ggTschranke,b))	% hier wird mindestens im Fall ggTschranke==1 hinein gegangen
			varargout{1}=ggTschranke;
			return;					%Wir wollen den größten haben, d.h. sobald wir einen gefunden haben muss das auch der größte sein!
        end
		ggTschranke = ggTschranke-1;
    end
end