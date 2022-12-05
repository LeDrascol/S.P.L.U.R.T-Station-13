//SPLURT drinks

/datum/reagent/consumable/ethanol/panty_dropper
	name = "Liquid Panty Dropper"
	description = "You feel it's not named like that for nothing."
	color = "#ce3b01" // rgb: 206, 59, 1
	boozepwr = 70
	quality = DRINK_VERYGOOD
	taste_description = "cloth ripping and tearing"
	glass_name = "Liquid Panty Dropper"
	glass_desc = "You feel it's not named like that for no reason."
	value = 6

/datum/reagent/consumable/ethanol/panty_dropper/on_mob_life(mob/living/carbon/C)
	var/mob/living/carbon/human/M = C
	var/anyclothes = FALSE
	var/items = M.get_contents()
	for(var/obj/item/W in items)
		if(W.body_parts_covered && ismob(W.loc))
			anyclothes = TRUE
			M.dropItemToGround(W, TRUE)
			playsound(M.loc, 'sound/items/poster_ripped.ogg', 50, 1)
	if(anyclothes)
		M.visible_message("<span class='userlove'>[M] suddenly bursts out of [M.p_their()] clothes!</span>")
	return ..()

/datum/reagent/consumable/ethanol/lean
	name = "Lean"
	description = "The choice drink of space-pop stars, composed of soda, cough syrup and candies."
	color =  "#9109ba"
	boozepwr = 0
	metabolization_rate = 1 * REAGENTS_METABOLISM
	quality = DRINK_VERYGOOD
	taste_description = "cough syrup and space-pop music"
	glass_name = "Lean"
	glass_desc = "I LOVE LEAN!!"
	glass_icon_state = "lean" // the icon is not in the modular folder because it's literally impossible to get an icon from the modular folder unless it's an actual obj and not a drink. Go **** yourself.

/datum/reagent/consumable/ethanol/lean/on_mob_life(mob/living/carbon/C)
	var/mob/living/carbon/human/M = C
	var/message = "I LOVE LEAN!!"
	M.Dizzy(40)
	M.Jitter(40)
	M.set_drugginess(50)
	switch(current_cycle)
		if(1)
			M.say(message)
		if(80 to 100)
			M.adjustOrganLoss(ORGAN_SLOT_LIVER, 1)
			M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 1) // it's cough syrup what'd you expect?
		if(100 to INFINITY)
			M.adjustOrganLoss(ORGAN_SLOT_LIVER, 2)
			M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 2)
			if(!M.undergoing_cardiac_arrest() && M.can_heartattack() && prob(1))
				M.set_heartattack(TRUE)
				if(M.stat == CONSCIOUS)
					M.visible_message("<span class='userdanger'>[M] clutches at [M.p_their()] chest as if [M.p_their()] heart stopped!</span>") // too much lean :(
	..()

/datum/reagent/consumable/ethanol/cum_in_a_hot_tub
	name = "Cum in the Hot Tub"
	description = "Doesn't really leave it to the imagination, eh?"
	boozepwr = 80
	color = "#D2D7D9"
	quality = DRINK_VERYGOOD
	taste_description = "smooth cream"
	glass_icon_state = "cum_glass"
	shot_glass_icon_state = "cum_shot"	//I'm funny, I know
	glass_name = "Cum in the Hot Tub"
	glass_desc = "Doesn't really leave it to the imagination, eh?"

/datum/reagent/consumable/ethanol/cum_in_a_hot_tub/semen
	boozepwr = 65
	taste_description = "viscous cream"
	description = "The name is probably exactly what it is."
	glass_desc = "The name is probably exactly what it is."

/datum/reagent/consumable/ethanol/mech_rider
	name = "Mech Rider"
	description = "Who would even drink this? "
	boozepwr = 65
	color = rgb(111, 127, 63)
	quality = DRINK_GOOD
	taste_description = "the sweat of a certain Mauler pilot"
	glass_icon = 'modular_splurt/icons/obj/drinks.dmi'
	glass_icon_state = "mech_rider_bottle"
	glass_name = "Mech Rider"
	glass_desc = "Who would even drink this?"

