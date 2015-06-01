local http = require("socket.http");
local url= "http://site1.loc:8080/test_request.php";

local body = "name=vasia&age=35";
b,c,h = http.request(url,body);

print(b);
print(c);

for k,v in pairs(h) do
	print(k,v);
end

print('------------------------------------------------------------------');

local headers = { ['User-Agent'] = "Lua 5.1"};
local sink = ltn12.sink.file(io.stdout)
b,c,h = http.request{
	['url'] = url,
	['method'] = "POST",
	['headers'] = headers,
	['sink'] = sink
};

print(b);
print(c);

for k,v in pairs(h) do
	print(k,v);
end 
 
