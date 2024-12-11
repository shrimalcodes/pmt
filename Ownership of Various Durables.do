drop if inlist(Item_Code, "550", "551", "552", "553", "554", "555", "556", "557")
drop if inlist(Item_Code, "558", "559", "561", "562", "563", "564", "565", "566")
drop if inlist(Item_Code, "567", "568", "569", "570", "571", "572", "573", "574")
drop if inlist(Item_Code, "575", "576", "577", "578", "579", "582", "583", "584")
drop if inlist(Item_Code, "587", "589", "590", "591", "592", "593", "594", "595")
drop if inlist(Item_Code, "596", "597", "598", "599", "603", "604", "605", "606")
drop if inlist(Item_Code, "607", "608", "609", "610", "611", "612", "613", "614")
drop if inlist(Item_Code, "615", "616", "617", "618", "619", "620", "621", "625")
drop if inlist(Item_Code, "626", "627", "628", "629")


encode Item_Code, gen(Item_Code_num)

label list Item_Code_num 

drop Item_Code 

keep HHID Item_Code_num Whether_Possesses 

reshape wide Whether_Possesses, i(HHID) j(Item_Code_num)

gen WH_Radio=.

replace WH_Radio=0 if Whether_Possesses1=="1"
replace WH_Radio=1 if Whether_Possesses1=="2"

gen WH_electric_fan = .
replace WH_electric_fan = 0 if Whether_Possesses2 == "1"
replace WH_electric_fan = 1 if Whether_Possesses2 == "2"

gen WH_AC_cooler = .
replace WH_AC_cooler = 0 if Whether_Possesses3 == "1"
replace WH_AC_cooler = 1 if Whether_Possesses3 == "2"

gen WH_washing_machine = .
replace WH_washing_machine = 0 if Whether_Possesses4 == "1"
replace WH_washing_machine = 1 if Whether_Possesses4 == "2"

gen WH_stove = .
replace WH_stove = 0 if Whether_Possesses5 == "1"
replace WH_stove = 1 if Whether_Possesses5 == "2"

gen WH_fridge = .
replace WH_fridge = 0 if Whether_Possesses6 == "1"
replace WH_fridge = 1 if Whether_Possesses6 == "2"

gen WH_bicycle = .
replace WH_bicycle = 0 if Whether_Possesses7 == "1"
replace WH_bicycle = 1 if Whether_Possesses7 == "2"

gen WH_motorcycle = .
replace WH_motorcycle = 0 if Whether_Possesses8 == "1"
replace WH_motorcycle = 1 if Whether_Possesses8 == "2"

gen WH_car = .
replace WH_car = 0 if Whether_Possesses9 == "1"
replace WH_car = 1 if Whether_Possesses9 == "2"

gen WH_PC_laptop = .
replace WH_PC_laptop = 0 if Whether_Possesses10 == "1"
replace WH_PC_laptop = 1 if Whether_Possesses10 == "2"

gen WH_mobile = .
replace WH_mobile = 0 if Whether_Possesses11 == "1"
replace WH_mobile = 1 if Whether_Possesses11 == "2"

gen WH_telephone = .
replace WH_telephone = 0 if Whether_Possesses12 == "1"
replace WH_telephone = 1 if Whether_Possesses12 == "2"

 
drop Whether_Possesses23 Whether_Possesses22 Whether_Possesses21 Whether_Possesses20 Whether_Possesses19 Whether_Possesses18 Whether_Possesses17 Whether_Possesses16 Whether_Possesses15 Whether_Possesses14 Whether_Possesses13 

drop Whether_Possesses1 Whether_Possesses10 Whether_Possesses11 Whether_Possesses12 Whether_Possesses2 Whether_Possesses3 Whether_Possesses4 Whether_Possesses5 Whether_Possesses6 Whether_Possesses7 Whether_Possesses8 Whether_Possesses9

/Users/siddharthshrimal/Downloads/HCES/HCES_2011_type 1/19novdata_dofiles/DO files/Do they have
    stuff.dta
