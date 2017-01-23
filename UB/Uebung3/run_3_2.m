%%% clean environment
clear all
clc
close all

%%% Aufgabe 1

% definiere X,y
X = [1 181 40; 1 175 65; 1 180 50; 1 170 25; 1 178 48; 1 182 52; 1 185 36; 1 170 60];
y = [80; 72; 83; 65; 77; 78; 90; 85];

% loesung dozent
beta_p = inv(X'*X)*X'*y

% loesung student
A1 = inv(X'*X) % ungleich zur Aufgabenstellung durch Fehler: A1 != A2
A2 = [154.86 -0.85 -0.08; -0.85 0.005 0.0002; -0.08 0.0002 0.0008];
B = X'*y;
beta_s = A2*B

%%% Aufgabe 2

% runden(x,L)
disp('runden')
testR1 = runden(0.14,1)
testR2 = runden(0.15,1)
testR3 = runden(-0.14,1)
testR4 = runden(-0.15,1)
testR5 = runden(0.0015325,4)
testR6 = runden(-0.0015325,4)
testR7 = runden(1.0015725,5)
testR8 = runden(-1.0015725,5)

% taschenrechner(L,x,y,op)
disp('taschenrechner')
testT1 = taschenrechner(4,0.0275,15.175,'+')
testT2 = taschenrechner(4,0.0275,15.175,'-')
testT3 = taschenrechner(4,0.0275,15.175,'*')
testT4 = taschenrechner(4,0.0275,15.175,'/')

disp('Binomische Formel')
tB1_a = taschenrechner(6,0.12345,-0.1234,'+');
tB1_b = taschenrechner(6,tB1_a,tB1_a,'*');
testB1 = taschenrechner(6,tB1_a,tB1_b,'+')
tB2_aa    = taschenrechner(6,0.12345,0.12345,'*');
tB2_2a    = taschenrechner(6,2,0.12345,'*');
tB2_2ab   = taschenrechner(6,tB2_2a,-0.1234,'*');
tB2_bb    = taschenrechner(6,-0.1234,-0.1234,'*');
tB2_aa_2a = taschenrechner(6,tB2_aa,tB2_2a,'+');
testB2    = taschenrechner(6,tB2_aa_2a,tB2_bb,'+')