@tool
extends EditorPlugin

@tool
extends EditorPlugin

const SETTING_PATH := "auto_save/interval"


func _enter_tree():
	if not ProjectSettings.has_setting(SETTING_PATH):
		ProjectSettings.set_setting(SETTING_PATH, 60)	ProjectSettings.set_initial_value(SETTING_PATH, 60)
	ProjectSettings.set_as_basic(SETTING_PATH, true)

	print("save seconds: ", ProjectSettings.get_setting(SETTING_PATH))


func _exit_tree():
	print("turn off")