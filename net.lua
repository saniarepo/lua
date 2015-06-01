socket = require "socket";
print(socket._VERSION);

http = require("socket.http")
print(http.request("http://ya.ru"))

--просмотр подключенных модулей и методов в них
for k,v in pairs(package.loaded) do
	print(k,v);
	for i,f in pairs(v) do
		print('\t',i,f);
	end
end
