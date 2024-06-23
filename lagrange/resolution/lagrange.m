% X es un vector que contiene la lista de abscisas
% Y es un vector que contiene la lista de ordenadas
% C es el vector que representa al polinomio interpolador de Lagrange
function C = lagrange(X, Y)
    n = length(X);
    L = zeros(n,n);
    % Calculamos los polinomios base de Lagrange
    disp("i\tx_i\ty_i\tL_i")
    disp("------------------------------------")
    for i = 1:n
        % Calculamos el polinomio base usando la productoria
        V = 1;
        for j = 1:n
            if j ~= i
                V = conv(V, poly(X(j)))/(X(i)-X(j));
            end
        end
        % Imprimimos el polinomio base calculado
        disp([num2str(i), "\t", num2str(X(i)), "\t", num2str(Y(i)), ...
            "\t", polyout(V, 'x')]);
        % Asignamos nuestro resultado a la i-esima fila de la matriz L
        L(i,:) = V;
    end
    % Finalmente multiplicamos los polinomios a sus respectivas ordenadas
    C = Y*L;
end

