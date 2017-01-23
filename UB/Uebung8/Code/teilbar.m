function erg=teilbar(teiler,vielfaches)
	
    % uns ist dabei egal wie oft teiler in vielfaches passt
    erg=mod(vielfaches,teiler)==0;
    
end