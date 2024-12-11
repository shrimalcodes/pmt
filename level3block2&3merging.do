merge 1:m HHID using "/Users/siddharthshrimal/Downloads/HCES/HCES_2011_type 1/data/Final ones/block3level3dropped.dta"


//merging
merge 1:m HHID using "/Users/siddharthshrimal/Downloads/HCES/HCES_2011_type 1/data/summary block 12- keeping only total consumption.dta" 

//cleaning and dropping
*TBD* 

//to regress
encode Social_Group, gen(Social_Group_num)
encode Religion, gen(Religion_num)

//regression now
reg Value i.Social_Group_num 
reg Value i.Religion_num
