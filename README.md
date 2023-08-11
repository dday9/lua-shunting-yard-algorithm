# Shunting Yard Algorithm (LUA)

An implementation of the Shunting Yard algorithm ([wiki](https://en.wikipedia.org/wiki/Shunting_yard_algorithm)) written in LUA.

## Demo
Fiddle: https://www.jdoodle.com/ia/KMQ

## Dependencies
- LUA 5.4.6

## Usage
### Simplest Usage
```lua
local expression = "2 + 2"
local postfix = shuntingYardAlgorithm(expression)
print("Postfix:", table.concat(postfix, " "))
```

## Donate
Show your support! Your (non-tax deductible) donation of Monero cryptocurrency is a sign of solidarity among web developers.

Being self taught, I have come a long way over the years. I certainly do not intend on making a living from this free feature, but my hope is to earn a few dollars to validate all of my hard work.

Monero Address: 447SPi8XcexZnF7kYGDboKB6mghWQzRfyScCgDP2r4f2JJTfLGeVcFpKEBT9jazYuW2YG4qn51oLwXpQJ3oEXkeXUsd6TCF

![447SPi8XcexZnF7kYGDboKB6mghWQzRfyScCgDP2r4f2JJTfLGeVcFpKEBT9jazYuW2YG4qn51oLwXpQJ3oEXkeXUsd6TCF](donate.png)
