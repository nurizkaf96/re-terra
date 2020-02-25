extends ProgressBar

func _on_Dispatcher_energy_changed(newvalue : int) -> void:
	value = newvalue
