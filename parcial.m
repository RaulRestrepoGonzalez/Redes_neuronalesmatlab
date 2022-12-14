clear all,clc

P = [0 0 0 1; 6 8 3 1; 2 1 3 1; 2 1 3 8;
     2 1 3 8; 2 1 3 1; 2 1 3 1; 0 8 0 1;
     0 2 5 8; 6 4 1 2; 1 4 1 2; 1 3 4 2;
     1 2 1 2; 1 2 1 2; 6 2 4 2; 0 2 0 2]


T = [0 0 0 0; 0 0 0 1; 0 0 1 1 ; 0 1 0 0];

net = newff([min(P')' max(P')'], [5 4], {'logsig' 'purelin'}, 'traingd');
net.trainParam.epochs = 50000;
net.trainParam.goal = 1e-4;
net = train(net, P, T);

C = sim(net, P);