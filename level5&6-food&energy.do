keep Total_Consumption_Value Item_Code HHID

rename Total_Consumption_Value TCVfive_six


// For cleaning the data- cereals
drop if inlist(Item_Code, "103", "104", "105", "106", "109", "111", "112", "114", "117")
drop if inlist(Item_Code, "118", "119", "120", "122", "123", "124", "125", "126", "127")
drop if inlist(Item_Code, "128", "130", "131", "132", "133", "134", "135", "136", "137")
drop if inlist(Item_Code, "138", "139", "141", "142", "146", "147", "148", "149", "150")
drop if inlist(Item_Code, "151", "152", "153", "154", "155", "156", "157", "158", "161")
drop if inlist(Item_Code, "163", "165", "166", "167", "168", "172", "174", "175", "176")
drop if inlist(Item_Code, "177", "178", "179", "181", "182", "183", "185", "186", "187")
drop if inlist(Item_Code, "188", "190", "191", "192", "193", "194", "195", "196", "197")
drop if inlist(Item_Code, "198", "218", "219", "220", "221", "222", "223", "224", "225")
drop if inlist(Item_Code, "226", "227", "228", "229", "230", "231", "232", "233", "234")
drop if inlist(Item_Code, "235", "236", "237", "238", "240", "241", "242", "243", "244")
drop if inlist(Item_Code, "245", "246", "247", "248", "250", "251", "252", "253", "254")
drop if inlist(Item_Code, "255", "256", "257", "258", "259", "260", "261", "262", "263")
drop if inlist(Item_Code, "264", "265", "266", "267", "268", "270", "271", "272", "273")
drop if inlist(Item_Code, "275", "276", "277", "278", "279", "280", "281", "282", "283")
drop if inlist(Item_Code, "284", "285", "286", "287", "288", "290", "291", "292", "293")
drop if inlist(Item_Code, "294", "295", "296", "297", "298", "300", "301", "302", "303")
drop if inlist(Item_Code, "304", "305", "306", "307", "308", "313", "314", "315", "316")
drop if inlist(Item_Code, "317", "318", "319", "320", "325", "326", "327", "328", "329")

drop if inlist(Item_Code, "330", "335", "336", "338", "339", "340")
drop if inlist(Item_Code, "341", "342", "344", "345", "346", "347", "348", "349")

drop if Item_Code == "336" | Item_Code == "349" | Item_Code == "335"


