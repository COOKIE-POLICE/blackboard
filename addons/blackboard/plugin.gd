@tool
extends EditorPlugin


func _initialize_plugin() -> void:
	add_custom_type(
		"Blackboard", 
		"Node", 
		preload("core/blackboard.gd"),
		preload("assets/editor_icons/icon.svg")
	)

func _deinitialize_plugin() -> void:
	remove_custom_type("Blackboard")

func _enable_plugin() -> void:
	_initialize_plugin()


func _disable_plugin() -> void:
	_deinitialize_plugin()


func _enter_tree() -> void:
	_initialize_plugin()


func _exit_tree() -> void:
	_deinitialize_plugin()
