/datum/techweb_node/datatheory/New()
	design_ids += "sex_research"
	. = ..()

/datum/techweb_node/bluespace_bag_machine
	id = "bluespace_bag_machine"
	display_name = "Self-Service Storage Solutions"
	description = "Direct annoying crewmates to fabricate their own bags!"
	prereq_ids = list("bluespace_holding")
	design_ids = list("bag_machine")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1000)
