clc; clear; close all;

% Define the function
f = @(x) x.^3 - 13*x - 12;

% Initial values
x0 = 4.5;
x1 = 5.5;
x2 = 5;

% Tolerance and maximum number of iterations
tol = 1e-6;
max_iter = 100;

% Calling Müller's method
raiz = muller(f, x0, x1, x2, tol, max_iter);
fprintf('Raíz encontrada: %.6f\n', raiz);

function raiz = muller(f, x0, x1, x2, tol, max_iter)
    fprintf('Iter\t x2\t\t f(x2)\n');
    for i = 1:max_iter
        h1 = x1 - x0;
        h2 = x2 - x1;

        d1 = (f(x1) - f(x0)) / h1;
        d2 = (f(x2) - f(x1)) / h2;

        a = (d2 - d1) / (h2 + h1);
        b = a * h2 + d2;
        c = f(x2);

        rad = sqrt(b^2 - 4*a*c);

        if abs(b + rad) > abs(b - rad)
            denominador = b + rad;
        else
            denominador = b - rad;
        end

        numerador = -2 * c / denominador;
        x3 = x2 + numerador;
        
        fprintf('%d\t %.6f\t %.6f\n', i, x3, f(x3));

        if abs(numerador) < tol
            raiz = x3;
            return;
        end

        x0 = x1;
        x1 = x2;
        x2 = x3;
    end
    raiz = x2;
    fprintf('Máximo de iteraciones alcanzado.\n');
end