-- load namespace
local socket = require("socket")
-- create a TCP socket and bind it to the local host, at any port
local server = assert(socket.bind("*", 7777))
-- find out which port the OS chose for us
local ip, port = server:getsockname()
-- print a message informing what's up
print("TCP server start on port " .. port)-- loop forever waiting for clients

while 1 do
  -- wait for a connection from any client
  local client = server:accept()
  print('connected!');
  -- make sure we don't block waiting for this client's line
  --client:settimeout(10)
  -- receive the line
  
  repeat
	  local line, err = client:receive()
	  print('client send: ', line);
	 
	  -- if there was no error, send it back to the client
	  if not err then client:send(line .. "\n") 
	  else  print('error:', err); end;
  until line == "end" or line == nil
  -- done with client, close the object
  client:close();
  print('close!');
end