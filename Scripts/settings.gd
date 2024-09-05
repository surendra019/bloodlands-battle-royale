extends Control

@onready var option_category_container = $Body/Panel/OptionCategoryContainer

const OPTION_CATEGORY_PREFAB = preload("res://Scenes/Prefabs/option_category_prefab.tscn")

func _ready():
	add_option_category("General")
	add_option_category("Audio")
	add_option_category("Graphics")
	
# adds option to the option category container.
func add_option_category(category_id: String):
	var option = OPTION_CATEGORY_PREFAB.instantiate()
	option_category_container.add_child(option)
	option.initialize(category_id)
	option.selected.connect(func(opt):
		if option_category_container:
			for i in option_category_container.get_children():
				if i.current_state == i.STATE.SELECTED && i != opt:
					i.set_state(i.STATE.UNSELECTED)
		)
