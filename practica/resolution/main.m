% El programa principal
function main()
    format long;
    % Los datos
    f = @(x) 1./sqrt(x.^2+1); % La funcion
    X = cheb_nodes(-3, 3, 11); % El soporte
    
    % El procedimiento
    Y = f(X);

    % Punto a
    disp("Calculamos el polinomio interpolador de lagrange:");
    [C, L] = lagrange(X, Y);
    
    % Punto b
    disp("\nEl polinomio interpolador de Lagrange resultante es:");
    polyout(C, 'x');
    
    % Punto c
    I = min(X):0.001:max(X);
    F = f(I);
    P = polyval(C, I);
    subplot(2, 2, 1);
    hold on;
    disp("\nGrafiquemos la función y su interpolación:");
    plot(I, F);
    plot(I, P);
    scatter(X, Y, 100, 'b', 'filled');
    hold off;
    %ylim([0 60]);
    grid on;
    legend('La función', 'Su interpolación');
    title("La función y su interpolación");
    
    % Punto d
    subplot(2, 2, 2);
    hold on;
    for i = 1:length(X)
        plot(I, polyval(L(i,:), I));
    end
    title("Los polinomios base");
    hold off;

    % Punto e
    subplot(2, 2, 3);
    hold on;
    E = abs(F-P);
    plot(I, E);
    title("El error");
    hold off;
    disp(["\nLa cota del error máximo es: ", num2str(max(E), "%.8f")]);
end


