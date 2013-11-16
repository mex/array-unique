lodash = require 'lodash'
underscore = require 'underscore'

base = []
result =
	default: []
	sorted: []

for i in [0...1000000]
	val = Math.round(Math.random() * 1000)
	base.push(val)
	if result.default.indexOf(val) is -1
		result.default.push(val)
result.sorted = lodash.clone(result.default)
result.sorted.sort (a, b) ->
	return a - b

verify = (arr, isSorted = false) ->
	if isSorted
		results = result.sorted
	else
		results = result.default
	if results.length isnt arr.length
		return false
	else
		for i in [42, 400, 684, 842]
			if results[i] isnt parseInt(arr[i])
				return false
	return true

Array.prototype.unique1 = () ->
	u = {}
	a = []
	for v in this
		if u.hasOwnProperty(v)
			continue
		a.push(v)
		u[v] = 1
	return a
Array.prototype.unique2 = () ->
	o = {}
	a = []
	for v in this
		o[v] = 1
	for v in Object.keys(o)
		a.push(v)
	return a

now = Date.now()
arr = []
for i in [0...1000000]
	num = base[i]
	arr.push(num)
arr = arr.filter (num, index, self) ->
	return self.indexOf(num) is index
console.log('filter, indexOf      ', Date.now() - now, 'ms')
unless verify(arr)
	console.log('Error: Unexpected array contents')

now = Date.now()
arr = []
for i in [0...1000000]
	num = base[i]
	arr.push(num)
arr = arr.unique1()
console.log('for, hasOwnProperty  ', Date.now() - now, 'ms')
unless verify(arr)
	console.log('Error: Unexpected array contents')

now = Date.now()
arr = []
for i in [0...1000000]
	num = base[i]
	arr.push(num)
arr = arr.unique2()
console.log('for, twice           ', Date.now() - now, 'ms')
unless verify(arr, true)
	console.log('Error: Unexpected array contents')

now = Date.now()
arr = []
for i in [0...1000000]
	num = base[i]
	if arr.indexOf(num) is -1
		arr.push(num)
console.log('indexOf, insert      ', Date.now() - now, 'ms')
unless verify(arr)
	console.log('Error: Unexpected array contents')

now = Date.now()
col = []
for i in [0...1000000]
	num = base[i]
	col[num] = 1
arr = Object.keys(col)
console.log('object, keys         ', Date.now() - now, 'ms')
unless verify(arr, true)
	console.log('Error: Unexpected array contents')

now = Date.now()
arr = []
for i in [0...1000000]
	num = base[i]
	arr.push(num)
arr = lodash.uniq(arr)
console.log('lodash               ', Date.now() - now, 'ms')
unless verify(arr)
	console.log('Error: Unexpected array contents')

now = Date.now()
arr = []
for i in [0...1000000]
	num = base[i]
	arr.push(num)
arr = underscore.uniq(arr)
console.log('underscore           ', Date.now() - now, 'ms')
unless verify(arr)
	console.log('Error: Unexpected array contents')
