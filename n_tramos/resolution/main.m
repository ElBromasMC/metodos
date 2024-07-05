% El programa principal
function main()
    % Los datos
    g = 1;
    f = @(x) cos(x); % La funcion
    X = -1:0.2:1; % El soporte
    
    % El procedimiento
    Y = f(X);

    % Punto a
    I = min(X):0.001:max(X);
    F = f(I);
    P = tramos(g, X, Y, I);
    subplot(1,2,1);
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
    subplot(1,2,2);
    plot(I, abs(F-P));
end


