keep Item_Code HHID Last_30days_Value

rename Last_30days_Value TCVseven_eight

drop if inlist(Item_Code, "350", "351", "352", "353", "354")
drop if inlist(Item_Code, "355", "358", "359", "360", "361")
drop if inlist(Item_Code, "362", "363", "364", "365", "366")
drop if inlist(Item_Code, "367", "368", "369", "370", "371")
drop if inlist(Item_Code, "372", "373", "374", "375", "377")
drop if inlist(Item_Code, "378", "380", "381", "383", "385")
drop if inlist(Item_Code, "386", "387", "388", "392", "394")
drop if inlist(Item_Code, "396", "397", "398")

replace Item_Code = "uniform_boys" if Item_Code == "356"
replace Item_Code = "uniform_girls" if Item_Code == "357"
replace Item_Code = "secondhand_clothes" if Item_Code == "376"
replace Item_Code = "clothes_tot" if Item_Code == "379"
replace Item_Code = "quilt_matress" if Item_Code == "382"
replace Item_Code = "mosquito_net" if Item_Code == "384"
replace Item_Code = "bedding_tot" if Item_Code == "389"
replace Item_Code = "leather_shoes" if Item_Code == "390"
replace Item_Code = "leather_sandals" if Item_Code == "391"
replace Item_Code = "rubber_footwear" if Item_Code == "393"
replace Item_Code = "secondhand_footware" if Item_Code == "395"
replace Item_Code = "footwear_tot" if Item_Code == "399"

encode Item_Code, gen(Item_Code_numeric)

label list Item_Code_numeric

drop Item_Code

isid HHID Item_Code_numeric

reshape wide TCVseven_eight, i(HHID) j(Item_Code_numeric)

local items "bedding_tot clothes_tot footwear_tot leather_sandals leather_shoes mosquito_net quilt_matress rubber_footwear secondhand_clothes secondhand_footware uniform_boys uniform_girls"

local i = 1
foreach item in `items' {
    rename TCVseven_eight`i' cons_`item'
    local i = `i' + 1
}


