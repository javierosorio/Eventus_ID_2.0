


****************************************
* COLLAPSE DATABASE FOR TSCS ANALYSIS


set more off


***************************************************
*** Generate event numeric codes using main categories

* 1.2 Source main code	
{	
gen source_code   = .				
	replace  source_code=1	if source_maincat =="Government authorities"
	replace  source_code=1	if source_maincat =="Government authorities"
	replace  source_code=1	if source_maincat =="Government authorities"
	replace  source_code=2	if source_maincat =="Assets"
	replace  source_code=2	if source_maincat =="Assets"
	replace  source_code=2	if source_maincat =="Assets"
	replace  source_code=3	if source_maincat =="Criminals"
	replace  source_code=4	if source_maincat =="Drugs"
	replace  source_code=5	if source_maincat =="Other"
	replace  source_code=6	if source_maincat =="Person"
	replace  source_code=7	if source_maincat =="Weapons"
	
	label define source 1 "Army" 2 "Assets" 3 "Criminals" 4 "Drugs" 5 "Other" 6 "Person" 7 "Weapons"
	label val source_code source
}				
				* End source main code
								
* 1.2 Action main code	
{				
gen action_code   =.				
	replace action_code=1	if action_maincat   =="Arrest"
	replace action_code=2	if action_maincat   =="Destroy"
	replace action_code=3	if action_maincat   =="Seize"
	replace action_code=3	if action_maincat   =="Seize"
	replace action_code=3	if action_maincat   =="Seize"
	replace action_code=4	if action_maincat   =="Release"
	
	label define action 1 "Arrest" 2 "Destroy" 3 "Seize" 4 "Release"
	label val action_code action
}				
				* End action main code
								
* 1.3 Target main code	
{	
gen target_code   = .				
	replace target_code=	1	if target_maincat=="Army"
	replace target_code=	1	if target_maincat=="Government authorities"
	replace target_code=	1	if target_maincat=="Government authorities"
	replace target_code=	1	if target_maincat=="Government authorities"
	replace target_code=	2	if target_maincat=="Assets"
	replace target_code=	2	if target_maincat=="Assets"
	replace target_code=	2	if target_maincat=="Assets"
	replace target_code=	3	if target_maincat=="Criminals"
	replace target_code=	4	if target_maincat=="Drugs"
	replace target_code=	5	if target_maincat=="Other"
	replace target_code=	6	if target_maincat=="Person"
	replace target_code=	7	if target_maincat=="Weapons"

	label define target 1 "Army" 2 "Assets" 3 "Criminals" 4 "Drugs" 5 "Other" 6 "Person" 7 "Weapons"
	label val target_code target
}				
				* End target main code



***************************************************
*** Order variables
order cve_mun1 date year month day source_code action_code target_code event_count



***************************************************
*** Collapse
collapse (mean)  cve_ent1 year month day (rawsum) event_count  , by(cve_mun1 date source_code action_code target_code)

	label val source_code source
	label val action_code action
	label val target_code target


***************************************************
*** Gen event type variables

	sort action_code  target_code

* Gen variables
	* Arrest
		tab target_code if action_code==1, gen(arrest_)
	* Destroy
		tab target_code if action_code==2, gen(destroy_)
	* Seize
		tab target_code if action_code==3, gen(seize_)
	* Release
		tab target_code if action_code==4, gen(release_)

* Impute number of events
	* Arrest
		replace arrest_1=event_count if arrest_1==1
		replace arrest_1=event_count if arrest_2==1
			drop arrest_2
	* Destroy
		replace destroy_1=event_count if destroy_1==1
	* Seize
		replace seize_1=event_count if seize_1==1
		replace seize_2=event_count if seize_2==1
		replace seize_3=event_count if seize_3==1
		replace seize_4=event_count if seize_4==1
	* Release
		replace release_1=event_count if release_1==1

* Rename variables
	rename arrest_1 arrest_person
	rename destroy_1 destroy_asset
	rename seize_1 seize_asset
	rename seize_2 seize_drugs
	rename seize_3 seize_other
	rename seize_4 seize_weapons
	rename release_1 release_person


***************************************************
*** Gen date_mun variable and save database		
	gen double date_mun=(date*100000)+cve_mun1
		format %15.0g date_mun	

	order date_mun
	sort date_mun
	save "data_collapsed.dta", replace
 	
***************************************************
*** Gen individual databases	
		* Begin code
		{
	
* Gen database of  arrest_person
	clear
	use "data_collapsed.dta"
	keep date_mun cve_mun1 date source_code action_code target_code cve_ent1 year month day arrest_person 
	keep if arrest_person>=1 & arrest_person~=.
	sort date_mun
	save "data_arrest_person", replace
* Gen database of  
	clear
	use "data_collapsed.dta"
	keep date_mun cve_mun1 date source_code action_code target_code cve_ent1 year month day destroy_asset 
	keep if destroy_asset>=1 & destroy_asset~=.
	sort date_mun
	save "data_destroy_asset", replace
* Gen database of  
	clear
	use "data_collapsed.dta"
	keep date_mun cve_mun1 date source_code action_code target_code cve_ent1 year month day seize_asset 
	keep if seize_asset>=1 & seize_asset~=.
	sort date_mun
	save "data_seize_asset", replace
* Gen database of  
	clear
	use "data_collapsed.dta"
	keep date_mun cve_mun1 date source_code action_code target_code cve_ent1 year month day seize_drugs 
	keep if seize_drugs>=1 & seize_drugs~=.
	sort date_mun
	save "data_seize_drugs", replace
* Gen database of  
	clear
	use "data_collapsed.dta"
	keep date_mun cve_mun1 date source_code action_code target_code cve_ent1 year month day seize_other 
	keep if seize_other>=1 & seize_other~=.
	sort date_mun
	save "data_seize_other", replace
* Gen database of  seize_weapons
	clear
	use "data_collapsed.dta"
	keep date_mun cve_mun1 date source_code action_code target_code cve_ent1 year month day seize_weapons 
	keep if seize_weapons>=1 & seize_weapons~=.
	sort date_mun
	save "data_seize_weapons", replace
* Gen database of  release_person
	clear
	use "data_collapsed.dta"
	keep date_mun cve_mun1 date source_code action_code target_code cve_ent1 year month day release_person 
	keep if release_person>=1 & release_person~=.
	sort date_mun
	save "data_release_person", replace
	}
		* End code
	
	
