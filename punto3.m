clear all

X = [1 1; 0 0; 2 2; 1 0; 2 0; 0 1];
Xtraspuesta = transpose(X);

Y = [1; 1; 1; 0; 0; 0];
Ytraspuesta = transpose(Y);

%net = newff(Xtraspuesta, Ytraspuesta, [2 1], {'tansig' 'logsig'}, 'traingd');
net = newff([min(Xtraspuesta')' max(Xtraspuesta')'], [2 1], {'logsig' 'purelin'}, 'traingd');
w = net.iw{1, 1};
b = net.b{1};
net.trainParam.epochs = 50000;
net.trainParam.goal = 1e-5;

%net.b{1} = [0.5];
net = train(net, Xtraspuesta, Ytraspuesta);
C = sim(net, Xtraspuesta); 
plotpc(w, b);

