clear all
%P = [-pi: 0.01: pi];% se trabaja en un rango de los patrones deseados 
P = [1 : 0.1 :2]
T = [sin(P)];
net = newff([-1 1], [6 1], {'tansig' 'tansig'}, 'trainlm');
net.trainParam.goal = 0.0001;
net.trainParam.epochs = 1500;
net = train(net, P, T);

C = sim(net, P);
plot(C);
