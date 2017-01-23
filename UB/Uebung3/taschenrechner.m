function erg=taschenrechner(L,x,y,op)
   
   % Schritt 0: runden der Eingabeparmeter
   x=runden(x,L);
   y=runden(y,L);
	
   % Schritt 1: welche Rechenoperation
   switch (op)
      
      % case 1 = case '+' (Addition)
      case 0
         erg = runden(x+y,L);
      case '+'
         erg = runden(x+y,L);

      % case 1 = case '-' (Subtraktion)
      case 1
         erg = runden(x-y,L);
      case '-'
         erg = runden(x-y,L);
		
      % case 2 = case '*' (Multiplikation)
      case 2
         erg = runden(x*y,L);
      case '*'
         erg = runden(x*y,L);

      % case 3 = case '/' (Division)
      case 3	
         erg = runden(x/y,L);
      case '/'	
         erg = runden(x/y,L);
		
      % sonst unbekannte Rechenoperation
      otherwise
         error('Unknown operator!')
   end
end