/datum/reagent/consumable/ethanol/isloation_cell
	name = "Isolation Cell"
	description = "Ice cubes in a padded Cell."
	color = "#b4b4b4"
	quality = DRINK_FANTASTIC
	taste_description = "cloth dissolved in sulphuric acid."
	glass_icon = 'modular_splurt/icons/obj/drinks.dmi'
	glass_icon_state = "isolationcell"
	glass_name = "Isolation Cell"
	glass_desc = "Ice cubes in a padded Cell"

/datum/reagent/consumable/ethanol/isloation_cell/on_mob_life(mob/living/carbon/C)
	. = ..()
	if(!(current_cycle % 10)) //Every 10 cycles
		C.reagents.add_reagent(/datum/reagent/drug/aphrodisiac, 2)

/datum/reagent/consumable/ethanol/isloation_cell/morphine
	description = "It has a distinct, sour smell, much like morphine."
	taste_description = "cloth dissolved in sulphuric acid. Something feels off about it."
	glass_desc = "It has a distinct, sour smell, much like morphine."

/datum/reagent/consumable/ethanol/isloation_cell/morphine/on_mob_life(mob/living/carbon/C)
	. = ..()
	if(!(current_cycle % 10)) //Every 10 cycles
		C.reagents.add_reagent_list(list(/datum/reagent/medicine/morphine = 2, /datum/reagent/consumable/ethanol/hippies_delight = 1))

/datum/reagent/consumable/ethanol/chemical_ex
	name = "Chemical Ex"
	description = "Date rape in a glass, a mixture courtesy of the Chief Witchdoctor. The stench of cigar smoke permeates the air wherever it goes."
	color = rgb(14, 14, 14)
	quality = DRINK_FANTASTIC
	taste_description = "ghost peppers, carbonated water and oil. Burns your tongue."
	glass_icon = 'modular_splurt/icons/obj/drinks.dmi'
	glass_icon_state = "chemicalex"
	glass_name = "Chemical Ex"
	glass_desc = "Date rape in a glass, a mixture courtesy of the Chief Witchdoctor. The stench of cigar smoke permeates the air wherever it goes."

/datum/reagent/consumable/ethanol/chemical_ex/on_mob_life(mob/living/carbon/C)
	. = ..()
	if(!(current_cycle % 10)) //Every 10 cycles
		C.reagents.add_reagent_list(list(/datum/reagent/drug/aphrodisiacplus = 2, /datum/reagent/medicine/morphine = 4, /datum/reagent/fermi/enthrall = 1))

/datum/reagent/consumable/ethanol/heart_of_gold
	name = "Heart Of Gold"
	description = "The Captain's Ambrosia. Something about it just feels divine."
	boozepwr = 15
	color = "#fc56e6"
	quality = DRINK_FANTASTIC
	taste_description = "a fruit punch-like blend with a little fruity kick at the back of your throat, with an aftertaste of pineapple."
	glass_icon = 'modular_splurt/icons/obj/drinks.dmi'
	glass_icon_state = "heartofgold"
	glass_name = "Heart Of Gold"
	glass_desc = "The Captain's Ambrosia. Something about it just feels divine."

/datum/reagent/consumable/ethanol/moth_in_chief
	name = "Moth in Chief"
	description = "A simple yet elegant drink, inspires confidence in even the most pessimistic of men. The mantle rests well upon your shoulders."
	boozepwr = 50
	color = "#0919be"
	quality = DRINK_FANTASTIC
	taste_description = "fuzz, warmth and comfort"
	glass_icon = 'modular_splurt/icons/obj/drinks.dmi'
	glass_icon_state = "mothinchief"
	glass_name = "Moth in Chief"
	glass_desc = "A simple yet elegant drink, inspires confidence in even the most pessimistic of men. The mantle rests well upon your shoulders."


