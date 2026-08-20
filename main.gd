@tool
extends EditorPlugin


func _enter_tree():
	print("플러그인 활성화!")


func _exit_tree():
	print("플러그인 비활성화!")