clear all

P = [5 2 5 3 2 2 2 3;
    0 5	0 1	1 1	1 1;
    4 3	4 3	1 3	1 3;
    0 3	5 2	1 2	1 2;
    3 1	5 2	2 3	1 1; 
    4 3	4 3	1 3	1 3; 
    5 3	4 3	1 3	2 3; 
    1 1	5 3	1 1	1 1; 
    5 3	5 3	2 3	2 3; 
    4 3	5 3	2 3	1 3]

T = [0 0 0 0; 0 0 0 1; 0 0 1 0; 0 0 1 1; 0 1 0 0; 0 1 0 1; 0 1 1 0; 0 1 1 1; 1 0 0 0; 1 0 0 1]

Ptraspuesta = transpose(P);
Ttraspuesta = transpose(T);
net = newp(Ptraspuesta, Ttraspuesta, 'hardlim', 'learnp');
net = train(net, Ptraspuesta, Ttraspuesta);
C = sim(net, Ptraspuesta);

