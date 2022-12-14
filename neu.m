%P es igual a un vector y T es igual a otro vector de salida%
%P = [1 0 1 1; 0 1 0 1]; T = [0 1 1 0];
net = newff([min(P')' max(P')'], [5 1], {'tansig' 'logsig'}, 'traingd');
net.iw{1, 1};%net.iw{1, 1} = [1.5 1.8]
net.b{1};%net.b{1} = [1]
net.Lw{2, 1};
net.trainParam.epochs = 100;
net.trainParam.goal = 1e-8;
net.trainParam.lr = 0.01;
net.trainParam.show = 25;

%net = train(net, P, T)%
%C = sim(net, P)% Es igual a la salida de la red = T

net.trainParam.mc = 0.9;

net.trainParam.lr_inc = 1.05;
net.trainParam.lr_dec = 0.7;
net.trainParam.max_perf_inc = 1.04;

%red perceptron%
net = newp([0 1; 0 1], 1)
net = newp([0 1; 0 1], 1, {'hardlim' }, 'learnp');
plotpv(X, Y);
w = net.iw{1, 1};
b = net.b{1};
plotpc(w, b);

%impot body fat data set%
predictors = [0 1 0 1; 0 0 1 1];
responses = [0 0 0 1];