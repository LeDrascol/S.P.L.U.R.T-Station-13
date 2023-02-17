/obj/item/toy/prize/savannahivanov
	name = "toy Savannah-Ivanov"
	icon = 'modular_splurt/icons/obj/toy.dmi'
	icon_state = "savannahivanovtoy"
	desc = "Mini-Mecha action figure! Collect them all! 13/12."

/obj/item/toy/figure/assistant/imaginary_friend
	name = "imaginary friend action figure"
	desc = "A toy that resembles a special friend."
	toysay = "I'll always be your best friend!"
	var/item_cooldown_length = 10 SECONDS
	COOLDOWN_DECLARE(item_cooldown)

/obj/item/toy/figure/assistant/imaginary_friend/attack_self(mob/user as mob)
	// Check if human user exists
	if(!ishuman(user))
		// Warn user, then return
		to_chat(user, span_warning("You refrain from handling [src]."))
		return

	// Check cooldown time
	if(!COOLDOWN_FINISHED(src, item_cooldown))
		// Warn user, then return
		to_chat(user, span_warning("You refrain from handling [src] again so soon."))
		return

	// Define eligible ghost users
	var/list/ghost_candidates = get_all_ghost_role_eligible(TRUE)

	// Check if any ghost candidates exist
	if(!LAZYLEN(ghost_candidates))
		// Warn user
		to_chat(user, span_warning("Playing with [src] does not spark joy. Try again later."))

		// Set cooldown time
		COOLDOWN_START(src, item_cooldown, item_cooldown_length)

		// Return without effects
		return

	// Define human user
	var/mob/living/carbon/human/mirror_user = user

	// Add brain trauma
	mirror_user.gain_trauma(/datum/brain_trauma/special/imaginary_friend, TRAUMA_RESILIENCE_SURGERY)

	// Alert in local chat
	mirror_user.visible_message(span_warning("[mirror_user] plays with [src]."), span_warning("You start to remember [src], as if they were a real person!"))

	// Log usage event
	log_game("[key_name(user)] used [src] to gain the imaginary friend brain trauma.")

	// Move original item to nullspace
	src.moveToNullspace()

	// Create new mirror at user's location
	var/obj/item/toy/figure/assistant/generic/new_figure = new(user.loc)

	// Force user to hold the new item
	user.put_in_hands(new_figure)

	// Delete original item
	qdel(src)

/obj/item/toy/figure/assistant/generic
	name = "Generic action figure"
	desc = "It\'s just a normal toy."
	toysay = "I\'m a toy!"

/obj/item/toy/beach_ball
	var/obj/item/vibrator
	var/enabled = FALSE

/obj/item/toy/beach_ball/syndicate
	icon_state = "ballsyndicate"
	icon = 'modular_splurt/icons/misc/beach.dmi'
	desc = "Hmm. This ball is a bit heavier and tougher than the others."

/obj/item/toy/beach_ball/attackby(obj/item/I, mob/living/user)
	if(istype(I, /obj/item/electropack/vibrator))
		if(vibrator)
			to_chat(user, span_warning("There is already a vibrator inside this!"))
		else
			if(!user.transferItemToLoc(I,src))
				return
			to_chat(user, span_notice("You put [I] inside [src]."))
			vibrator = I

/obj/item/toy/beach_ball/attack_self(mob/user)
	var/list/options_list = list()
	if(vibrator)
		options_list += list("Eject" = image(icon = 'icons/radials/taperecorder.dmi', icon_state = "eject", dir = EAST))
		options_list += list("Play" = image(icon = 'icons/radials/taperecorder.dmi', icon_state = "play", dir = WEST))
	if(options_list)
		var/selection = show_radial_menu(user, src, options_list, radius = 38, require_near = TRUE, tooltips = TRUE)
		if(!selection)
			return
		switch(selection)
			if("Play")
				playsound(user, 'sound/effects/clock_tick.ogg', 50, 1, -1)
				enabled = !enabled
				if(enabled)
					START_PROCESSING(SSobj, src)
				else
					STOP_PROCESSING(SSobj, src)
				to_chat(user, "<span class='notice'>You toggle the [vibrator].</span>")
			if("Eject")
				playsound(user, 'sound/weapons/empty.ogg', 100, 1)
				to_chat(user, "<span class='notice'>You remove [vibrator] from [src].</span>")
				user.put_in_hands(vibrator)
				enabled = FALSE
				vibrator = null
				update_icon()

/obj/item/toy/beach_ball/process()
	if(vibrator && enabled)
		throw_at(get_edge_target_turf(src,pick(GLOB.alldirs)),3,1)
		playsound(src, 'modular_splurt/sound/lewd/vibrate.ogg', 40, 1, -1)

/obj/item/toy/beach_ball/syndicate/process()
	. = ..()
	if(vibrator && enabled)
		throwforce = 60

/obj/item/toy/beach_ball/syndicate/throw_at(atom/target, range, speed, mob/thrower, spin=1, diagonals_first = 0, datum/callback/callback)
	if(ishuman(thrower))
		throwforce = 0
	. = ..()

/obj/item/toy/beach_ball/syndicate/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	if(istype(hit_atom, /turf/closed/wall) && throwforce > 0)
		var/turf/closed/wall/W = hit_atom
		W.dismantle_wall()

