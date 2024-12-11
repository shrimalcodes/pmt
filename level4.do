keep if Relation=="1"
keep Sex Meals_per_day Marital_status HHID Education Days_stayed_away Age
encode Education, gen(Education_num)
encode Marital_status, gen(Marital_status_num)
encode Sex, gen(Sex_num)

