%%
%     Aluno: João Antonio Mota Barioni
%     Disciplina: Modelagem Matemática
%     APS 2
%%
% Syms
syms y(t)

% Definição da equação diferencial
ode = diff(y) == -y;

% Solução geral da equação diferencial
general_solution = dsolve(ode);

% Solução particular, dado uma condição inicial específica
particular_solution = dsolve(ode, y(0) == 2);

% Plota as curvas do campo direcional
[Ut, Uy] = meshgrid(linspace(-2, 4, 40), linspace(-2, 4, 40));
Solution = -Uy; % Para a equação dy/dt = -y, o campo direcional é -y

% Agora divide pelo comprimento para normalizar os vetores
figure(1), clf, hold on
L = sqrt(1 + Solution.^2);
h = quiver(Ut, Uy, 1 ./ L, Solution ./ L, 0.5);
set(h, 'LineWidth', 2, 'Color', [0.8 0.8 0.8])

% Valores iniciais para a solução y no t0
InitialValues = [2, 1, 0.5, 0.25];

% Desenha as curvas de solução para esses valores iniciais
for i = 1:length(InitialValues)
    % Usa dsolve para resolver a ODE com a condição inicial correspondente
    sol = dsolve(ode, y(0) == InitialValues(i));
    fplot(sol, [min(Ut(:)), max(Ut(:))], 'LineWidth', 2);
end

axis([min(Ut(:)) max(Ut(:)) min(Uy(:)) max(Uy(:))])
title('Campo Direcional e Soluções Particulares')
xlabel('Tempo t')
ylabel('Solução y(t)')
hold off
