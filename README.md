# MagicMacros
This is a copy of TheDuriel's original MagicMacros repository and I do not own any credit for this repository. Which you can find here https://github.com/TheDuriel/MagicMacros.
The main description can be found there. I made some changes which Duriel didn't find useful but I still wanted to share them. His repo's main approach is to distinguish between indentifier, values and type depending on pascal casing or snake casing. However, I don't follow a particular case for defining my variables name or class_name so it was causing conflict with my workflow and this is only for me and may not the case for you. As such it could completely distrupt the output of macro depending on what argument I feed it and in it if I put any character to capital for example "SignalCaller", this might be registered in remainters. As such I applied a different approach which in exchange the ability to separate types, from identifiers and remainders. Instead I now use 
```
 line_data.get_arg(index, default)
```
here index represents the index of arguement provided with macro after excluding the macro name and the other argument is the value to be returned in case no input is provided.
an example could be
```
var one int 0
```
in here one is indexed 0, int as 1 and 0 integer as index. Now the macro unfolding completely depends the order of your inputs and it can not separate these argumenets automatically. So your input is an important factor unlike how his plugin handles it. It can be considered a downgrade but it can also be considered an upgrade if you like more control. The example of how to build are given under the macros's folder you just need to duplicate one of the inbuilt files and define your macro in there the macro name can be defined in the ALIASES and you only need to edit apply_macro function to define your macro. To check simple examples you can check init or ready macro, for intermediate example you can check out funcion macro and for complex example you can check out vars.
