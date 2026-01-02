@icon("../assets/editor_icons/icon.svg")
class_name Blackboard
extends Node

signal value_changed(key: String, old_value: Variant, new_value: Variant)
signal value_erased(key: String, old_value: Variant)

var _data: Dictionary = {}


func set_value(key: String, value: Variant) -> void:
	var old_value = _data.get(key)
	_data[key] = value
	value_changed.emit(key, old_value, value)


func get_value(key: String, default: Variant = null) -> Variant:
	return _data.get(key, default)


func has_value(key: String) -> bool:
	return _data.has(key)


func erase_value(key: String) -> bool:
	if not _data.has(key):
		return false
	
	var old_value = _data[key]
	_data.erase(key)
	value_erased.emit(key, old_value)
	return true


func clear() -> void:
	_data.clear()


func get_keys() -> Array:
	return _data.keys()