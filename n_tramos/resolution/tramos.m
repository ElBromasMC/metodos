% g es el grado de los polinomios interpoladores
% M es un vector que contiene la lista de abscisas
% N es un vector que contiene la lista de ordenadas
% X es el dominio
% Y es el rango

function Y = tramos(g, M, N, X)
    T = lagrange_tramos(g, M, N);
    k = rows(T);
    Y = zeros(1, length(X));
    for i = 1:k
        ind = M((i-1)*(g)+1) <= X & X <= M((i)*(g)+1);
        Y(ind) = polyval(T(i,:), X(ind));
    end
end
