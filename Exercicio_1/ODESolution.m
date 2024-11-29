%%
%     Aluno: João Antonio Mota Barioni
%     Disciplina: Modelagem Matemática
%     APS 2
%%

% Definição da equação diferencial e condição inicial
ode = @(t, y) -y;

% Valores iniciais para a solução y no t0
InitialValues = [2, 1, 0.5, 0.25];
tspan = [0, 5]; % Intervalo de tempo para a simulação

figure(2), clf, hold on

% Resolver e plotar cada solução
for i = 1:length(InitialValues)
    [T, Y] = ode45(ode, tspan, InitialValues(i));
    plot(T, Y, 'LineWidth', 2);
end

% Configurações do gráfico
title('Soluções Particulares de dy/dt = -y')
xlabel('Tempo t')
ylabel('Solução y(t)')
legend(arrayfun(@(c) sprintf('y(0) = %.2f', c), InitialValues, 'UniformOutput', false))
hold off