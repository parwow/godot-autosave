@tool
extends EditorPlugin

const AUTO_SAVE_TIME: float = 30.0

var timer: Timer


func _enter_tree() -> void:
	print("[Auto Save+] 플러그인 시작")

	timer = Timer.new()
	timer.wait_time = AUTO_SAVE_TIME
	timer.one_shot = false
	timer.autostart = true
	timer.timeout.connect(_auto_save)

	add_child(timer)

	print("[Auto Save+] 30초마다 자동 저장합니다.")


func _exit_tree() -> void:
	print("[Auto Save+] 플러그인 종료")

	if timer:
		timer.timeout.disconnect(_auto_save)
		timer.stop()
		timer.queue_free()
		timer = null


func _auto_save() -> void:
	print("[Auto Save+] 자동 저장 실행")

	if EditorInterface.get_edited_scene_root() == null:
		print("[Auto Save+] 저장할 씬이 없습니다.")
		return

	EditorInterface.save_scene()

	print("[Auto Save+] 저장 완료")
