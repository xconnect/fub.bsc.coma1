function erg=runden(x,L)

   shift_counter = 0; % bestimmt die Richtung des Verschiebens
   x_is_neg = 1; 	  % Initialisierung des "x ist Negativ"-Flags,
                      % wenn x positiv --> x_is_neg = 1 oder
                      % x negativ --> x_is_neg = -1.
                      % Wird dann spaeter mit dem Ergebnis multipliziert.

   % Schritt 0: Pruefe ob x negativ ist, wenn ja, dann mache x positiv
   %            und merke, dass sie mal negativ war
   if (x<0)
      x=x*-1;
      x_is_neg=-1;	
   end

   % Schritt 1: Bits shiften bis Mantissen-Normalform
   if (x>1)                      % Bsp.: 12.3 --> 0.123
      while (x>1)
         x = x/10;
         shift_counter = shift_counter + 1;
      end
   else                          % Bsp.: 0.00123 --> 0.123
      while (x>0 && x<0.1)
         x = x*10;
         shift_counter = shift_counter - 1;
      end		
   end
   
   % Schritt 3: Shifte die von x bleibenden Ziffern in den ganzzahligen
   %            Bereich, so dass L=3: 0.1234 --> 123.4
   x=x*10^L;

   % Schritt 4.1: finde eine annaehernde ganzzahlige Darstellung von x
   %              (Nachkommastellen abschneiden)
   k=0;	
   while(k<x-1)
       k=k+1;
   end
   
   % Schritt 4.2: finde den Rest von x
   rest=x-k;
 	
   % Schritt 5: schaue, ob gerundet werden muss
   if(rest >=0.5)
      k=k+1;
   end;
 	
   % Schritt 6.1: mache alle Shifts rueckgaengig
   erg=k*10^(-L)*10^(shift_counter);
 	
   % Schritt 6.2: wenn x negativ war,
   %              dann ist in x_is_neg = -1,
   %              sonst x_is_neg = 1
   erg=erg*x_is_neg;

end %eof