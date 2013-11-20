array-unique
============
Testing the speed of different ways of creating a distinct array of numbers.

The tests are using 1,000,000 entries with values from 1 to 1000.

Results might be different, when using non-primitive types.

### Testing

Run `npm install` and then `npm start` to get the results.

### Example result
```
filter, indexOf       4912 ms
for, hasOwnProperty   149 ms
for, twice            70 ms
indexOf, insert       2553 ms
object, keys          9 ms
lodash                84 ms
underscore            2662 ms
```
