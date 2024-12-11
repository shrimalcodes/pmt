local vars "cons_arhar_tur cons_attaNormal cons_attaPDS cons_bajra cons_bakery cons_beans cons_beer cons_bidi cons_brinjal cons_cabbage cons_carrot cons_cauliflower cons_cereal_tot cons_cigarettes cons_coal cons_condensed_milk cons_country_liquor cons_dryfruits_tot cons_dung_cake cons_egg_meat_tot cons_electricity cons_firewood cons_fruits_tot cons_ghee cons_gourds_pumpkin cons_green_chillies cons_gur cons_jowar cons_kerosene_PDS cons_ladyfinger cons_leaf_tobacco cons_leafyveggie cons_lemon cons_maida cons_masur cons_milk cons_milk_tot cons_mineral_water cons_moong cons_oil_tot cons_onion cons_otherveggie cons_p_processed_food_tot cons_pan_tot cons_parwal cons_peas cons_petrol cons_potato cons_pulses_tot cons_radish cons_ragi cons_refined_liquor cons_refined_oil cons_riceNormal cons_ricePDS cons_s_processed_food_tot cons_salt cons_spices_tot cons_sugarPDS cons_toddy cons_tomato cons_urd cons_vanaspati_oil Cons_exp cons_bedding_tot cons_clothes_tot cons_footwear_tot cons_leather_sandals cons_leather_shoes cons_mosquito_net cons_quilt_matress cons_rubber_footwear cons_secondhand_clothes cons_secondhand_footware cons_uniform_boys cons_uniform_girls cons_doctor_fee cons_educ_exp_tot cons_med_insti_tot cons_medicine cons_tuition_fee cons_cable_TV cons_cinema cons_entertainment_tot cons_hobby_goods cons_houserent_actual cons_houserent_imputed_U cons_internet_expense cons_misc_HH_consumables_tot cons_non_insti_med_tot cons_pads cons_servant cons_spectacle cons_toiletries cons_torch cons_water_bill"

foreach var of local vars {
    replace `var' = 0 if missing(`var')
}

gen pc_Cons_exp= Cons_exp/HH_Size_num
gen BPL=(pc_Cons_exp<1173) if pc_Cons_exp!=.
sum BPL

gen costly_dal= cons_arhar_tur+ cons_urd
gen cheap_dal= cons_moong+cons_masur
gen basic_veggie= cons_potato+cons_tomato+cons_onion+cons_radish
gen non_basic_veggie= cons_brinjal + cons_carrot + cons_leafyveggie + cons_green_chillies + cons_parwal + cons_ladyfinger + cons_cauliflower + cons_cabbage + cons_gourds_pumpkin + cons_peas + cons_beans + cons_lemon +cons_otherveggie

destring Sector, gen(Sector_num)
gen rural=0
replace rural=1 if Sector_num==1

destring Regular_salary_earner, gen(Regular_salary_earner_num)
gen Reg_salary_earner=0
replace Reg_salary_earner=1 if Regular_salary_earner_num==1

destring Possess_ration_card, gen(Possess_ration_card_num)
gen has_ration_card=0
replace has_ration_card=1 if Possess_ration_card_num==1

replace Social_Group = "ST" if Social_Group == "1"
replace Social_Group = "SC" if Social_Group == "2"
replace Social_Group = "OBC" if Social_Group == "3"
replace Social_Group = "other" if Social_Group == "9"

replace Religion = "hindu" if Religion == "1"
replace Religion = "muslim" if Religion == "2"
replace Religion = "christian" if Religion == "3"
replace Religion = "sikh" if Religion == "4"
replace Religion = "jain" if Religion == "5"
replace Religion = "buddhist" if Religion == "6"
replace Religion = "parsi" if Religion == "7"
replace Religion = "other" if Religion == "9"

replace Type_of_land_owned = "homestead only" if Type_of_land_owned== "1"
replace Type_of_land_owned = "homestead & other" if Type_of_land_owned== "2"
replace Type_of_land_owned = "other only" if Type_of_land_owned== "3"

replace Cooking_Code = "coke, coal" if Cooking_Code == "01"
replace Cooking_Code = "firewood and chips" if Cooking_Code == "02"
replace Cooking_Code = "LPG" if Cooking_Code == "03"
replace Cooking_Code = "gobar gas" if Cooking_Code == "04"
replace Cooking_Code = "dung cake" if Cooking_Code == "05"
replace Cooking_Code = "charcoal" if Cooking_Code == "06"
replace Cooking_Code = "kerosene" if Cooking_Code == "07"
replace Cooking_Code = "electricity" if Cooking_Code == "08"
replace Cooking_Code = "others" if Cooking_Code == "09"
replace Cooking_Code = "no cooking arrangement" if Cooking_Code == "10"

replace Lighting_Code = "kerosene" if Lighting_Code == "1"
replace Lighting_Code = "other oil" if Lighting_Code == "2"
replace Lighting_Code = "gas" if Lighting_Code == "3"
replace Lighting_Code = "candle" if Lighting_Code == "4"
replace Lighting_Code = "electricity" if Lighting_Code == "5"
replace Lighting_Code = "no lighting arrangement" if Lighting_Code == "6"
replace Lighting_Code = "others" if Lighting_Code == "9"

replace Dwelling_unit_Code = "owned" if Dwelling_unit_Code == "1"
replace Dwelling_unit_Code = "hired" if Dwelling_unit_Code == "2"
replace Dwelling_unit_Code = "no dwelling unit" if Dwelling_unit_Code == "3"
replace Dwelling_unit_Code = "others" if Dwelling_unit_Code == "9"

replace type_of_ration_card = "Antyodaya" if type_of_ration_card == "1"
replace type_of_ration_card = "BPL" if type_of_ration_card == "2"
replace type_of_ration_card = "others" if type_of_ration_card == "3"

replace Marital_status = "never married" if Marital_status == "1"
replace Marital_status = "currently married" if Marital_status == "2"
replace Marital_status = "widowed" if Marital_status == "3"
replace Marital_status = "divorced/separated" if Marital_status == "4"

*note: literate without formal schooling = lwfs
replace Education = "not literate" if Education == "01"
replace Education = "lwfs by EGS/NFEC/AEC" if Education == "02"
replace Education = "lwfs by TLC" if Education == "03"
replace Education = "lwfs by others" if Education == "04"
replace Education = "lwfs below primary" if Education == "05"
replace Education = "primary" if Education == "06"
replace Education = "middle" if Education == "07"
replace Education = "secondary" if Education == "08"
replace Education = "higher secondary" if Education == "10"
replace Education = "diploma/certificate course" if Education == "11"
replace Education = "graduate" if Education == "12"
replace Education = "postgraduate and above" if Education == "13"


