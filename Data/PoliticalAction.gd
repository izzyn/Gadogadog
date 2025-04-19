extends Resource
class_name Political_Action

var id : String

var _start_time : int

@export
var text : String

@export
var upon_start : Array[Log_Entry]

@export
var upon_completion : Array[Log_Entry]

@export
var completion_time : int

var category : String