//renaming
replace Item_Code = "ricePDS" if Item_Code == "101"
replace Item_Code = "riceNormal" if Item_Code == "102"
replace Item_Code = "attaPDS" if Item_Code == "107"
replace Item_Code = "attaNormal" if Item_Code == "108"
replace Item_Code = "maida" if Item_Code == "110"
replace Item_Code = "bakery" if Item_Code == "113"
replace Item_Code = "jowar" if Item_Code == "115"
replace Item_Code = "bajra" if Item_Code == "116"
replace Item_Code = "ragi" if Item_Code == "121"
replace Item_Code = "cereal_tot" if Item_Code == "129"
replace Item_Code = "arhar_tur" if Item_Code == "140"
replace Item_Code = "moong" if Item_Code == "143"
replace Item_Code = "masur" if Item_Code == "144"
replace Item_Code = "urd" if Item_Code == "145"
replace Item_Code = "pulses_tot" if Item_Code == "159"
replace Item_Code = "milk" if Item_Code == "160"
replace Item_Code = "condensed_milk" if Item_Code == "162"
replace Item_Code = "ghee" if Item_Code == "164"
replace Item_Code = "milk_tot" if Item_Code == "169"
replace Item_Code = "salt" if Item_Code == "170"
replace Item_Code = "sugarPDS" if Item_Code == "171"
replace Item_Code = "gur" if Item_Code == "173"
replace Item_Code = "vanaspati_oil" if Item_Code == "180"
replace Item_Code = "refined_oil" if Item_Code == "184"
replace Item_Code = "oil_tot" if Item_Code == "189"
replace Item_Code = "egg_meat_tot" if Item_Code == "199"
replace Item_Code = "potato" if Item_Code == "200"
replace Item_Code = "onion" if Item_Code == "201"
replace Item_Code = "tomato" if Item_Code == "202"
replace Item_Code = "brinjal" if Item_Code == "203"
replace Item_Code = "radish" if Item_Code == "204"
replace Item_Code = "carrot" if Item_Code == "205"
replace Item_Code = "leafyveggie" if Item_Code == "206"
replace Item_Code = "green chillies" if Item_Code == "207"
replace Item_Code = "ladyfinger" if Item_Code == "208"
replace Item_Code = "parwal" if Item_Code == "210"
replace Item_Code = "cauliflower" if Item_Code == "211"
replace Item_Code = "cabbage" if Item_Code == "212"
replace Item_Code = "gourds_pumpkin" if Item_Code == "213"
replace Item_Code = "peas" if Item_Code == "214"
replace Item_Code = "beans" if Item_Code == "215"
replace Item_Code = "lemon" if Item_Code == "216"
replace Item_Code = "otherveggie" if Item_Code == "217"
replace Item_Code = "fruits_tot" if Item_Code == "239"
replace Item_Code = "dryfruits_tot" if Item_Code == "249"
replace Item_Code = "spices_tot" if Item_Code == "269"
replace Item_Code = "mineral_water" if Item_Code == "274"
replace Item_Code = "s_processed_food_tot" if Item_Code == "289"
replace Item_Code = "p_processed_food_tot" if Item_Code == "299"
replace Item_Code = "pan_tot" if Item_Code == "309"
replace Item_Code = "bidi" if Item_Code == "310"
replace Item_Code = "cigarettes" if Item_Code == "311"
replace Item_Code = "leaf_tobacco" if Item_Code == "312"
replace Item_Code = "toddy" if Item_Code == "321"
replace Item_Code = "country_liquor" if Item_Code == "322"
replace Item_Code = "beer" if Item_Code == "323"
replace Item_Code = "refined_liquor" if Item_Code == "324"
replace Item_Code = "firewood" if Item_Code == "331"
replace Item_Code = "electricity" if Item_Code == "332"
replace Item_Code = "dung_cake" if Item_Code == "333"
replace Item_Code = "kerosene_PDS" if Item_Code == "334"
replace Item_Code = "coal" if Item_Code == "337"
replace Item_Code = "petrol" if Item_Code == "343"

//reshaping
encode Item_Code, gen(Item_Code_numeric)

label list Item_Code_numeric

drop Item_Code

reshape wide TCVfive_six, i(HHID) j(Item_Code_numeric)

local items "arhar_tur attaNormal attaPDS bajra bakery beans beer bidi brinjal cabbage carrot cauliflower cereal_tot cigarettes coal condensed_milk country_liquor dryfruits_tot dung_cake egg_meat_tot electricity firewood fruits_tot ghee gourds_pumpkin green_chillies gur jowar kerosene_PDS ladyfinger leaf_tobacco leafyveggie lemon maida masur milk milk_tot mineral_water moong oil_tot onion otherveggie p_processed_food_tot pan_tot parwal peas petrol potato pulses_tot radish ragi refined_liquor refined_oil riceNormal ricePDS s_processed_food_tot salt spices_tot sugarPDS toddy tomato urd vanaspati_oil"

