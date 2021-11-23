# personal_boxes

This script adds ACE action to the selected boxes to unlock and lock them by their owner. 
It is very usefull when you want to prevent people from accesing the ammo crate and taking it's inventory.

#How to use:

Place the ammobox and in the init put following code:
```
[this,"Nickname"] execVM "Init_Crate.sqf";
```

#Parameters:
```
First parameter is object, it could either be this or it's variable name.

Second parameter is string with owner's nick. 
```

#Example:
```
[this,"Fluffy"] execVM "Init_crate.sqf";

[box1,"Riczard"] execVM "Init_crate.sqf";
```