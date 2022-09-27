# currently-unnamed-language
This is a small programming language I'm working on mostly in school, its like c with the quality of life and syntax similar to ruby

# planed syntax for basic functionality

## general goals
I dont like symbols much and want to avid them as much as posible, that means ruby/lua style end statments instead of curly braces, also no unnececary parenthesies where some languages require them and no pointless commas like in python.

the language will of course also not have any semi colons for obvious reasons.

## vairiables and functions
vairiables and functions work like they do in c, type then name.

global vairiables
```
int someInt = 0
float someFloat = 1.0
```

function definitions
```
int main(void)
    //code here
end
```

## if and else
basic if statment
```
if a < b
    //do stuff
end
```

else and elif
```
if a == b
    //do stuff
elif a * 2 >= b
    //do other stuffs
else
    //do the other other styff
end
```

## loops
all types of loops use the same loop keyword and only change based on the content of the loop


while loop, works if the loop keyword gets a boolean function
```
loop a < b
    //looped styff
end
```
c style for loops, the initial value is just declared outside the loop, its more readable and a lot easier to implement lol, yet again if the first statment in the loop is a boolean function will it work like a while loop, statment after is where you would write your incrementor function
int x = 0
```
loop x < 10, x++
    //for loop contents
end
```
there is also the more pythonic array loop that iterates through an array
```
loop someArray
    //array stuff
end
```
and the reversed keyword to loop the array in reverse
```
loop reversed someArray
    //array things
end
```