local i = 1
foreach item in `items' {
    rename TCVfive_six`i' cons_`item'
    local i = `i' + 1
}

describe

merge 1:m HHID using "/Users/siddharthshrimal/Downloads/HCES/HCES_2011_type 1/data/Final ones/summary block 12- keeping only total consumption.dta" 

merge 1:m HHID using "/Users/siddharthshrimal/Downloads/HCES/HCES_2011_type 1/data/Final DTA files/LEVEL3F.dta"

merge 1:m HHID using"/Users/siddharthshrimal/Downloads/HCES/HCES_2011_type 1/data/Final DTA files/LEVEL4.dta"

merge 1:m HHID using "/Users/siddharthshrimal/Downloads/HCES/HCES_2011_type 1/data/Final DTA files/LEVEL7&8.dta"

merge 1:m HHID using "/Users/siddharthshrimal/Downloads/HCES/HCES_2011_type 1/data/Final DTA files/LEVEL9.dta"

merge 1:m HHID using "/Users/siddharthshrimal/Downloads/HCES/HCES_2011_type 1/data/Final DTA files/LEVEL10.dta"
//new merging


merge 1:m HHID using "/Users/siddharthshrimal/Downloads/HCES/HCES_2011_type 1/FINALDTA-19NOV/Do_they_have_aTV.dta"

drop _merge

merge 1:m HHID using "/Users/siddharthshrimal/Downloads/HCES/HCES_2011_type 1/FINALDTA-19NOV/LEVEL3F.dta"

drop _merge

merge 1:m HHID using "/Users/siddharthshrimal/Downloads/HCES/HCES_2011_type 1/FINALDTA-19NOV/LEVEL4.dta"

drop _merge

merge 1:m HHID using "/Users/siddharthshrimal/Downloads/HCES/HCES_2011_type 1/FINALDTA-19NOV/Level7and8.dta"

drop _merge


merge 1:m HHID using "/Users/siddharthshrimal/Downloads/HCES/HCES_2011_type 1/FINALDTA-19NOV/Level9.dta"

**# Bookmark #1
drop _merge


merge 1:m HHID using "/Users/siddharthshrimal/Downloads/HCES/HCES_2011_type 1/FINALDTA-19NOV/LEVEL10.dta"

drop _merge

local vars "cons_arhar_tur cons_attaNormal cons_attaPDS cons_bajra cons_bakery cons_beans cons_beer cons_bidi cons_brinjal cons_cabbage cons_carrot cons_cauliflower cons_cereal_tot cons_cigarettes cons_coal cons_condensed_milk cons_country_liquor cons_dryfruits_tot cons_dung_cake cons_egg_meat_tot cons_electricity cons_firewood cons_fruits_tot cons_ghee cons_gourds_pumpkin cons_green_chillies cons_gur cons_jowar cons_kerosene_PDS cons_ladyfinger cons_leaf_tobacco cons_leafyveggie cons_lemon cons_maida cons_masur cons_milk cons_milk_tot cons_mineral_water cons_moong cons_oil_tot cons_onion cons_otherveggie cons_p_processed_food_tot cons_pan_tot cons_parwal cons_peas cons_petrol cons_potato cons_pulses_tot cons_radish cons_ragi cons_refined_liquor cons_refined_oil cons_riceNormal cons_ricePDS cons_s_processed_food_tot cons_salt cons_spices_tot cons_sugarPDS cons_toddy cons_tomato cons_urd cons_vanaspati_oil Cons_exp cons_bedding_tot cons_clothes_tot cons_footwear_tot cons_leather_sandals cons_leather_shoes cons_mosquito_net cons_quilt_matress cons_rubber_footwear cons_secondhand_clothes cons_secondhand_footware cons_uniform_boys cons_uniform_girls cons_doctor_fee cons_educ_exp_tot cons_med_insti_tot cons_medicine cons_tuition_fee cons_cable_TV cons_cinema cons_entertainment_tot cons_hobby_goods cons_houserent_actual cons_houserent_imputed_U cons_internet_expense cons_misc_HH_consumables_tot cons_non_insti_med_tot cons_pads cons_servant cons_spectacle cons_toiletries cons_torch cons_water_bill"

foreach var of local vars {
    replace `var' = 0 if missing(`var')
}

