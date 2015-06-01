local socket = require("socket");
local client = socket.tcp();
local port = 7777;
local address = "localhost";
local ip = socket.dns.toip(address);
c = client:connect(ip, port);
local ip,conport = client:getpeername();
print("connected to "..ip..":"..conport);
local req = "";
local res = "";

repeat
	print("enter string: ");
	req = io.read(); 
	client:send(req.."\n");
	res = client:receive('*l');
	print("server response: ", res);
	--print(res ~= "end");
	 
until res == "end"

client:close();