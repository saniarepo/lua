local my_mod = {}

function my_mod.foo1()
	print('call my_mod.foo1');
end

--private function
local function _foo2()
	print('call my_mod._foo2');
end

function my_mod.foo3()
	_foo2();
end

my_mod.x = "param x";
local y1 = "param y";
my_mod['y'] = y1;

return my_mod 