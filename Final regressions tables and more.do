encode Cooking_Code, gen(Cooking_Code_num)
encode Type_of_land_owned, gen(Type_of_land_owned_num)
encode Religion, gen(Religion_num)


gen Type_of_land_owned_homesteadonly=.

replace Type_of_land_owned_homesteadonly=1 if Type_of_land_owned=="homestead only"

replace Type_of_land_owned_homesteadonly=0 if Type_of_land_owned !="homestead only"

gen cooking_nocookingarrangement=.
replace cooking_nocookingarrangement = 1 if Cooking_Code == "no cooking arrangement"
replace cooking_nocookingarrangement = 0 if Cooking_Code != "no cooking arrangement"

//Model 1-2011
reg Cons_exp cons_clothes_tot cons_entertainment_tot cons_lemon cons_med_insti_tot cons_misc_HH_consumables_tot cons_educ_exp_tot cons_non_insti_med_tot cons_egg_meat_tot WH_car cons_milk cons_servant cons_refined_liquor i.Religion_num cons_pulses_tot cons_internet_expense cons_cable_TV cons_electricity i.Type_of_land_owned_num cons_jowar cons_dryfruits_tot cons_cinema Reg_salary_earner cons_vanaspati_oil cons_country_liquor cons_quilt_matress cons_firewood i.Cooking_Code_num cons_cereal_tot cons_leather_sandals cons_uniform_boys WH_PC_laptop

//model2-2011 WB basic shit
encode Dwelling_unit_Code, gen(Dwelling_unit_Code_num)

reg Cons_exp rural Dwelling_unit_Code_num cons_electricity cons_water_bill HH_Size_num i.Education_num Age Sex Reg_salary_earner Land_owned WH_telephone WH_stove WH_fridge WH_AC_cooler WH_electric_fan WH_Radio WH_motorcycle WH_car cons_servant

//model3- changed model 1 with observables
reg Cons_exp cons_clothes_tot cons_secondhand_clothes cons_entertainment_tot cons_lemon cons_med_insti_tot cons_misc_HH_consumables_tot cons_educ_exp_tot  cons_egg_meat_tot WH_car cons_milk cons_servant cons_refined_liquor i.Religion_num costly_dal cons_internet_expense cons_cable_TV cons_electricity i.Type_of_land_owned_num cons_jowar cons_dryfruits_tot cons_cinema Reg_salary_earner cons_vanaspati_oil cons_country_liquor cons_quilt_matress i.Cooking_Code_num cons_ricePDS cons_riceNormal cons_attaPDS cons_attaNormal cons_leather_sandals cons_rubber_footwear WH_PC_laptop
WH_fridge WH_car

//in the 2022 one
	
gen pred_cons_exp = 1010.752 + (2.854004 * cons_clothes_tot) + (-1.988649 * cons_clothing_secondhand) + (6.955461 * cons_entertainment_tot) + (111.8916 * cons_lemon) + (1.037651 * cons_medical_insti_tot) + (7.648736 * cons_other_HH_consumables_tot) + (1.000095 * cons_education_tot) + (1.798055 * cons_egg_meat_tot) + (2366.283 * has_car) + (1.15621 * cons_milk) + (2.045985 * cons_refined_liquor) + (2.5326 * cons_pulses_tot) + (5.118733 * cons_internet) + (-5.201919 * cons_cable_TV) + (1.56358 * cons_electricity) + (2.663729 * cons_jowar) + (2.545463 * cons_dryfruits_tot) + (-5.99478 * cons_cinema) + (407.4424 * employed_annual) + (5.137767 * cons_country_liquor) + (2.700592 * cons_quilt_mattress) + (2.015048 * cons_rice_PDS) + (1.127483 * cons_rice_other) + (2.201427 * cons_attaPDS) + (1.175512 * cons_attaNormal) + (-0.574621 * cons_leather_chappals) + (-0.925606 * cons_rubber_footwear) + (1166.231 * has_laptop) + (597.2588 * has_fridge)

//Comparison
twoway (kdensity total_exp_2022, color(blue)) (kdensity pred_cons_exp2011for22, color(red))

