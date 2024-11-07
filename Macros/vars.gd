@tool
extends MagicMacrosMacro

const ALIASES: Array[String] = ["vars"]


static func is_macro_alias(arg: String) -> bool:
	return arg in ALIASES


static func apply_macro(line_data: MagicMacrosLineData) -> String:
	var s: String = ""
	var type: int = 0
	if line_data.get_arg(0).is_valid_int():
		type = line_data.get_arg(0).to_int()
		line_data.arguements.remove_at(0)
	var last_index: int = line_data.arguements.size()-1
	match type:
		0:
			for i in line_data.arguements.size()/2:
				s += "var %s: %s\n" % [line_data.get_arg(2*i,"place_holder"), line_data.get_arg(2*i + 1,"int")]
		1:
			for i in last_index-1:
				s+= "var %s: %s = %s\n" % [line_data.get_arg(i,"val"+str(i)), line_data.get_arg(last_index-1,"int"), line_data.get_arg(last_index,"0")]
		2:
			var count: int = 1
			if line_data.get_arg(last_index,"1").is_valid_int():
				count = line_data.get_arg(last_index,"1").to_int()
			for i in count:
				s+= "var %s: %s = %s\n" % [line_data.get_arg(0,"val")+str(i), line_data.get_arg(last_index-2,"int"), line_data.get_arg(last_index-1,"0")]
	return s

# Examples: 
#1->
# vars 0 one int two float three Color gives but 0 is default and can be used without putting 0
# var one: int
# var two: float
# var three: Color
#2->
# vars 1 one two three int 0 gives
# var one : int = 0
# var two : int = 0
# var three : int = 0
#3->
# vars 2 one int 0 3 gives
# var one0: int = 0
# var one1: int = 0
# var one2: int = 0
