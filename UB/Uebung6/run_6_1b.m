%%% clean environment
clear all
clc
close all

%%% Aufgabe 1a)

f     = @(x) x .* (x+2);
f_inv = @(x) sqrt(x+1)-1;

h = compose(f,f_inv);
j = compose(f_inv,f);

x = linspace(-1,500,501*10);

figure('NumberTitle','off','Name','Aufgabe 1');
hold on
plot(h(x),x,'r')
plot(j(x),x,'b:')

%%% Aufgabe 1b)

format long e
h1 = h(-1+1e-12)
h2 = h(-1+1e-8)
h3 = h(-1+1e-4)
j1 = j(-1+1e-12)
j2 = j(-1+1e-8)
j3 = j(-1+1e-4)

%%% Aufgabe 1c)

reh1 = abs(-1-h1)/abs(-1)
reh2 = abs(-1-h2)/abs(-1)
reh3 = abs(-1-h3)/abs(-1)
rej1 = abs(-1-j1)/abs(-1)
rej2 = abs(-1-j2)/abs(-1)
rej3 = abs(-1-j3)/abs(-1)
%%% Aufgabe 1d)

% keine Ahnung ! ;-)

% Long scientific notation with 15 digits after the decimal point for
% double values, and 7 digits after the decimal point for single values.