twoway (kdensity total_exp_2022, color(blue)) (kdensity pred_cons_exp_WBmodel2, color(red))

gen pred_cons_exp2011for22_under = cond(pred_cons_exp2011for22 < 75000, pred_cons_exp2011for22, .)
gen total_exp_2022_under = cond(total_exp_2022 < 75000, total_exp_2022, .)

twoway (kdensity pred_cons_exp2011for22_under if pred_cons_exp2011for22_under>=0 & pred_cons_exp2011for22_under<=75000 , color(blue)) (kdensity total_exp_2022_under if total_exp_2022_under>=0 & total_exp_2022_under<=75000, color(red)), xlabel(, nogrid) ylabel(, nogrid) xtitle("PC Consumption/Per month in Rs") ytitle("Distribution (%)") legend(off)

//predicted WB model 
gen rural=.
replace rural=1 if sector==2
replace rural=0 if sector==1

gen pred_cons_exp_WBmodel = 1707.836 + (464.34 * rural)  + (5.018252 * cons_electricity) + (4.294743 * cons_water_bill) + (792.8436 * hh_size) + (-220.1121 * edu_years) + (8.632137 * age) + (6.094483 * male) + (854.0273 * employed_annual) + (0.2634127 * owns_land) + (2944.291 * has_mobile) + (2153.303 * has_fridge) + (-115.877 * has_ac) + (483.5018 * has_radio) + (1452.256 * has_bike) + (4355.089 * has_car) 

gen pred_cons_exp_WBmodel_under = cond(pred_cons_exp_WBmodel < 75000, pred_cons_exp_WBmodel, .)

twoway (kdensity pred_cons_exp_WBmodel_under if pred_cons_exp_WBmodel_under>=0 & pred_cons_exp_WBmodel_under<=75000, color(blue)) (kdensity total_exp_2022_under if total_exp_2022_under>= 0 & total_exp_2022_under<= 75000, color(red)), xlabel(, nogrid) ylabel(, nogrid) xtitle("PC Consumption/Per month in Rs") ytitle("Distribution (%)") legend(off)

twoway (histogram pred_cons_exp_WBmodel_under, color(blue) bin(100)) (histogram total_exp_2022_under, color(red) bin(100))


//and there is no dwelling unit code 

//changes made were owns land and cannot find dwelling unit code. Rural is also not a binary. Servant wasn't there. stove was also not there

// (52,965 missing values generated) why??- edu_years had missing values which were replaced with 0

// go back and make these changes- //changes made were owns land and cannot find dwelling unit code. Rural is also not a binary. Servant wasn't there. stove was also not there

gen owns_land=.
replace owns_land=0 if Land_owned==0
replace owns_land=1 if Land_owned!=0

reg Cons_exp rural Dwelling_unit_Code_num cons_electricity cons_water_bill HH_Size_num Education_num Age Sex Reg_salary_earner owns_land WH_telephone WH_fridge WH_AC_cooler WH_electric_fan WH_Radio WH_motorcycle WH_car

gen pred_cons_exp_WBmodel2 = 176.9006 + (322.6897 * rural) + (5.97704 * cons_electricity) + (5.503443 * cons_water_bill) + (767.0644 * hh_size) + (147.2202 * edu_years) + (13.72909 * age) + (-7.832779 * male) + (959.54 * employed_annual) + (-1219.735 * owns_land) + (3414.188 * has_mobile) + (2236.123 * has_fridge) + (60.62821 * has_ac) + (579.4772 * has_radio) + (1542.655 * has_bike) + (5112.912 * has_car)

drop pred_cons_exp_WBmodel

//generating quartiles in 2022
xtile quartile_WBmodel2 = pred_cons_exp_WBmodel2, nq(4)
gen pred_cons_exp_WBmodel_Q1 = cond(quartile_WBmodel2 == 1, pred_cons_exp_WBmodel2, .)
gen pred_cons_exp_WBmodel_Q2 = cond(quartile_WBmodel2 == 2, pred_cons_exp_WBmodel2, .)
gen pred_cons_exp_WBmodel_Q3 = cond(quartile_WBmodel2 == 3, pred_cons_exp_WBmodel2, .)
gen pred_cons_exp_WBmodel_Q4 = cond(quartile_WBmodel2 == 4, pred_cons_exp_WBmodel2, .)

