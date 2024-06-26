% El programa principal
function main()
    % Los datos
    X = [0, 6, 10, 13, 17, 20, 28]; % El soporte
    Y1 = [6.67, 17.33, 42.67, 37.33, 30.10, 29.31, 28.74]; % Muestra 1
    Y2 = [6.67, 16.11, 18.89, 15.00, 10.56, 9.44, 8.89]; % Muestra 2
    
    % El procedimiento
    disp("Calculamos el polinomio interpolador de lagrange para cada muestra:");
    disp("\nMuestra 1:")
    [L1, C1] = lagrange(X, Y1);
    polyout(L1, 'x');
    polyval(L1, X)

    disp("\nMuestra 2:")
    [L2, C2] = lagrange(X, Y2);
    polyout(L2, 'x');
    polyval(L2, X)
    
    % Punto a
    disp("\nGrafiquemos las interpolaciones:");
    D = 0:0.001:28; % El intervalo
    I1 = polyval(L1, D);
    I2 = polyval(L2, D);
    plot(D, I1);
    hold on;
    plot(D, I2);
    hold off;
    %ylim([0 60]);
    grid on;
    legend('Muestra 1', 'Muestra 2');
    title("Las muestras");
    
    % Punto b
    disp("\nHallamos el máximo aproximado, usando las interpolaciones");
    disp(["Máximo de la muestra 1: ", num2str(max(I1))]);
    disp(["Máximo de la muestra 2: ", num2str(max(I2))]);

    % Punto c
    disp("\nGraficamos los polinomios base:");
    % Muestra 1
    subplot(1, 2, 1);
    hold on;
    for i = 1:length(X)
        plot(D, polyval(C1(i,:), D));
    end
    hold off;
    
    % Muestra 2
    subplot(1, 2, 2);
    hold on;
    for i = 1:length(X)
        plot(D, polyval(C2(i,:), D));
    end
    hold off;
end

