%ReD NEURONAL PARA CARAS
clear all

P = [0 2 3 1 1 3 2 0 0 4 4 0 0 0 4 0; 
    0 2 3 1	1 3	2 2	2 2	4 0	0 0	4 0;
    0 3	3 1	1 3	3 0	0 4 4 0 0 2	4 0;
    0 3	3 1	1 3	3 0	0 4	4 0	0 0	4 2;]

Ptraspuesta = transpose(P);

T= [0 0; 0 1; 1 0 ; 1 1];
Ttraspuesta = transpose(T);

net = newff([min(Ptraspuesta')' max(Ptraspuesta')'], [5 2], {'logsig' 'purelin'}, 'traingd');
net.trainParam.epochs = 5000;
net.trainParam.goal = 1e-4;
net = train(net, Ptraspuesta, Ttraspuesta);

C = sim(net, Ptraspuesta);

