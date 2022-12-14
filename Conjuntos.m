clear all
%X = [1 1 0 0 2 2; 1 0 2 0 0 1]

%X = [1 0 2 1 2 0; 1 0 2 0 0 1];
X = [1 1; 0 0; 2 2; 1 0; 2 0; 0 1];
%Xtraspuesta = transpose(X);

Y = [1; 1; 1; 0; 0; 0];
Ytraspuesta = transpose(Y);
%net = newp(Xtraspuesta, Ytraspuesta, 'hardlim', 'learnp');
net = newp(Xtraspuesta, Ytraspuesta, 'hardlim', 'learnp');
w = net.iw{1, 1};
b = net.b{1};
net.Iw{1, 1} = [0 0.5];
net.b{1} = [0.5];

net = train(net, Xtraspuesta, Ytraspuesta);
%net = train(net, Xtraspuesta, Y);

%C = sim(net, Xtraspuesta);
C = sim(net, Xtraspuesta);
plotpc(w, b);