xtile quartile_pred_cons_exp2011for22 = pred_cons_exp2011for22, nq(4)
xtile quartile_total_exp_2022 = total_exp_2022_under, nq(4)

gen pred_cons_exp2011for22_Q1 = cond(quartile_pred_cons_exp2011for22 == 1, pred_cons_exp2011for22, .)
gen pred_cons_exp2011for22_Q2 = cond(quartile_pred_cons_exp2011for22 == 2, pred_cons_exp2011for22, .)
gen pred_cons_exp2011for22_Q3 = cond(quartile_pred_cons_exp2011for22 == 3, pred_cons_exp2011for22, .)
gen pred_cons_exp2011for22_Q4 = cond(quartile_pred_cons_exp2011for22 == 4, pred_cons_exp2011for22, .)

gen total_exp_2022_Q1 = cond(quartile_total_exp_2022 == 1, total_exp_2022, .)
gen total_exp_2022_Q2 = cond(quartile_total_exp_2022 == 2, total_exp_2022, .)
gen total_exp_2022_Q3 = cond(quartile_total_exp_2022 == 3, total_exp_2022, .)
gen total_exp_2022_Q4 = cond(quartile_total_exp_2022 == 4, total_exp_2022, .)

twoway (kdensity total_exp_2022_Q1, color(red) lpattern(solid) lwidth(medium))(kdensity pred_cons_exp2011for22_Q1, color(blue) lpattern(solid) lwidth(medium)),title("Density: Quartile 1 of Total Expenditure vs 2011 Prediction") legend(order(1 "Total Exp (Q1)" 2 "2011 Prediction (Q1)")) 

twoway (kdensity total_exp_2022_Q2, color(red) lpattern(solid) lwidth(medium)) (kdensity pred_cons_exp2011for22_Q2, color(blue) lpattern(solid) lwidth(medium)), title("Density: Quartile 2 of Total Expenditure vs 2011 Prediction") legend(order(1 "Total Exp (Q2)" 2 "2011 Prediction (Q2)")) 

twoway (kdensity total_exp_2022_Q3, color(red) lpattern(solid) lwidth(medium)) (kdensity pred_cons_exp2011for22_Q3, color(blue) lpattern(solid) lwidth(medium)), title("Density: Quartile 3 of Total Expenditure vs 2011 Prediction") legend(order(1 "Total Exp (Q3)" 2 "2011 Prediction (Q3)")) 


//3 divisions instead of quartiles 
xtile tertile_WBmodel = pred_cons_exp_WBmodel, nq(3)
gen pred_cons_exp_WBmodel_T1 = cond(tertile_WBmodel == 1, pred_cons_exp_WBmodel, .)
gen pred_cons_exp_WBmodel_T2 = cond(tertile_WBmodel == 2, pred_cons_exp_WBmodel, .)
gen pred_cons_exp_WBmodel_T3 = cond(tertile_WBmodel == 3, pred_cons_exp_WBmodel, .)

xtile tertile_pred_cons_exp2011for22 = pred_cons_exp2011for22, nq(3)
gen pred_cons_exp2011for22_T1 = cond(tertile_pred_cons_exp2011for22 == 1, pred_cons_exp2011for22, .)
gen pred_cons_exp2011for22_T2 = cond(tertile_pred_cons_exp2011for22 == 2, pred_cons_exp2011for22, .)
gen pred_cons_exp2011for22_T3 = cond(tertile_pred_cons_exp2011for22 == 3, pred_cons_exp2011for22, .)

xtile tertile_total_exp_2022 = total_exp_2022_under, nq(3)
gen total_exp_2022_T1 = cond(tertile_total_exp_2022 == 1, total_exp_2022, .)
gen total_exp_2022_T2 = cond(tertile_total_exp_2022 == 2, total_exp_2022, .)
gen total_exp_2022_T3 = cond(tertile_total_exp_2022 == 3, total_exp_2022, .)

