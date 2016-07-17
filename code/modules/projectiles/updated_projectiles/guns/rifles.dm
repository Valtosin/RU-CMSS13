//-------------------------------------------------------

/obj/item/weapon/gun/rifle
	reload_sound = 'sound/weapons/rifle_reload.ogg'
	cocked_sound = 'sound/weapons/rifle_cocked.ogg'
	origin_tech = "combat=4;materials=3"
	slot_flags = SLOT_BACK
	w_class = 4
	force = 15
	burst_amount = 2
	burst_delay = 2
	flags = FPRINT | TABLEPASS | CONDUCT | TWOHANDED
	gun_features = GUN_AUTO_EJECTOR | GUN_CAN_POINTBLANK

	New()
		..()
		load_into_chamber()

//-------------------------------------------------------
//M41A PULSE RIFLE

/obj/item/ammo_magazine/rifle
	name = "Pulse Rifle Magazine (10mm)"
	desc = "A 10mm assault rifle magazine."
	caliber = "10mm"
	icon_state = "m309a"
	icon_empty = "m309a0"
	default_ammo = "rifle bullet"
	max_rounds = 30
	gun_type = /obj/item/weapon/gun/rifle/m41a
	handful_type = "Bullets (10mm)"

/obj/item/ammo_magazine/rifle/extended
	name = "Pulse Rifle Extended Magazine (10mm)"
	desc = "A 10mm assault extended rifle magazine."
	max_rounds = 70
	bonus_overlay = "m41a_exmag"

/obj/item/ammo_magazine/rifle/incendiary
	name = "Pulse Rifle Incendiary Magazine (10mm)"
	desc = "A 10mm assault rifle magazine."
	default_ammo = "incendiary rifle bullet"
	handful_type = "Incendiary Bullets (10mm)"

/obj/item/ammo_magazine/rifle/ap
	name = "Pulse Rifle AP Magazine (10mm)"
	desc = "A 10mm armor piercing magazine."
	default_ammo = "AP rifle bullet"
	handful_type = "AP Bullets (10mm)"

/obj/item/weapon/gun/rifle/m41a
	name = "\improper M41A Pulse Rifle MK2"
	desc = "The standard issue rifle of the Colonial Marines. Commonly carried by most combat personnel. Uses 10mm special ammunition."
	icon_state = "m41a"
	icon_empty = "m41a0"
	icon_wielded = "m41a-w"
	item_state = "m41a"
	fire_sound = 'sound/weapons/Gunshot_smg.ogg'
	mag_type = /obj/item/ammo_magazine/rifle
	fire_delay = 4
	burst_amount = 3
	flags = FPRINT | TABLEPASS | CONDUCT | TWOHANDED
	gun_features = GUN_AUTO_EJECTOR | GUN_CAN_POINTBLANK | GUN_AMMO_COUNTER

	New()
		..()
		attachable_offset = list("muzzle_x" = 32, "muzzle_y" = 18,"rail_x" = 12, "rail_y" = 23, "under_x" = 24, "under_y" = 13)
		var/obj/item/attachable/grenade/G = new(src)
		G.Attach(src)
		update_attachables()
		if(ticker && istype(ticker.mode,/datum/game_mode/ice_colony)) //Snow camo
			if(icon_state == "m41a") //Only change this one
				icon_state = "s_m41a"
				icon_empty = "s_m41a0"
				icon_wielded = "s_m41a-w"
				item_state = "s_m41a"

//-------------------------------------------------------
//M41A TRUE AND ORIGINAL

/obj/item/ammo_magazine/rifle/m41aMK1
	name = "M41 Standard Magazine (10mm)"
	desc = "A semi-rectangular box of rounds for the original M41A Pulse Rifle."
	max_rounds = 95
	gun_type = /obj/item/weapon/gun/rifle/m41aMK1

/obj/item/weapon/gun/rifle/m41aMK1
	name = "\improper M41A Pulse Rifle"
	desc = "An older design of the Pulse Rifle commonly used by Colonial Marines. Uses 10mm special ammunition."
	icon_state = "s_m41a" //Placeholder.
	icon_empty = "s_m41a0"
	icon_wielded = "s_m41a-w"
	item_state = "s_m41a"
	fire_sound = 'sound/weapons/m41a_2.ogg'
	mag_type = /obj/item/ammo_magazine/rifle/m41aMK1
	burst_amount = 4
	accuracy = 5
	dam_bonus = 5
	flags = FPRINT | TABLEPASS | CONDUCT | TWOHANDED
	gun_features = GUN_AUTO_EJECTOR | GUN_CAN_POINTBLANK | GUN_AMMO_COUNTER

	New()
		..()
		attachable_offset = list("muzzle_x" = 32, "muzzle_y" = 18,"rail_x" = 12, "rail_y" = 23, "under_x" = 24, "under_y" = 13)

//-------------------------------------------------------
//M41A MARKSMAN VARIANT

/obj/item/ammo_magazine/rifle/marksman
	name = "M41A/M Marksman Magazine (10mm)"
	desc = "A 10mm marksman rifle magazine."
	default_ammo = "marksman rifle bullet"
	gun_type = /obj/item/weapon/gun/rifle/m41a/scoped
	handful_type = "Marksman Bullets (10mm)"

/obj/item/weapon/gun/rifle/m41a/scoped
	name = "\improper M41A/M Marksman Rifle"
	desc = "An advanced prototype pulse rifle based on the tried and true M41A Pulse Rifle MK2. Uses any standard M41 magazine and is equipped with rail scope."
	icon_state = "m41b"
	icon_empty = "m41b0"
	item_state = "m41a"
	origin_tech = "combat=5;materials=4"
	mag_type = /obj/item/ammo_magazine/rifle/marksman
	force = 16
	fire_delay = 5
	recoil = 1
	burst_amount = 1
	accuracy = 10

	New()
		..()
		var/obj/item/attachable/scope/S = new(src)
		S.Attach(src)
		var/obj/item/attachable/stock/rifle/Q = new(src)
		Q.Attach(src)
		under.Detach(src)
		cdel(under)
		under = null
		update_attachables()

