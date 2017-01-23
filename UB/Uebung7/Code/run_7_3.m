%%% Aufgabe 3 %%%

%%% clean environment
clear all
clc
close all

% Aufgabe 3a)
stichprobe=randn(10000,1)+500;

% Aufgabe 3b)
S_1 = stichprobenVarStandart(stichprobe)
S_2 = stichprobenVarSteiner(stichprobe)

% Aufgabe 3c)

% Steiner, obwohl Werte gleich.