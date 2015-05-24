--сортировка
lines = {d=10,a=20,c=30}
a={}
for n in pairs(lines) do
	a[#a+1] = n; 
end;

table.sort(a);
for i,n in ipairs(a) do
	print(i,n);
end;

lines = {};
print('--------------------------------');
for line in io.lines() do
	table.insert(lines, line);
end

print('--------------------------------');
table.sort(lines);
for _,l in ipairs(lines) do
	print(l); 
end

local res = {'qwqwq', 'eireir', 'asdswd'}

print(table.concat(res));

s='qqw lwk fjeoidew dwdswd q';
words = {}
for w in string.gmatch(s, "%a+") do
	words[#words + 1] = w
end

for _,w in ipairs(words) do
	print(w);
end;