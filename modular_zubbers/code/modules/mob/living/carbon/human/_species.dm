/// Called once the target is made into a bloodsucker. Used for removing conflicting species organs mostly
/datum/species/proc/on_bloodsucker_gain(mob/living/carbon/human/target)
	return null

/datum/species/proc/on_bloodsucker_loss(mob/living/carbon/human/target)
	return null

/// Replaces a couple organs to normal variants to not cause issues. Not super happy with this, alternative is disallowing vampiric races from being bloodsuckers
/datum/species/proc/humanize_organs(mob/living/carbon/human/target)
	var/list/organs_to_handle = list(
		ORGAN_SLOT_HEART = /obj/item/organ/internal/heart,
		ORGAN_SLOT_LIVER = /obj/item/organ/internal/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/internal/stomach,
		ORGAN_SLOT_TONGUE = /obj/item/organ/internal/tongue,
	)
	mutantheart = organs_to_handle[ORGAN_SLOT_HEART]
	mutantliver = organs_to_handle[ORGAN_SLOT_LIVER]
	mutantstomach = organs_to_handle[ORGAN_SLOT_STOMACH]
	mutanttongue = organs_to_handle[ORGAN_SLOT_TONGUE]
	for(var/organ_slot in organs_to_handle)
		var/obj/item/organ/old_organ = target.get_organ_slot(organ_slot)
		var/organ_path = organs_to_handle[organ_slot]
		if(old_organ?.type == organ_path)
			continue
		var/obj/item/organ/new_organ = SSwardrobe.provide_type(organ_path)
		new_organ.Insert(target, FALSE, FALSE)

/datum/species/proc/normalize_organs(mob/living/carbon/human/target)
	mutantheart = initial(mutantheart)
	mutantliver = initial(mutantliver)
	mutantstomach = initial(mutantstomach)
	mutanttongue = initial(mutanttongue)
	regenerate_organs(target)
