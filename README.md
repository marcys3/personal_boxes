# personal_boxes

This script adds ACE action to the selected boxes to unlock and lock them by their owner. 
It is very useful when you want to prevent people from accessing the ammo crate and taking its inventory.

# How to use:

Place the ammo box and in the init put the following code:
```
[this,"Nickname"] execVM "Init_Crate.sqf";
```

# Parameters:
```
A first parameter is an object.

The second parameter is a string with the owner's nick. 
```

# Examples:
```
[this,"Fluffy"] execVM "Init_crate.sqf";

[box1,"Riczard"] execVM "Init_crate.sqf";
```