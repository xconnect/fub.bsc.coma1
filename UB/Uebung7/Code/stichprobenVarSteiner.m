function erg = stichprobenVarSteiner(x)

	n=size(x,1);
	erg = (sum((x.^2),1)-(n*(mittelwert(x)^2)))/(n-1);
    
end