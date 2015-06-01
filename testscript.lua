t={}
t.x=10
for i=1,t.x do print(i) end
http=require("socket.http")
url="http://site1.loc:8080/test_request.php"
b,c,h = http.request(url)
print(b)
print(c)
for k,v in pairs(h) do print(k,v) end