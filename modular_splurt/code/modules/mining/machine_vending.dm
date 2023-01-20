// This file adds additional items to the mining vendor

/obj/machinery/mineral/equipment_vendor/Initialize(mapload)
	. = ..()

	// List of items to add
	// If you add something to this, please sort it by price
	prize_list += list(
			new /datum/data/mining_equipment("Autosurgeon: Ash Lungs",		/obj/item/autosurgeon/lungs_ashwalker,								150),
			new /datum/data/mining_equipment("Synthetic Goliath Plates",	/obj/item/stack/sheet/animalhide/goliath_hide/synthetic,			300),
			new /datum/data/mining_equipment("Synthetic Watcher Sinew",		/obj/item/stack/sheet/sinew/synthetic,								300),
			new /datum/data/mining_equipment("Night Vision Meson Goggles",	/obj/item/clothing/glasses/meson/night,								1000),
			new /datum/data/mining_equipment("Hypospray Kit: Burn",			/obj/item/storage/hypospraykit/fire,								1200),
			new /datum/data/mining_equipment("Hypospray Kit: Brute",		/obj/item/storage/hypospraykit/brute,								1200),
			new /datum/data/mining_equipment("Hypospray Kit: O2",			/obj/item/storage/hypospraykit/o2,									1200),
			new /datum/data/mining_equipment("Hypospray Kit: Tactical",		/obj/item/storage/hypospraykit/tactical,							3000),
			)
