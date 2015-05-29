Set = {}

local mt = {} --metatable
-- create a new set with the values of the given list
function Set.new (l)
	local set = {}
	setmetatable(set, mt)
	for _, v in ipairs(l) do set[v] = true end
	return set
end

function Set.union (a, b)
	local res = Set.new{}
	for k in pairs(a) do res[k] = true end
	for k in pairs(b) do res[k] = true end
	return res
end

function Set.intersection (a, b)
	local res = Set.new{}
	for k in pairs(a) do
		res[k] = b[k]
	end
	return res
end

function Set.tostring (set)
	local l = {} -- list to put all elements from the set
	for e in pairs(set) do
		l[#l + 1] = e
	end
	return "{" .. table.concat(l, ", ") .. "}"
end

function Set.print (s)
	print(Set.tostring(s))
end

mt.__add = Set.union
mt.__mul = Set.intersection

mt.__le = function (a, b) -- set containment
	for k in pairs(a) do
	if not b[k] then return false end
	end
	return true
end

mt.__lt = function (a, b)
	return a <= b and not (b <= a)
end


mt.__eq = function (a, b)
	return a <= b and b <= a
end

s1 = Set.new{10, 20, 30, 50}
s2 = Set.new{30, 1}

s3 = s1 + s2
Set.print(s3)

Set.print((s1 + s2)*s1) 

s1 = Set.new{2, 4}
s2 = Set.new{4, 10, 2}

print(s1 <= s2) --> true
print(s1 < s2) --> true
print(s1 >= s1) --> true
print(s1 > s1) --> false
print(s1 == s2 * s1) --> true

Window = {} -- create a namespace
-- create the prototype with default values
Window.prototype = {x=0, y=0, width=100, height=100}
Window.mt = {} -- create a metatable

-- declare the constructor function
function Window.new (o)
	setmetatable(o, Window.mt)
	return o
end

Window.mt.__index = function (table, key)
	return Window.prototype[key]
end
	
w = Window.new{x=10, y=20}
print(w.width) --> 100

function setDefault (t, d)
	local mt = {__index = function () return d end}
	setmetatable(t, mt)
end

tab = {x=10, y=20}

print(tab.x, tab.z) --> 10 nil
setDefault(tab, 0)
print(tab.x, tab.z) --> 10 0
t = {} -- original table (created somewhere)
-- keep a private access to the original table
local _t = t
-- create proxy
t = {}
-- create metatable
local mt = {
	__index = function (t, k)
		print("*access to element " .. tostring(k))
		return _t[k] -- access the original table
	end,
	__newindex = function (t, k, v)
		print("*update of element " .. tostring(k) .." to " .. tostring(v))
		_t[k] = v -- update original table
	end
}
setmetatable(t, mt)

t[2] = "hello"

print(t[2])

function readOnly (t)
	local proxy = {}
	local mt = { -- create metatable
		__index = t,
		__newindex = function (t, k, v)
			error("attempt to update a read-only table", 2)
		end
	}
	setmetatable(proxy, mt)
	return proxy
end


days = readOnly{"Sunday", "Monday", "Tuesday", "Wednesday","Thursday", "Friday", "Saturday"}
print(days[1]) --> Sunday
days[2] = "Noday"



