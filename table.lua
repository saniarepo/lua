t={"12",34,"er",'wqwq'}
for i=1,#t do
	print(t[i]);
end

print('-------------------');

function foo1(n)
	print('I\'m foo1 ' .. n*2);
	return n*2;
end	

function foo2(n)
	print('I\'m foo2 ' .. n-1);
	return n-1;
end

obj1 = {['a']=56, ['b']=23, ['m1']=foo1, ['m2']=foo2};


print(obj1.a, obj1.b, obj1.m1(2), obj1.m2(obj1.b));

print('-------------------');
t2={};
t2.x=10;
t2.y=12;
t2.z=-15;

for key,val in next,t2 do
	print (key,val);
end

print('#t2='..#t2);

foo1=print;
foo1('hello world');

print('-------------------');
function foo3(...)
	for i=1,arg.n do
		print(arg[i]);
	end
end

foo3(3,2,'ewewe',23);

t3={x=5,y=45,z=t2}
for key,val in next,t3 do
	print(key,val); 
end