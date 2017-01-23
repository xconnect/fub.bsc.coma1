function erg = stichprobenVarStandart(x)

    n=size(x,1);
	erg = sum((x-mittelwert(x)).^2,1)/(n-1);

end