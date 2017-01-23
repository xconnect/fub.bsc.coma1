function ggT=Simple_ggt_rw(a,b)
	
    ggTschranke=min(a,b);
	
    while(ggTschranke>0)
	
        % hier wird mindestens im Fall ggTschranke==1 hinein gegangen
        if (teilbar(ggTschranke,a)&& teilbar(ggTschranke,b))	
			ggT=ggTschranke;
            % Wir wollen den groessten haben, d.h. sobald wir einen gefunden haben muss das auch der groesste sein!
			return;					
		end;
		
        ggTschranke = ggTschranke-1;
    end
end