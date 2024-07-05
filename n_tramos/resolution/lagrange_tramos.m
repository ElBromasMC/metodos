% g es el grado de los polinomios interpoladores
% X es un vector que contiene la lista de abscisas
% Y es un vector que contiene la lista de ordenada
% T es una matriz de los coeficientes
function T = lagrange_tramos(g, X, Y)
    n = length(X);
    k = idivide(n-1, int32(g), 'fix');
    T = zeros(k, g+1);
    for i = 1:k
        r = (i-1)*(g)+1:(i)*(g)+1;
        C = lagrange(X(r), Y(r));
        T(i,:) = C; 
    end
end
