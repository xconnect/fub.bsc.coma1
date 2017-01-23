function [A] = dual1(z,b)

result = zeros(1,b); % Initialisierung eines b-Bit langen Arrays

if b < 2
    error('Es müssen wenigstens 2 Bit verwendet werden (b>1)!')
end

% Vorzeichenbit setzen
if z < 0
    result(1,1) = 1;
    z=-z;
end

% Binärzahl berechnen
for i = length(result):-1:2

    % falls z = 0 ist, beende die for-Schleife
    if (z==0)
        break;
    end
    
    r = mod(z,2);                             % mod(z,2)
    z = idivide(int32(z), int32(2), 'floor'); % div(z,2)
    
    % Füge r an die passende Position des Ergebnisarrays ein.
    result(1,i) = r; 
 
end

A = result;

end %eof