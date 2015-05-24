--строки
print('input string:');
str = io.read();
n = tonumber(str); 
if n == nil then
	print('you input string');
else
	print('you input number'..tostring(n));
end

line=io.read("*line");
print(string.match(line, "(%S+)%s+(%S+)"));
