
function x = cheb_nodes(a, b, n)
    k = 1:n;
    x = (a + b) / 2 + (b - a) / 2 * cos((2*k - 1) * pi / (2*n));
end