// ~( Ported from TG )~
/datum/reagent/consumable/ethanol/curacao
	name = "Curaçao"
	description = "Made with laraha oranges, for an aromatic finish."
	boozepwr = 30
	color = "#1a5fa1"
	quality = DRINK_NICE
	taste_description = "blue orange"
	glass_icon = 'modular_splurt/icons/obj/drinks.dmi'
	glass_icon_state = "curacao"
	glass_name = "glass of curaçao"
	glass_desc = "It's blue, da ba dee."

/datum/reagent/consumable/ethanol/navy_rum
	name = "Navy Rum"
	description = "Rum as the finest sailors drink."
	boozepwr = 90
	color = "#d8e8f0"
	quality = DRINK_NICE
	taste_description = "a life on the waves"
	glass_icon_state = "ginvodkaglass"
	glass_name = "glass of navy rum"
	glass_desc = "Splice the mainbrace, and God save the King."

/datum/reagent/consumable/ethanol/bitters
	name = "Andromeda Bitters"
	description = "A bartender's best friend, often used to lend a delicate spiciness to any drink. Produced in New Trinidad, now and forever."
	boozepwr = 70
	color = "#1c0000"
	quality = DRINK_NICE
	taste_description = "spiced alcohol"
	glass_icon = 'modular_splurt/icons/obj/drinks.dmi'
	glass_icon_state = "bitters"
	glass_name = "glass of bitters"
	glass_desc = "Typically you'd want to mix this with something- but you do you."

/datum/reagent/consumable/ethanol/admiralty
	name = "Admiralty"
	description = "A refined, bitter drink made with navy rum, vermouth and fernet."
	boozepwr = 100
	color = "#1F0001"
	quality = DRINK_VERYGOOD
	taste_description = "haughty arrogance"
	glass_icon = 'modular_splurt/icons/obj/drinks.dmi'
	glass_icon_state = "admiralty"
	glass_name = "Admiralty"
	glass_desc = "Hail to the Admiral, for he brings fair tidings, and rum too."

/datum/reagent/consumable/ethanol/dark_and_stormy
	name = "Dark and Stormy"
	description = "A classic drink arriving to thunderous applause."
	boozepwr = 50
	color = "#8c5046"
	quality = DRINK_GOOD
	taste_description = "ginger and rum"
	glass_icon = 'modular_splurt/icons/obj/drinks.dmi'
	glass_icon_state = "dark_and_stormy"
	glass_name = "Dark and Stormy"
	glass_desc = "Thunder and lightning, very very frightening."

/datum/reagent/consumable/ethanol/long_john_silver
	name = "Long John Silver"
	description = "A long drink of navy rum, bitters, and lemonade. Particularly popular aboard the Mothic Fleet as it's light on ration credits and heavy on flavour."
	boozepwr = 50
	color = "#c4b35c"
	quality = DRINK_VERYGOOD
	taste_description = "rum and spices"
	glass_icon = 'modular_splurt/icons/obj/drinks.dmi'
	glass_icon_state = "long_john_silver"
	glass_name = "Long John Silver"
	glass_desc = "Named for a famous pirate, who may or may not have been fictional. But hey, why let the truth get in the way of a good yarn?"

/datum/reagent/consumable/ethanol/long_haul
	name = "Long Haul"
	description = "A favourite amongst freighter pilots, unscrupulous smugglers, and nerf herders."
	boozepwr = 35
	color = "#003153"
	quality = DRINK_VERYGOOD
	taste_description = "companionship"
	glass_icon = 'modular_splurt/icons/obj/drinks.dmi'
	glass_icon_state = "long_haul"
	glass_name = "Long Haul"
	glass_desc = "A perfect companion for a lonely long haul flight."

/datum/reagent/consumable/ethanol/salt_and_swell
	name = "Salt and Swell"
	description = "A bracing sour with an interesting salty taste."
	boozepwr = 60
	color = "#b4abd0"
	quality = DRINK_FANTASTIC
	taste_description = "salt and spice"
	glass_icon = 'modular_splurt/icons/obj/drinks.dmi'
	glass_icon_state = "salt_and_swell"
	glass_name = "Salt and Swell"
	glass_desc = "Ah, I do like to be beside the seaside."