//-------------------------------------------------------
//M41A PMC VARIANT

/obj/item/ammo_magazine/rifle/elite
	name = "M41A/2 AP Magazine (10mm)"
	desc = "A 10mm rifle magazine."
	default_ammo = "AP rifle bullet"
	gun_type = /obj/item/weapon/gun/rifle/m41a/elite
	handful_type = "AP Bullets (10mm)"
	max_rounds = 40

/obj/item/weapon/gun/rifle/m41a/elite
	name = "\improper M41A/2 Battle Rifle"
	desc = "A reinforced and remachined version of the tried and tested M41A Pulse Rifle MK2. Given only to elite units."
	icon_state = "pmc_m41a"
	icon_empty = "pmc_m41a0"
	item_state = "pmc_m41a"
	icon_wielded = "pmc_m41a-w"
	origin_tech = "combat=7;materials=5"
	mag_type = /obj/item/ammo_magazine/rifle/elite
	fire_delay = 7
	burst_amount = 3
	accuracy = 35
	dam_bonus = 15
	flags = FPRINT | TABLEPASS | CONDUCT | TWOHANDED
	gun_features = GUN_AUTO_EJECTOR | GUN_CAN_POINTBLANK | GUN_AMMO_COUNTER | GUN_WY_RESTRICTED


//-------------------------------------------------------
//MAR-40 AK CLONE

/obj/item/ammo_magazine/rifle/mar40
	name = "Ammo Magazine (12mm)"
	desc = "A 12mm magazine for the MAR series of firearms."
	caliber = "12mm"
	icon_state = "5.56"
	icon_empty = "5.56"
	default_ammo = "heavy rifle bullet"
	max_rounds = 40
	gun_type = /obj/item/weapon/gun/rifle/mar40
	handful_type = "Bullets (12mm)"

/obj/item/ammo_magazine/rifle/mar40/extended
	name = "Extended Magazine (12mm)"
	desc = "A 12mm MAR magazine."
	max_rounds = 60
	bonus_overlay = "mar40_mag"

/obj/item/weapon/gun/rifle/mar40
	name = "\improper MAR-40 Battle Rifle"
	desc = "A cheap, reliable assault rifle chambered in 12mm. Commonly found in the hands of criminals or mercenaries, or in the hands of the UPP or Iron Bears."
	icon_state = "rsprifle"
	icon_empty = "rsprifle0"
	icon_wielded = "mar40-w"
	item_state = "mar40"
	origin_tech = "combat=4;materials=2;syndicate=4"
	fire_sound = 'sound/weapons/heavyrifle.ogg'
	mag_type = /obj/item/ammo_magazine/rifle/mar40
	eject_casings = 1
	accuracy = -12
	burst_amount = 4
	flags = FPRINT | TABLEPASS | CONDUCT | TWOHANDED
	gun_features = GUN_AUTO_EJECTOR | GUN_CAN_POINTBLANK | GUN_ON_MERCS | GUN_ON_RUSSIANS

	New()
		..()
		attachable_offset = list("muzzle_x" = 32, "muzzle_y" = 17,"rail_x" = 13, "rail_y" = 19, "under_x" = 24, "under_y" = 13)

/obj/item/weapon/gun/rifle/mar40/carbine
	name = "\improper MAR-30 Battle Carbine"
	desc = "A cheap, reliable assault rifle chambered in 12mm. Commonly found in the hands of criminals or mercenaries. This is the carbine variant."
	icon_state = "shortrsprifle"
	icon_empty = "shortrsprifle0"
	icon_wielded = "shortrsprifle-w"
	fire_sound = 'sound/weapons/gunshot_ak47.ogg' //Change
	item_state = "mar40short"
	accuracy = -16
	fire_delay = 5

//-------------------------------------------------------
//M41AE2 HEAVY PULSE RIFLE

/obj/item/ammo_magazine/rifle/lmg
	name = "Heavy Pulse Rifle Ammo Box"
	desc = "A semi-rectangular box of rounds for the M41AE2 Heavy Pulse Rifle."
	icon_state = "a762"
	icon_empty = "a762-0"
	max_rounds = 100
	gun_type = /obj/item/weapon/gun/rifle/lmg

/obj/item/weapon/gun/rifle/lmg
	name = "\improper M41AE2 Heavy Pulse Rifle"
	desc = "A large weapon capable of laying down supressing fire. Currently undergoing field testing among USCM scout platoons and in mercenary companies. Like it's smaller brother, the M41A MK2, the M41AE2 is chambered in 10mm."
	icon_state = "rsplmg"
	icon_empty = "rsplmg0"
	item_state = "rsplmg"
	icon_wielded = "rsplmg-w"
	origin_tech = "combat=5;materials=4"
	fire_sound = 'sound/weapons/gunshot_rifle.ogg' //Change
	mag_type = /obj/item/ammo_magazine/rifle/lmg
	accuracy = -25
	fire_delay = 4
	burst_amount = 4
	flags = FPRINT | TABLEPASS | CONDUCT | TWOHANDED
	gun_features = GUN_AUTO_EJECTOR | GUN_CAN_POINTBLANK | GUN_AMMO_COUNTER | GUN_ON_MERCS

	New()
		..()
		attachable_offset = list("muzzle_x" = 33, "muzzle_y" = 19,"rail_x" = 10, "rail_y" = 24, "under_x" = 24, "under_y" = 12)

//-------------------------------------------------------