twoway (kdensity total_exp_2022_T1, color(red) lpattern(solid) lwidth(medium)) (kdensity pred_cons_exp2011for22_T1, color(blue) lpattern(solid) lwidth(medium)), legend(order(1 "Total Exp (T1)" 2 "2011 Prediction (T1)")) 

twoway (kdensity total_exp_2022_T2, color(red) lpattern(solid) lwidth(medium)) (kdensity pred_cons_exp2011for22_T2, color(blue) lpattern(solid) lwidth(medium)), legend(order(1 "Total Exp (T2)" 2 "2011 Prediction (T2)")) 

twoway (kdensity total_exp_2022_T3, color(red) lpattern(solid) lwidth(medium)) (kdensity pred_cons_exp2011for22_T3, color(blue) lpattern(solid) lwidth(medium)), legend(order(1 "Total Exp (T3)" 2 "2011 Prediction (T3)")) 

*Graphs for wb*
twoway (kdensity total_exp_2022_T1, color(red) lpattern(solid) lwidth(medium)) (kdensity pred_cons_exp_WBmodel_T1, color(blue) lpattern(solid) lwidth(medium)), legend(order(1 "Total Exp (T1)" 2 "WB Model (T1)")) 

twoway (kdensity total_exp_2022_T2, color(red) lpattern(solid) lwidth(medium)) (kdensity pred_cons_exp_WBmodel_T2, color(blue) lpattern(solid) lwidth(medium)), legend(order(1 "Total Exp (T2)" 2 "WB Model (T2)")) 
	   
twoway (kdensity total_exp_2022_T3, color(red) lpattern(solid) lwidth(medium)) (kdensity pred_cons_exp_WBmodel_T3, color(blue) lpattern(solid) lwidth(medium)), legend(order(1 "Total Exp (T3)" 2 "WB Model (T3)")) 

*PC graphs*
gen pc_exp_2022_WB_under = cond(pc_exp_2022_WB < 45000, pc_exp_2022_WB, .)
gen pc_exp_2022_pred_under = cond(pc_exp_2022_pred < 45000, pc_exp_2022_pred, .)
gen tot_pc_exp_2022_under = cond(tot_pc_exp_2022 < 45000, tot_pc_exp_2022, .)

* Generate Tertiles for per capita expenditure (WB model)
xtile pc_tertile_WBmodel = pc_exp_2022_WB, nq(3)

* Assign per capita predicted consumption expenditure to respective tertiles
gen pc_exp_WBT1 = cond(pc_tertile_WBmodel == 1, pc_exp_2022_WB, .)
gen pc_exp_WBT2 = cond(pc_tertile_WBmodel == 2, pc_exp_2022_WB, .)
gen pc_exp_WBT3 = cond(pc_tertile_WBmodel == 3, pc_exp_2022_WB, .)

* Generate Tertiles for total per capita expenditure (actual)
xtile pc_tertile_tot_exp = tot_pc_exp_2022, nq(3)

* Assign total per capita expenditure (actual) to respective tertiles
gen pc_exp_TOT1 = cond(pc_tertile_tot_exp == 1, tot_pc_exp_2022, .)
gen pc_exp_TOT2 = cond(pc_tertile_tot_exp == 2, tot_pc_exp_2022, .)
gen pc_exp_TOT3 = cond(pc_tertile_tot_exp == 3, tot_pc_exp_2022, .)

* Generate Tertiles for predicted per capita expenditure
xtile pc_tertile_exp_pred = pc_exp_2022_pred, nq(3)

* Assign predicted per capita expenditure to respective tertiles
gen pc_exp_PRED1 = cond(pc_tertile_exp_pred == 1, pc_exp_2022_pred, .)
gen pc_exp_PRED2 = cond(pc_tertile_exp_pred == 2, pc_exp_2022_pred, .)
gen pc_exp_PRED3 = cond(pc_tertile_exp_pred == 3, pc_exp_2022_pred, .)


summarize pc_exp_PRED3