***************************************************
*** MERGE INTO TSCS TEMPLATE

clear 
use "Data_template.dta"

merge 1:1 date_mun using "data_arrest_person"
	replace arrest_person=0 if arrest_person==.
	drop _merge
merge 1:1 date_mun using "data_destroy_asset"
	replace destroy_asset=0 if destroy_asset==.
	drop _merge
merge 1:1 date_mun using "data_seize_asset"
	replace seize_asset=0 if seize_asset==.
	drop _merge
merge 1:1 date_mun using "data_seize_drugs"
	replace seize_drugs=0 if seize_drugs==.
	drop _merge
merge 1:1 date_mun using "data_seize_other"
	replace seize_other=0 if seize_other==.
	drop _merge
merge 1:1 date_mun using "data_seize_weapons"
	replace seize_weapons=0 if seize_weapons==.
	drop _merge
merge 1:1 date_mun using "data_release_person"
	replace release_person=0 if release_person==.
	drop _merge

* order data
	order date_mun mpal_id date year month day arrest_person destroy_asset seize_asset seize_drugs seize_other seize_weapons release_person

* save
	save "eventdata_TSCS.dta", replace
	

	
	
******************************************************************************************************
******************************************************************************************************


*set processors 4

* set up TSCS data	
xtset mpal_id date

* Generate additional variables

gen com_other2= com_other+ com_rustling+ com_robbery_road+ com_robbery_bank

gen composite_event=0
	replace composite_event=1 if arrest_person>0
	replace composite_event=composite_event+1 if destroy_asset>0
	replace composite_event=composite_event+1 if seize_asset>0
	replace composite_event=composite_event+1 if seize_drugs>0
	replace composite_event=composite_event+1 if seize_other >0
	replace composite_event=composite_event+1 if seize_weapons>0
	replace composite_event=composite_event+1 if release_person>0
	
gen composite_index=arrest_person +destroy_asset +seize_asset +seize_drugs +seize_other +seize_weapons +release_person


sum arrest_person destroy_asset seize_asset seize_drugs seize_other seize_weapons release_person composite_event composite_index

	
**** PA REGRESSION	WITH CRIMINAL BEHAVIOR
* Regression analysis
set more off 
xtnbreg arrest_person unemp IndRezSoc drug_production gulf_3 North_3 Pacific_3 tm_mp pob_log total_drugs total_all_dto com_property_crimes com_homicide com_injury com_kidnapping com_theft com_rape com_other2 ,  pa exposure(date) vce(robust)
	estimates store m1pa2

set more off 
xtnbreg seize_asset unemp IndRezSoc drug_production gulf_3 North_3 Pacific_3 tm_mp pob_log total_drugs total_all_dto com_property_crimes com_homicide com_injury com_kidnapping com_theft com_rape com_other2  ,  pa exposure(date) vce(robust)
	estimates store m2pa2
	
set more off 
xtnbreg seize_drugs unemp IndRezSoc drug_production gulf_3 North_3 Pacific_3 tm_mp pob_log total_drugs total_all_dto com_property_crimes com_homicide com_injury com_kidnapping com_theft com_rape com_other2  ,  pa exposure(date) vce(robust)
	estimates store m3pa2

set more off 
xtnbreg seize_weapons unemp IndRezSoc drug_production gulf_3 North_3 Pacific_3 tm_mp pob_log total_drugs total_all_dto com_property_crimes com_homicide com_injury com_kidnapping com_theft com_rape com_other2  ,  pa exposure(date) vce(robust)
	estimates store m4pa2

set more off
xtnbreg composite_event unemp IndRezSoc drug_production gulf_3 North_3 Pacific_3 tm_mp pob_log total_drugs total_all_dto com_property_crimes com_homicide com_injury com_kidnapping com_theft com_rape com_other2 ,  pa exposure(date) vce(robust)
	estimates store m5pa2

set more off
xtnbreg composite_index unemp IndRezSoc drug_production gulf_3 North_3 Pacific_3 tm_mp pob_log total_drugs total_all_dto com_property_crimes com_homicide com_injury com_kidnapping com_theft com_rape com_other2 ,  pa exposure(date) vce(robust)
	estimates store m6pa2

	
	
** Too few events in destroy_asset seize_other release_person

	
esttab m*pa2	
set more off		
estout m*pa2 using model_pa2.txt, ///
	cells(b(star fmt(%9.2f)) se(par)) starlevels(* 0.1 ** 0.05 *** 0.01) ///
	stats(N chi2 df_m) legend style(tab) replace	
			
		
	

	
	
	
	
	
	
	