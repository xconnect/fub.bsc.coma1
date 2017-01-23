function [A] = dual2(z,b)

result = zeros(1,b); % Initialisierung eines b-Bit langen Arrays

if b < 2
    error('Es müssen wenigstens 2 Bit verwendet werden (b>1)!')
end

if z < 0
    n = -z;
else
    n = z;
end

% Binärzahl berechnen
for i = b:-1:2

    % falls z = 0 ist, beende die for-Schleife
    if (n==0)
        break; % breche Schleife ab
    end
    
    r = mod(n,2);                             % mod(z,2)
    n = idivide(int32(n), int32(2), 'floor'); % div(z,2)
    
    % Füge r an die passende Position des Ergebnisarrays ein.
    result(1,i) = r; 
 
end

if z < 0

    % Bit-Flip
    result(1,result(1,:)==0) = 2;
    result(1,result(1,:)==1) = 0;
    result(1,result(1,:)==2) = 1;

    % addiere 1
    imSinn = 1;
    for i = b:-1:2
       if (result(1,i) == 0) && (imSinn == 0)
          result(1,i) = 0;
       elseif (result(1,i) == 0) && (imSinn == 1)
          result(1,i) = 1;
          imSinn = 0;
       elseif (result(1,i) == 1) && (imSinn == 0)
          result(1,i) = 1;
       elseif (result(1,i) == 1) && (imSinn == 1)
          result(1,i) = 0;
       end
    end
    
    % Vorzeichenbit setzen
    result(1,1) = 1;
end

A = result;

end %eof