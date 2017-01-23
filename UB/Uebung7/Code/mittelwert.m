function erg = mittelwert(x)
	
    n=size(x,1);
	erg = (1/n)*sum(x,1);

end