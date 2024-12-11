keep HHID Value Item_code

rename Value TCVten

drop if inlist(Item_code, "420", "421", "422", "423", "424", "425", "426", "427", "428") 
drop if inlist(Item_code, "431", "432", "433", "435", "436", "438", "442", "443", "444")  
drop if inlist(Item_code, "445", "446", "447", "448", "449", "450", "451", "452", "453")  
drop if inlist(Item_code, "454", "455", "457", "458", "460", "461", "462", "463", "464")  
drop if inlist(Item_code, "465", "466", "467", "468", "469", "470", "471", "472", "473")  
drop if inlist(Item_code, "474", "475", "476", "477", "478", "481", "482", "483", "484")  
drop if inlist(Item_code, "485", "486", "487", "488", "489", "490", "491", "492", "493")  
drop if inlist(Item_code, "494", "495", "497", "498", "499", "500", "501", "502", "503")  
drop if inlist(Item_code, "504", "505", "506", "507", "508", "509", "510", "511", "512")  
drop if inlist(Item_code, "513", "514", "515", "516", "517", "518", "519", "521", "522")  
drop if inlist(Item_code, "523", "524", "525", "526", "527", "528", "529", "530", "531")  
drop if inlist(Item_code, "532", "533", "534", "535", "536", "537", "538", "541", "542")  
drop if inlist(Item_code, "543", "544", "545", "546", "547", "548", "549")

replace Item_code = "non_insti_med_tot" if Item_code == "429"
replace Item_code = "cinema" if Item_code == "430"
replace Item_code = "hobby_goods" if Item_code == "434"
replace Item_code = "cable_TV" if Item_code == "437"
replace Item_code = "entertainment_tot" if Item_code == "439"
replace Item_code = "spectacle" if Item_code == "440"
replace Item_code = "torch" if Item_code == "441"
replace Item_code = "pads" if Item_code == "456"
replace Item_code = "toiletries" if Item_code == "459"
replace Item_code = "misc_HH_consumables_tot" if Item_code == "479"
replace Item_code = "servant" if Item_code == "480"
replace Item_code = "internet_expense" if Item_code == "496"
replace Item_code = "houserent_actual" if Item_code == "520"
replace Item_code = "houserent_imputed_U" if Item_code == "539"
replace Item_code = "water_bill" if Item_code == "540"

encode Item_code, gen(Item_code_numeric)
label list Item_code_numeric
drop Item_code

reshape wide TCVten, i(HHID) j(Item_code_numeric)

local items "cable_TV cinema entertainment_tot hobby_goods houserent_actual houserent_imputed_U internet_expense misc_HH_consumables_tot non_insti_med_tot pads servant spectacle toiletries torch water_bill"

local i = 1
foreach item in `items' {
    rename TCVten`i' cons_`item'
    local i = `i' + 1
}

