/obj/item/circuitboard/machine/research_table
	name = "Sex Research Rack (Machine Board)"
	build_path = /obj/machinery/research_table
	req_components = list(
		/obj/item/dildo = 1,
		/obj/item/stack/cable_coil = 15,
		/obj/item/stack/sheet/mineral/silver = 15,
		/obj/item/restraints/handcuffs = 1,
		/obj/item/stock_parts/manipulator = 1,
		/obj/item/stock_parts/scanning_module = 2,
		/obj/item/stock_parts/matter_bin = 1
	)

/obj/item/circuitboard/machine/baglathe
	name = "Bag Protolathe (Machine Board)"
	icon_state = "generic"
	build_path = /obj/machinery/rnd/production/baglathe
	req_components = list( // Copied from Protolathe
		/obj/item/stock_parts/matter_bin = 2,
		/obj/item/stock_parts/manipulator = 2)
