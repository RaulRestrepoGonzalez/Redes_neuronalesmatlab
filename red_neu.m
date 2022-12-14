clear all
P = input('Valor de P:');
T = input('Valor de T:');
neu = input('Digite cuantas capas desea trabajar:');
if neu == 1
Na = input('Valor de neuronas:');%entre corchete
Ns = input('Valor de las salidas:'); 
net = newff([min(P')' max(P')'], [Na Ns], {'tansig' 'logsig'}, 'traingd');
else 
    if neu == 2 
      Na = input('Valor de neuronas:');%entre corchete
      Nu = input('Valor de capa intermedia:');
      Ns = input('Valor de las salidas:'); 
      net = newff([min(P')' max(P')'], [Na Nu Ns], {'tansig' 'logsig' 'tansig'}, 'traingd');
    end 
end
net.Lw{2, 1};
c = input('Iteracion:');
net.trainParam.epochs = c;
e = input('Valor del error:');%1e-8
net.trainParam.goal = e;
net = train(net, P, T);
