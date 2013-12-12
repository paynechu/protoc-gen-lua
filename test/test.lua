package.path = package.path .. ';../?.lua;../?/init.lua;;'
package.cpath = package.cpath .. ';../?.so;;'

require 'person_pb'

local person= person_pb.Person()
person.id = 1000
person.name = "Alice"
person.email = "Alice@example.com"
person.test.field = 'hello'
local t2 = person.test2
local t3 = person.test3
local t31 = t3:add()
t31.field = 'field1'
local t32 = t3:add()
t32.field = 'field2'

local home = person.Extensions[person_pb.Phone.phones]:add()
home.num = "2147483647"
home.type = person_pb.Phone.HOME

local data = person:SerializeToString()

local msg = person_pb.Person()

msg:ParseFromString(data)
print(msg)
