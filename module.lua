m = require "my_mod"

print(package.path);
for k,v in pairs(package.loaded) do
	print(k,v);
	for i,f in pairs(v) do
		print('\t',i,f);
	end
end
m.foo1();
print(m.x);
print(m.y);

m.foo3();
m._foo2();