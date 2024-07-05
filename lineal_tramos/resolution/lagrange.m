% X es un vector que contiene la lista de abscisas
% Y es un vector que contiene la lista de ordenadas
% C es el vector que representa al polinomio interpolador de Lagrange
function C = lagrange(X, Y)
    n = length(X);
    L = zeros(n,n);
    % Calculamos los polinomios base de Lagrange
    for i = 1:n
        % Calculamos el polinomio base usando la productoria
        V = 1;
        for j = 1:n
            if j ~= i
                V = conv(V, poly(X(j)))/(X(i)-X(j));
            end
        end
        % Asignamos nuestro resultado a la i-esima fila de la matriz L
        L(i,:) = V;
    end
    % Finalmente multiplicamos los polinomios a sus respectivas ordenadas
    C = Y*L;
end

