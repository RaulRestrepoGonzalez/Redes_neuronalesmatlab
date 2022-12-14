clear all
X = input('Valor de X:');
Y = sin(x);
net = newp([0 1; 0 1], 1)
plotpv(X, Y);
net.iw{1, 1};
net.b{1};
w = input('Digite valor de W:');
net.iw{1, 1} = w;
b = input('Digite valor de B:');
net.b{1} = b;
plotpc(w, b);
net = train(net, X, Y);
