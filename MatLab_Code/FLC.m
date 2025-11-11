% Create a new Mamdani fuzzy inference system
fis = mamfis('Name', 'FLC');

% Add input variables: e (error) and ce (change in error)
fis = addInput(fis, [-10 10], 'Name', 'e');  
fis = addInput(fis, [-10 10], 'Name', 'ce'); 

% Add output variable
fis = addOutput(fis, [-10 10], 'Name', 'output'); % Range for output: [-10, 10]

% Membership functions for e
fis = addMF(fis, 'e', 'trimf', [-20 -10 0], 'Name', 'N');  
fis = addMF(fis, 'e', 'trimf', [-10 0 10], 'Name', 'Z');   
fis = addMF(fis, 'e', 'trimf', [0 10 20], 'Name', 'P');    

% Membership functions for ce
fis = addMF(fis, 'ce', 'trimf', [-20 -10 0], 'Name', 'N'); 
fis = addMF(fis, 'ce', 'trimf', [-10 0 10], 'Name', 'Z'); 
fis = addMF(fis, 'ce', 'trimf', [0 10 20], 'Name', 'P');   

% Membership functions for output
fis = addMF(fis, 'output', 'trimf', [-20 -10 -5], 'Name', 'NB');
fis = addMF(fis, 'output', 'trimf', [-10 -5 0], 'Name', 'N');   
fis = addMF(fis, 'output', 'trimf', [-5 0 5], 'Name', 'Z');     
fis = addMF(fis, 'output', 'trimf', [0 5 10], 'Name', 'P');     
fis = addMF(fis, 'output', 'trimf', [5 10 20], 'Name', 'PB');   

% Define the rules based on Table III
rules = [
    3 3 5 1 1  % e = P, ce = P -> PB
    3 2 4 1 1  % e = P, ce = Z -> P
    3 1 3 1 1  % e = P, ce = N -> Z
    2 3 4 1 1  % e = Z, ce = P -> P
    2 2 3 1 1  % e = Z, ce = Z -> Z
    2 1 2 1 1  % e = Z, ce = N -> N
    1 3 3 1 1  % e = N, ce = P -> Z
    1 2 2 1 1  % e = N, ce = Z -> N
    1 1 1 1 1  % e = N, ce = N -> NB
];


fis = addRule(fis, rules);
writeFIS(fis, 'FLC');