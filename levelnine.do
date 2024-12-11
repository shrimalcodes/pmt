keep HHID Expenditure_in_Rs_last_30_days Item_Code

rename Expenditure_in_Rs_last_30_days TCVnine

drop if inlist(Item_Code, "400", "401", "402", "403", "404", "406", "407", "408", "413")
drop if inlist(Item_Code, "414", "415", "416", "417", "418", "411")

replace Item_Code = "tuition_fee" if Item_Code == "405"
replace Item_Code = "educ_exp_tot" if Item_Code == "409"
replace Item_Code = "medicine" if Item_Code == "410"
replace Item_Code = "doctor_fee" if Item_Code == "412"
replace Item_Code = "med_insti_tot" if Item_Code == "419"

encode Item_Code, gen(Item_Code_numeric)
label list Item_Code_numeric

drop Item_Code

reshape wide TCVnine, i(HHID) j(Item_Code_numeric)

local items "doctor_fee educ_exp_tot med_insti_tot medicine tuition_fee"

local i = 1
foreach item in `items' {
    rename TCVnine`i' cons_`item'
    local i = `i' + 1
}
