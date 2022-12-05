// New machine to print bluespace bags with resources from an ore silo
/obj/machinery/rnd/production/baglathe
	name = "bag protolathe"
	desc = "Converts raw materials into bags. Make your own bags!"
	icon_state = "protolathe" // Could use a custom sprite
	circuit = /obj/item/circuitboard/machine/baglathe
	categories = list(
		"Bluespace Designs"
	)
	console_link = FALSE
	production_animation = "protolathe_n"
	requires_console = FALSE
	allowed_buildtypes = BAGLATHE
