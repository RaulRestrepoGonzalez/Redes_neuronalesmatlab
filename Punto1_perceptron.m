
%Mayor pares y primos
P = [0 5 2 5 0 3 2 2 2 3; 
    0 0 5 0 0 1 1 1 1 1; 
    0 4 3 4 0 3 1 3 1 3; 
    0 0 3 5 0 2 1 2 1 2; 
    3 1 5 0 0 2 2 3 1 1; 
    0 4 3 4 0 3 1 3 1 3; 
    0 5 3 4 0 3 1 3 2 3; 
    0 1 1 5 0 3 1 1 1 1; 
    0 5 3 5 0 3 2 3 2 3; 
    0 3 2 5 0 3 2 3 1 1]

T = [0 0 0; 0 0 0; 0 1 1; 0 1 0; 1 0 1; 0 1 0; 1 1 0; 1 0 1; 1 1 0; 0 1 0]

Ptraspuesta = transpose(P);
Ttraspuesta = transpose(T);

net = newff(Ptraspuesta, Ttraspuesta, [5 3], {'tansig' 'satlin'}, 'trainlm');
net.trainParam.epochs = 1500;
net.trainParam.goal = 1e-9;
net = train(net, Ptraspuesta, Ttraspuesta);
C = sim(net, Ptraspuesta);


