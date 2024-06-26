% El programa principal
function main()
    % Los datos
    v = 11.2; % El valor de la velocidad
    g = 9.81;
    alpha = 1/60;
    beta = 680;
    f = @(t) beta*log(1./(1-alpha*t))-g*t; % La funcion
    X = 0:12; % El soporte

    % El procedimiento
    Y = f(X);

    disp("Calculamos el polinomio interpolador de lagrange:");
    [C, L] = lagrange(X, Y);
    
    disp("\nEl polinomio interpolador de Lagrange resultante es:");
    polyout(C, 'x');

    % Punto a
    R = roots(C - [zeros(1, length(X) - 1) v]);
    r= R(min(X)<=R & R<=max(X)); % Filtramos las raices
    disp(["\nEl instante donde la v = ", num2str(v), ", es"]);
    disp(["t = ", num2str(r)]);
 
    % Punto b
    I = min(X):0.001:max(X); % El intervalo
    disp("\nGrafiquemos la función y su interpolación:");
    subplot(1, 2, 1);
    hold on;
    plot(I, f(I));
    plot(I, polyval(C, I));
    scatter(X, Y, 100, 'b', 'filled');
    hold off;
    grid on;
    legend('La función', 'Su interpolación');
    title("La función y su interpolación");

    % Punto c
    disp("\nGrafiquemos las bases de la interpolación");
    subplot(1, 2, 2);
    hold on;
    for i = 1:length(X)
        plot(I, polyval(L(i,:), I))
    end
    hold off;
end