twoway (kdensity pc_exp_TOT1 if pc_exp_TOT1 >= 0 & pc_exp_TOT1 <= 3000, color(red) lpattern(solid) lwidth(medium)) (kdensity pc_exp_PRED1 if pc_exp_PRED1 >= 0 & pc_exp_PRED1 <= 3000, color(blue) lpattern(solid) lwidth(medium)), xline(1173, lpattern(dash) lcolor(black) lwidth(thin)) xline(1331, lpattern(dash) lcolor(green) lwidth(thin)) xline(908, lpattern(dash) lcolor(orange) lwidth(thin)) text(0.0008 1090 "{bf:}{it:P1}" , size(medium) color(black)) text(0.0008 1400 "{bf:}{it:P2}" , size(medium) color(black)) text(0.0008 800 "{bf:}{it:P3}" , size(medium) color(black)) xlabel(0(500)3000, nogrid) ylabel(, nogrid) xtitle("PC Consumption/Per month in Rs") ytitle("Distribution (%)") legend(off)title("Tertile 1 comparison")


twoway (kdensity pc_exp_TOT2, color(red) lpattern(solid) lwidth(medium)) (kdensity pc_exp_PRED2, color(blue) lpattern(solid) lwidth(medium)), legend(off) xlabel(, nogrid) ylabel(, nogrid) xtitle("PC Consumption/Per month in Rs") ytitle("Distribution (%)") legend(off) title("Tertile 2 comparison")

twoway (kdensity pc_exp_TOT3, color(red) lpattern(solid) lwidth(medium)) (kdensity pc_exp_PRED3, color(blue) lpattern(solid) lwidth(medium)), legend(off) xlabel(, nogrid) ylabel(, nogrid) xtitle("PC Consumption/Per month in Rs") ytitle("Distribution (%)") legend(off) title("Tertile 3 comparison")


*WB graphs*

twoway (kdensity pc_exp_TOT1, color(red) lpattern(solid) lwidth(medium)) (kdensity pc_exp_WBT1, color(blue) lpattern(solid) lwidth(medium)), xline(1173, lpattern(dash) lcolor(black) lwidth(thin)) xline(1331, lpattern(dash) lcolor(green) lwidth(thin)) xline(908, lpattern(dash) lcolor(orange) lwidth(thin)) text(0.00172 1090 "{bf:}{it:P1}" , size(medium) color(black)) text(0.00172 1400 "{bf:}{it:P2}" , size(medium) color(black)) text(0.00172 800 "{bf:}{it:P3}" , size(medium) color(black)) xlabel(0(500)3000, nogrid) ylabel(, nogrid) xtitle("PC Consumption/Per month in Rs") ytitle("Distribution (%)") title("Tertile 1 comparison") legend(off)

twoway (kdensity pc_exp_TOT2, color(red) lpattern(solid) lwidth(medium)) (kdensity pc_exp_WBT2, color(blue) lpattern(solid) lwidth(medium)), xlabel(, nogrid) ylabel(, nogrid) xtitle("PC Consumption/Per month in Rs") ytitle("Distribution (%)") legend(off) title("Tertile 2 comparison")


twoway (kdensity pc_exp_TOT3, color(red) lpattern(solid) lwidth(medium)) (kdensity pc_exp_WBT3, color(blue) lpattern(solid) lwidth(medium)), xlabel(, nogrid) ylabel(, nogrid) xtitle("PC Consumption/Per month in Rs") ytitle("Distribution (%)") legend(off) title("Tertile 3 comparison")

//renaming 
rename cons_egg_meat_tot cons_egg_meat 
rename cons_pulses_tot cons_costly_dals
rename cons_cereal_tot cons_costly_cereal

reg Cons_exp cons_clothes_tot cons_entertainment_tot cons_lemon cons_med_insti_tot cons_misc_HH_consumables_tot cons_educ_exp_tot cons_non_insti_med_tot cons_egg_meat WH_car cons_milk cons_servant cons_refined_liquor i.Religion_num cons_costly_dals cons_internet_expense cons_cable_TV cons_electricity i.Type_of_land_owned_num cons_jowar cons_dryfruits_tot cons_cinema Reg_salary_earner cons_vanaspati_oil cons_country_liquor cons_quilt_matress cons_firewood i.Cooking_Code_num cons_costly_cereal cons_leather_sandals cons_uniform_boys WH_PC_laptop


