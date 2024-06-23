% El programa principal
function main()
    % Los datos
    f = @(x) sin(x)+exp(sqrt(x.^2+1)); % La funcion
    X = [-3, -2, -1, 0, 1, 2, 3]; % El soporte
    T = [1/2]; % Los valores de prueba
    
    % El procedimiento
    Y = f(X);

    % Punto a
    disp("Calculamos el polinomio interpolador de lagrange:");
    C = lagrange(X, Y);
    
    % Punto b
    disp("\nEl polinomio interpolador de Lagrange resultante es:");
    polyout(C, 'x');
    
    % Punto c
    disp("\nGrafiquemos la función y su interpolación:");
    I = min(X)-1:0.0001:max(X)+1;
    plot(I, f(I));
    hold on;
    plot(I, polyval(C, I));
    scatter(X, Y, 100, 'b', 'filled');
    hold off;
    %ylim([0 60]);
    grid on;
    legend('La función', 'Su interpolación');
    title("La función y su interpolación");
    
    % Punto d
    disp("\nAproximemos la función con nuestra interpolación");
    disp("t\tf(t)\t\tp(t)\t\tE_a");
    disp("--------------------------------------------------");
    for t = T
        ft = f(t);
        pt = polyval(C, t);
        ea = ft - pt;
        disp([num2str(t), "\t", num2str(ft, "%.6f"), "\t", ...
            num2str(pt, "%.6f"), "\t", num2str(ea, "%.6f")]);
    end
end


