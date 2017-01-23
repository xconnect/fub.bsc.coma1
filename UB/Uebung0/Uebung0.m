%%% clean environment
clear all
clc
close all

%%% CoMa - Uebung 0

% Aufgabe 2d)
7*8
a=7
b=8
a-b
a/b
c=a+b
c=a-b
c=a*b
c/a
a

% Aufgabe 2e)
x=[1 2 3];
x
x'

% Aufgabe 2f)
y=17;
y
clear all
%y % Sollte entfernt werden um das Programm ausführen zu können.

% Aufgabe 2g)
help cos
help sin

% Aufgabe 2h)
%helpdesk % Sollte entfernt werden um das Programm ausführen zu können.

% Aufgabe 2i)
%lookfor Logarithmus % Sollte entfernt werden um das Programm ausführen zu können.

% Aufgabe 3b)

A = [];
for i=1:3:9
   v = colon(i,i+2);
   A = vertcat(A,v); 
end

% oder A = [1 2 3; 4 5 6; 7 8 9]

x = ones(1,3);
% oder x = [1 1 1]

A % Ausgabe
x % Ausgabe

% Aufgabe 3c)
A*x'
x*A
%A*x % Sollte entfernt werden um das Programm ausführen zu können.
A*A
A.*A

% Aufgabe 3d)
x = -2:0.1:2;
f = x.^3;
plot(x,f) % plot(x,f,':')
figure(2); clf;
g=1./(1+x.^2);
plot(x,g)