/datum/reagent/consumable/ethanol/tich_toch
	name = "Tich Toch"
	description = "A mix of Tiltällen, Töchtaüse Syrup, and vodka. It's not exactly to everyones' tastes."
	boozepwr = 75
	color = "#b4abd0"
	quality = DRINK_VERYGOOD
	taste_description = "spicy sour cheesy yoghurt"
	glass_icon = 'modular_splurt/icons/obj/drinks.dmi'
	glass_icon_state = "tich_toch"
	glass_name = "Tich Toch"
	glass_desc = "Oh god."

/datum/reagent/consumable/ethanol/tiltaellen
	name = "Tiltällen"
	description = "A lightly fermented yoghurt drink with salt and a light dash of vinegar. Has a distinct sour cheesy flavour."
	boozepwr = 10
	color = "#F4EFE2"
	quality = DRINK_NICE
	taste_description = "sour cheesy yoghurt"
	glass_icon = 'modular_splurt/icons/obj/drinks.dmi'
	glass_icon_state = "tiltaellen"
	glass_name = "glass of tiltällen"
	glass_desc = "Eww... it's curdled."

/datum/reagent/consumable/ethanol/tropical_storm
	name = "Tropical Storm"
	description = "A taste of the Caribbean in one glass."
	boozepwr = 40
	color = "#00bfa3"
	quality = DRINK_VERYGOOD
	taste_description = "the tropics"
	glass_icon = 'modular_splurt/icons/obj/drinks.dmi'
	glass_icon_state = "tropical_storm"
	glass_name = "Tropical Storm"
	glass_desc = "Less destructive than the real thing."

/datum/reagent/consumable/ethanol/bone_hurting_juice
	name = "Bone Hurting Juice"
	description = "You may have misinterpreted the recipe."
	color = "#e3dac9" // rgb: 227, 218, 201 (Bone)
	boozepwr = 70 // High power to prevent abuse
	quality = DRINK_VERYGOOD
	taste_description = "comedic misinterpretations and skeletal damage"
	glass_name = "Bone Hurting Juice"
	glass_desc = "Oww oof my bones!"

// Reaction for bone hurting juice
/datum/reagent/consumable/ethanol/bone_hurting_juice/on_mob_life(mob/living/carbon/bone_target)
	// Escape clause check for Glass Bones trait
	if(!HAS_TRAIT(bone_target, TRAIT_GLASS_BONES))
		// Apply bicaridine, since it's an ingredient
		// Intentionally not applied for Glass Bones users
		. = ..()
		if(!(current_cycle % 10)) // Every 10 cycles
			bone_target.reagents.add_reagent(/datum/reagent/medicine/bicaridine, 2)
		
		// Escape
		return

	// Randomly select a body part to damage (this could be deduplicated!)
	// This point onward should only apply if you have glass bones!
	var/picked_bodypart = pick(BODY_ZONE_HEAD, BODY_ZONE_CHEST, BODY_ZONE_R_ARM, BODY_ZONE_L_ARM, BODY_ZONE_R_LEG, BODY_ZONE_L_LEG)
	var/obj/item/bodypart/bodypart_target = bone_target.get_bodypart(picked_bodypart)

	// Check if organic limb, because robotic limbs don't have bones
	if(bodypart_target && bodypart_target.is_organic_limb() && !bodypart_target.is_pseudopart)

		// Apply damage periodically to prevent guaranteed death
		. = ..()
		if((current_cycle % 10)) // Every 10 cycles
			return // This is better as an escape clause
		
		bodypart_target.receive_damage((boozepwr*0.1)*REAGENTS_EFFECT_MULTIPLIER)
		
		// Chance to apply a 'severe' wound
		if(prob(60))
			var/datum/wound/blunt/severe/bone_wound = new
			bone_wound.apply_wound(bodypart_target)
			return // Don't apply both!
		
		// Chance to apply a 'critical' wound that disables the limb
		if(prob(20))
			var/datum/wound/blunt/critical/bone_wound = new
			bone_wound.apply_wound(bodypart_target)
		

