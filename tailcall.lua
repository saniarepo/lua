--последний вызов
function g(x) return 2*x; end;

function f(x) return g(x); end;
function f2(x) g(x); end;

print(f(3));
print(f2(3));