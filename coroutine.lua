co = coroutine.create(function ()
for i=1,10 do
print("co", i)
coroutine.yield()
end
end)

coroutine.resume(co)
coroutine.resume(co) 
coroutine.resume(co) 
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co) 
coroutine.resume(co) 
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co) 
coroutine.resume(co) 
coroutine.resume(co)



