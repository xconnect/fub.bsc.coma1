function ggT=Simple_ggt_euklid(a,b)
	
    ggT=max(a,b);
	ggTschranke=min(a,b);

    while (ggTschranke>0)
		rest= mod(ggT,ggTschranke);
		ggT=ggTschranke;
		ggTschranke=rest;
    end
    
end