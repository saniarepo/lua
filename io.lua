--ввод-вывод
t=io.read("*all");
print(t);
f = io.open("outfile.txt", "w");
f:write(t);
f:close();


s=io.read(3);
print(s);

f = io.open("test.txt","r");
text = f:read("*all");
f:close();
print(text);