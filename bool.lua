--булевые значения
print("Test boolean");
if true == nil  then
	print("false = nil");
else
	print("false <> nil");
end

if 0 == ""  then
	print("0 = ''");
else
	print("0 <> ''");
end

if 0 == false  then
	print("0 = false");
else
	print("0 <> false");
end

if '' == false  then
	print("'' = false");
else
	print("'' <> false");
end


if 0 then
	print('true');
else
	print("false");
end

print('\049');

g = 100;
print(g*2);
print(_G.g*3);

local a = [=[определение строки [[string]] в Lua]=]
local b= [[
wsjqwsqlwsqwlq;w
qqsqwsqwsq
wqeswewe
]] 


print(a);
print(b);


x={[1]="one"};
y={[1]=x}
z=y[1][1]
print(z); 