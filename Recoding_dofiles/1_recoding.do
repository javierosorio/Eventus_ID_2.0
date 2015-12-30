**********************************************************************************************
**********************************************************************************************
** Dofile: recoding_DEMO_fv
** Author: Javier Osorio
**
** Project: Eventus ID 
** Date: April, 2013
**
**********************************************************************************************
**********************************************************************************************


****************************************************************************
****************************************************************************
**************
**************
************** RECODING 
**************
**************
****************************************************************************
****************************************************************************



****************************************************************************
****************************************************************************

gen v8b=""
order v1 v2 v3 v4 v5 v6 v7 v8 v8b

* 1. Label variables
	rename v1 date
	rename v2 paragraph
	rename v3 source
	rename v4 action
	rename v5 target
	rename v6 STATE
	rename v7 cve_ent1
	rename v8 cve_ent2
	rename v8b MUNICIPALITY
	rename v9  cve_mun1
	rename v10 cve_mun2 
	rename v11 cve_mun3
	rename v12 cve_mun4
	rename v13 cve_mun5
	rename v14 cve_mun6
	rename v15 cve_mun7

 
* 1.1 Additional variable clean up
		
	replace MUNICIPALITY=cve_ent1 if cve_ent1=="Mpos"
		replace cve_ent1="" if cve_ent1=="Mpos"
	replace MUNICIPALITY=cve_ent1 if cve_ent1=="Mpos_i"
		replace cve_ent1="" if cve_ent1=="Mpos_i"
	
	replace MUNICIPALITY=cve_ent2 if cve_ent2=="Mpos"
		replace cve_ent2="" if cve_ent2=="Mpos"
	replace MUNICIPALITY=cve_ent2 if cve_ent2=="Mpos_i"
		replace cve_ent2="" if cve_ent2=="Mpos_i"
 
	replace MUNICIPALITY=cve_mun1 if cve_mun1=="Mpos"
		replace cve_mun1="" if cve_mun1=="Mpos"
	replace MUNICIPALITY=cve_mun1 if cve_mun1=="Mpos_i"
		replace cve_mun1="" if cve_mun1=="Mpos_i" 
 
 
 


****************************************************************************
****************************************************************************
* 2. Destring
	destring target, replace
	destring cve_ent1, replace
 	destring cve_ent2, replace
	destring cve_mun1, replace

* 2.1 Additional variable clean up
	replace cve_mun1=cve_ent2 if cve_mun1==. & cve_ent2>=100
	replace cve_ent2=. if  cve_ent2>=100 & cve_mun1>=100


****************************************************************************
****************************************************************************
* 3. Generate date

tostring date, gen(date_str) format(%17.0g)
	
gen year = substr(date_str,1,4)
	destring  year, replace
gen month = substr(date_str,5,2)
	destring month, replace
gen day = substr(date_str,7,2)
	destring day, replace
drop date_str


****************************************************************************
****************************************************************************
* 4. Create document variable

split paragraph, p("_P")
	rename paragraph1 document
	rename paragraph2 P_local
		destring P_local, replace
	rename paragraph3 P_global
		destring P_global, replace



****************************************************************************
****************************************************************************
* 5. Generate categories

* 5.1 Source categories (basic version)
{
gen source_category = ""						
	replace source_category	="Army"	if source ==	10100
	replace source_category	="Army"	if source ==	10200
	replace source_category	="Assets"	if source ==	80100
	replace source_category	="Assets"	if source ==	80200
	replace source_category	="Assets"	if source ==	80201
	replace source_category	="Assets"	if source ==	80202
	replace source_category	="Assets"	if source ==	80300
	replace source_category	="Assets"	if source ==	80400
	replace source_category	="Assets"	if source ==	80500
	replace source_category	="Assets"	if source ==	80600
	replace source_category	="Communications"	if source ==	90100
	replace source_category	="Criminals"	if source ==	40100
	replace source_category	="Drugs"	if source ==	50100
	replace source_category	="Drugs"	if source ==	50200
	replace source_category	="Drugs"	if source ==	50300
	replace source_category	="Drugs"	if source ==	50400
	replace source_category	="Drugs"	if source ==	50501
	replace source_category	="Drugs"	if source ==	50502
	replace source_category	="Drugs"	if source ==	50502
	replace source_category	="Drugs"	if source ==	50503
	replace source_category	="Drugs"	if source ==	50503
	replace source_category	="Drugs"	if source ==	50600
	replace source_category	="Other"	if source ==	100100
	replace source_category	="Other"	if source ==	100200
	replace source_category	="Person"	if source ==	30101
	replace source_category	="Person"	if source ==	30102
	replace source_category	="Person"	if source ==	30103
	replace source_category	="Person"	if source ==	30104
	replace source_category	="Person"	if source ==	30105
	replace source_category	="Person"	if source ==	30201
	replace source_category	="Person"	if source ==	30202
	replace source_category	="Person"	if source ==	30203
	replace source_category	="Person"	if source ==	30204
	replace source_category	="Police"	if source ==	20100
	replace source_category	="Vehicles"	if source ==	70100
	replace source_category	="Vehicles"	if source ==	70200
	replace source_category	="Vehicles"	if source ==	70300
	replace source_category	="Vehicles"	if source ==	70400
	replace source_category	="Vehicles"	if source ==	70500
	replace source_category	="Vehicles"	if source ==	70600
	replace source_category	="Vehicles"	if source ==	70700
	replace source_category	="Weapons"	if source ==	60100
	replace source_category	="Weapons"	if source ==	60200
	replace source_category	="Weapons"	if source ==	60300
	replace source_category	="Weapons"	if source ==	60400
	replace source_category	="Weapons"	if source ==	60500
	replace source_category	="Weapons"	if source ==	60501
	replace source_category	="Weapons"	if source ==	60600
	replace source_category	="Weapons"	if source ==	60700
	replace source_category ="Communications"	if source ==	90100
	replace source_category ="Other"	if source ==	100100
	replace source_category ="Other"	if source ==	100200

}
	* End source categories

* 5.2 Action categories (basic version)
{
gen action_category = ""						
	replace action_category =	"Arrest"	if action ==	100
	replace action_category =	"Destroy"	if action ==	200
	replace action_category =	"Find"	if action ==	300
	replace action_category =	"Release"	if action ==	400
	replace action_category =	"Seize"	if action ==	500
}	
	* End action categories
	
	
* 5.3 Target categories (basic version)
{ 
gen target_category = ""						
	replace target_category = 	"Army"	if target ==	10100
	replace target_category = 	"Army"	if target ==	10200
	replace target_category = 	"Assets"	if target ==	80100
	replace target_category = 	"Assets"	if target ==	80200
	replace target_category = 	"Assets"	if target ==	80201
	replace target_category = 	"Assets"	if target ==	80202
	replace target_category = 	"Assets"	if target ==	80300
	replace target_category = 	"Assets"	if target ==	80400
	replace target_category = 	"Assets"	if target ==	80500
	replace target_category = 	"Assets"	if target ==	80600
	replace target_category = 	"Communications"	if target ==	90100
	replace target_category = 	"Criminals"	if target ==	40100
	replace target_category = 	"Drugs"	if target ==	50100
	replace target_category = 	"Drugs"	if target ==	50200
	replace target_category = 	"Drugs"	if target ==	50300
	replace target_category = 	"Drugs"	if target ==	50400
	replace target_category = 	"Drugs"	if target ==	50501
	replace target_category = 	"Drugs"	if target ==	50502
	replace target_category = 	"Drugs"	if target ==	50502
	replace target_category = 	"Drugs"	if target ==	50503
	replace target_category = 	"Drugs"	if target ==	50503
	replace target_category = 	"Drugs"	if target ==	50600
	replace target_category = 	"Other"	if target ==	100100
	replace target_category = 	"Other"	if target ==	100200
	replace target_category = 	"Person"	if target ==	30101
	replace target_category = 	"Person"	if target ==	30102
	replace target_category = 	"Person"	if target ==	30103
	replace target_category = 	"Person"	if target ==	30104
	replace target_category = 	"Person"	if target ==	30105
	replace target_category = 	"Person"	if target ==	30201
	replace target_category = 	"Person"	if target ==	30202
	replace target_category = 	"Person"	if target ==	30203
	replace target_category = 	"Person"	if target ==	30204
	replace target_category = 	"Police"	if target ==	20100
	replace target_category = 	"Vehicles"	if target ==	70100
	replace target_category = 	"Vehicles"	if target ==	70200
	replace target_category = 	"Vehicles"	if target ==	70300
	replace target_category = 	"Vehicles"	if target ==	70400
	replace target_category = 	"Vehicles"	if target ==	70500
	replace target_category = 	"Vehicles"	if target ==	70600
	replace target_category = 	"Vehicles"	if target ==	70700
	replace target_category = 	"Weapons"	if target ==	60100
	replace target_category = 	"Weapons"	if target ==	60200
	replace target_category = 	"Weapons"	if target ==	60300
	replace target_category = 	"Weapons"	if target ==	60400
	replace target_category = 	"Weapons"	if target ==	60500
	replace target_category = 	"Weapons"	if target ==	60501
	replace target_category = 	"Weapons"	if target ==	60600
	replace target_category = 	"Weapons"	if target ==	60700
	replace target_category = 	"Communications"	if source ==	90100
	replace target_category = 	"Other"	if source ==	100100
	replace target_category = 	"Other"	if source ==	100200

}
	* End target categories



****************************************************************************
****************************************************************************
* 6. Preliminary order variables

order date year month day document paragraph source_category action_category target_category



****************************************************************************
****************************************************************************
* 7. Recode seizure of assets, drugs, vehicles and weapons

**************************************
* 7.1. Recode target with source ONLY for data on assets, drugs, vehicles and weapons
replace target=source if target ==. & source_category == "Assets"
	replace source=. if target ==source & source_category == "Assets"
	
replace target=source if target ==. & source_category == "Drugs"
	replace source=. if target ==source & source_category == "Drugs"
	
replace target=source if target ==. & source_category == "Vehicles"
	replace source=. if target ==source & source_category == "Vehicles"
	
replace target=source if target ==. & source_category == "Weapons"
	replace source=. if target ==source & source_category == "Weapons"
	
replace target=source if target ==. & source_category == "Communications"
	replace source=. if target ==source & source_category == "Communications"

replace target=source if target ==. & source_category == "Other"
	replace source=. if target ==source & source_category == "Other"	

	
	
**************************************
* 7.2. Drop categories and re-generate them
drop source_category target_category

	* 7.2.1 Source categories (minor modification towards the end)
	{
gen source_category = ""						
	replace source_category	="Army"	if source ==	10100
	replace source_category	="Army"	if source ==	10200
	replace source_category	="Assets"	if source ==	80100
	replace source_category	="Assets"	if source ==	80200
	replace source_category	="Assets"	if source ==	80201
	replace source_category	="Assets"	if source ==	80202
	replace source_category	="Assets"	if source ==	80300
	replace source_category	="Assets"	if source ==	80400
	replace source_category	="Assets"	if source ==	80500
	replace source_category	="Assets"	if source ==	80600
	replace source_category	="Communications"	if source ==	90100
	replace source_category	="Criminals"	if source ==	40100
	replace source_category	="Drugs"	if source ==	50100
	replace source_category	="Drugs"	if source ==	50200
	replace source_category	="Drugs"	if source ==	50300
	replace source_category	="Drugs"	if source ==	50400
	replace source_category	="Drugs"	if source ==	50501
	replace source_category	="Drugs"	if source ==	50502
	replace source_category	="Drugs"	if source ==	50502
	replace source_category	="Drugs"	if source ==	50503
	replace source_category	="Drugs"	if source ==	50503
	replace source_category	="Drugs"	if source ==	50600
	replace source_category	="Other"	if source ==	100100
	replace source_category	="Other"	if source ==	100200
	replace source_category	="Person"	if source ==	30101
	replace source_category	="Person"	if source ==	30102
	replace source_category	="Person"	if source ==	30103
	replace source_category	="Person"	if source ==	30104
	replace source_category	="Person"	if source ==	30105
	replace source_category	="Person"	if source ==	30201
	replace source_category	="Person"	if source ==	30202
	replace source_category	="Person"	if source ==	30203
	replace source_category	="Person"	if source ==	30204
	replace source_category	="Police"	if source ==	20100
	replace source_category	="Vehicles"	if source ==	70100
	replace source_category	="Vehicles"	if source ==	70200
	replace source_category	="Vehicles"	if source ==	70300
	replace source_category	="Vehicles"	if source ==	70400
	replace source_category	="Vehicles"	if source ==	70500
	replace source_category	="Vehicles"	if source ==	70600
	replace source_category	="Vehicles"	if source ==	70700
	replace source_category	="Weapons"	if source ==	60100
	replace source_category	="Weapons"	if source ==	60200
	replace source_category	="Weapons"	if source ==	60300
	replace source_category	="Weapons"	if source ==	60400
	replace source_category	="Weapons"	if source ==	60500
	replace source_category	="Weapons"	if source ==	60501
	replace source_category	="Weapons"	if source ==	60600
	replace source_category	="Weapons"	if source ==	60700
	replace source_category ="Communications"	if source ==	90100
	replace source_category ="Other"	if source ==	100100
	replace source_category ="Other"	if source ==	100200

}
		* End source categories
	
	* 7.2.2 Target categories (minor modification towards the end)
	{
gen target_category = ""						
	replace target_category = 	"Army"	if target ==	10100
	replace target_category = 	"Army"	if target ==	10200
	replace target_category = 	"Assets"	if target ==	80100
	replace target_category = 	"Assets"	if target ==	80200
	replace target_category = 	"Assets"	if target ==	80201
	replace target_category = 	"Assets"	if target ==	80202
	replace target_category = 	"Assets"	if target ==	80300
	replace target_category = 	"Assets"	if target ==	80400
	replace target_category = 	"Assets"	if target ==	80500
	replace target_category = 	"Assets"	if target ==	80600
	replace target_category = 	"Communications"	if target ==	90100
	replace target_category = 	"Criminals"	if target ==	40100
	replace target_category = 	"Drugs"	if target ==	50100
	replace target_category = 	"Drugs"	if target ==	50200
	replace target_category = 	"Drugs"	if target ==	50300
	replace target_category = 	"Drugs"	if target ==	50400
	replace target_category = 	"Drugs"	if target ==	50501
	replace target_category = 	"Drugs"	if target ==	50502
	replace target_category = 	"Drugs"	if target ==	50502
	replace target_category = 	"Drugs"	if target ==	50503
	replace target_category = 	"Drugs"	if target ==	50503
	replace target_category = 	"Drugs"	if target ==	50600
	replace target_category = 	"Other"	if target ==	100100
	replace target_category = 	"Other"	if target ==	100200
	replace target_category = 	"Person"	if target ==	30101
	replace target_category = 	"Person"	if target ==	30102
	replace target_category = 	"Person"	if target ==	30103
	replace target_category = 	"Person"	if target ==	30104
	replace target_category = 	"Person"	if target ==	30105
	replace target_category = 	"Person"	if target ==	30201
	replace target_category = 	"Person"	if target ==	30202
	replace target_category = 	"Person"	if target ==	30203
	replace target_category = 	"Person"	if target ==	30204
	replace target_category = 	"Police"	if target ==	20100
	replace target_category = 	"Vehicles"	if target ==	70100
	replace target_category = 	"Vehicles"	if target ==	70200
	replace target_category = 	"Vehicles"	if target ==	70300
	replace target_category = 	"Vehicles"	if target ==	70400
	replace target_category = 	"Vehicles"	if target ==	70500
	replace target_category = 	"Vehicles"	if target ==	70600
	replace target_category = 	"Vehicles"	if target ==	70700
	replace target_category = 	"Weapons"	if target ==	60100
	replace target_category = 	"Weapons"	if target ==	60200
	replace target_category = 	"Weapons"	if target ==	60300
	replace target_category = 	"Weapons"	if target ==	60400
	replace target_category = 	"Weapons"	if target ==	60500
	replace target_category = 	"Weapons"	if target ==	60501
	replace target_category = 	"Weapons"	if target ==	60600
	replace target_category = 	"Weapons"	if target ==	60700
	replace target_category = 	"Communications"	if source ==	90100
	replace target_category = 	"Other"	if source ==	100100
	replace target_category = 	"Other"	if source ==	100200

}
		* End target categories

	* 7.2.3 Order
	order date year month day document paragraph source_category action_category target_category

	

**************************************
* 7.3. Impute action and source for assets, drugs, vehicles and weapons

	* 7.3.1. Generate variable for actions with no source not target
	gen only_action = 0
		replace only_action = 1 if source==. & action~=. & target==.
	
	* 7.3.2. Generate variable ADVWCO for assets, drugs, vehicles and weapons
	gen ADVWCO=0
		replace ADVWCO=1 if target_category=="Assets"
		replace ADVWCO=1 if target_category=="Drugs" 
		replace ADVWCO=1 if target_category=="Vehicles"
		replace ADVWCO=1 if target_category=="Weapons" 
		replace ADVWCO=1 if target_category=="Communications"
		replace ADVWCO=1 if target_category=="Other" 
	replace action=99500 if ADVWCO==1 & (source==. & action==.) & target~=. 

	* 7.3.3. Sort by 1 and 2, then impute source
		 * This identifies and imputes the source mentioned in the previous line
	gsort +only_action +documen +action		
		bysort only_action document : replace source=source[_n-1] if source==. & (source[_n-1]==10100 | source[_n-1]==10200 | source[_n-1]==20100) & ADVWCO==1 & action==100 /*Impute actor for arrests*/
		bysort only_action document : replace source=source[_n-1] if source==. & (source[_n-1]==10100 | source[_n-1]==10200 | source[_n-1]==20100) & ADVWCO==1 & action==200 /*Impute actor for destroy*/
		bysort only_action document : replace source=source[_n-1] if source==. & (source[_n-1]==10100 | source[_n-1]==10200 | source[_n-1]==20100) & ADVWCO==1 & action==300 /*Impute actor for find*/
		bysort only_action document : replace source=source[_n-1] if source==. & (source[_n-1]==10100 | source[_n-1]==10200 | source[_n-1]==20100) & ADVWCO==1 & action==400 /*Impute actor for release*/
		bysort only_action document : replace source=source[_n-1] if source==. & (source[_n-1]==10100 | source[_n-1]==10200 | source[_n-1]==20100) & ADVWCO==1 & action==500 /*Impute actor for seize*/
		bysort only_action document : replace source=source[_n-1] if source==. & (source[_n-1]==10100 | source[_n-1]==10200 | source[_n-1]==20100) & ADVWCO==1 & action==99500 /*Impute actor for imputed seizures*/
	
	* 7.3.4. Reverse the order of actions per paragraph and impute the source
	gsort +only_action +document -action		
		bysort only_action document : replace source=source[_n-1] if source==. & (source[_n-1]==10100 | source[_n-1]==10200 | source[_n-1]==20100) & ADVWCO==1 & action==99500 /*Impute actor for imputed seizures*/
		bysort only_action document : replace source=source[_n-1] if source==. & (source[_n-1]==10100 | source[_n-1]==10200 | source[_n-1]==20100) & ADVWCO==1 & action==500 /*Impute actor for seize*/
		bysort only_action document : replace source=source[_n-1] if source==. & (source[_n-1]==10100 | source[_n-1]==10200 | source[_n-1]==20100) & ADVWCO==1 & action==400 /*Impute actor for release*/
		bysort only_action document : replace source=source[_n-1] if source==. & (source[_n-1]==10100 | source[_n-1]==10200 | source[_n-1]==20100) & ADVWCO==1 & action==300 /*Impute actor for find*/
		bysort only_action document : replace source=source[_n-1] if source==. & (source[_n-1]==10100 | source[_n-1]==10200 | source[_n-1]==20100) & ADVWCO==1 & action==200 /*Impute actor for destroy*/
		bysort only_action document : replace source=source[_n-1] if source==. & (source[_n-1]==10100 | source[_n-1]==10200 | source[_n-1]==20100) & ADVWCO==1 & action==100 /*Impute actor for arrests*/
		
	
**************************************
* 7.4. Drop categories and re-generate them
drop source_category action_category target_category

	* 7.4.1 Source categories
	{
gen source_category = ""						
	replace source_category	="Army"	if source ==	10100
	replace source_category	="Army"	if source ==	10200
	replace source_category	="Assets"	if source ==	80100
	replace source_category	="Assets"	if source ==	80200
	replace source_category	="Assets"	if source ==	80201
	replace source_category	="Assets"	if source ==	80202
	replace source_category	="Assets"	if source ==	80300
	replace source_category	="Assets"	if source ==	80400
	replace source_category	="Assets"	if source ==	80500
	replace source_category	="Assets"	if source ==	80600
	replace source_category	="Communications"	if source ==	90100
	replace source_category	="Criminals"	if source ==	40100
	replace source_category	="Drugs"	if source ==	50100
	replace source_category	="Drugs"	if source ==	50200
	replace source_category	="Drugs"	if source ==	50300
	replace source_category	="Drugs"	if source ==	50400
	replace source_category	="Drugs"	if source ==	50501
	replace source_category	="Drugs"	if source ==	50502
	replace source_category	="Drugs"	if source ==	50502
	replace source_category	="Drugs"	if source ==	50503
	replace source_category	="Drugs"	if source ==	50503
	replace source_category	="Drugs"	if source ==	50600
	replace source_category	="Other"	if source ==	100100
	replace source_category	="Other"	if source ==	100200
	replace source_category	="Person"	if source ==	30101
	replace source_category	="Person"	if source ==	30102
	replace source_category	="Person"	if source ==	30103
	replace source_category	="Person"	if source ==	30104
	replace source_category	="Person"	if source ==	30105
	replace source_category	="Person"	if source ==	30201
	replace source_category	="Person"	if source ==	30202
	replace source_category	="Person"	if source ==	30203
	replace source_category	="Person"	if source ==	30204
	replace source_category	="Police"	if source ==	20100
	replace source_category	="Vehicles"	if source ==	70100
	replace source_category	="Vehicles"	if source ==	70200
	replace source_category	="Vehicles"	if source ==	70300
	replace source_category	="Vehicles"	if source ==	70400
	replace source_category	="Vehicles"	if source ==	70500
	replace source_category	="Vehicles"	if source ==	70600
	replace source_category	="Vehicles"	if source ==	70700
	replace source_category	="Weapons"	if source ==	60100
	replace source_category	="Weapons"	if source ==	60200
	replace source_category	="Weapons"	if source ==	60300
	replace source_category	="Weapons"	if source ==	60400
	replace source_category	="Weapons"	if source ==	60500
	replace source_category	="Weapons"	if source ==	60501
	replace source_category	="Weapons"	if source ==	60600
	replace source_category	="Weapons"	if source ==	60700
	replace source_category ="Communications"	if source ==	90100
	replace source_category ="Other"	if source ==	100100
	replace source_category ="Other"	if source ==	100200

}
		* End source categories
	
	* 7.4.2 Target categories
	{
gen target_category = ""						
	replace target_category = 	"Army"	if target ==	10100
	replace target_category = 	"Army"	if target ==	10200
	replace target_category = 	"Assets"	if target ==	80100
	replace target_category = 	"Assets"	if target ==	80200
	replace target_category = 	"Assets"	if target ==	80201
	replace target_category = 	"Assets"	if target ==	80202
	replace target_category = 	"Assets"	if target ==	80300
	replace target_category = 	"Assets"	if target ==	80400
	replace target_category = 	"Assets"	if target ==	80500
	replace target_category = 	"Assets"	if target ==	80600
	replace target_category = 	"Communications"	if target ==	90100
	replace target_category = 	"Criminals"	if target ==	40100
	replace target_category = 	"Drugs"	if target ==	50100
	replace target_category = 	"Drugs"	if target ==	50200
	replace target_category = 	"Drugs"	if target ==	50300
	replace target_category = 	"Drugs"	if target ==	50400
	replace target_category = 	"Drugs"	if target ==	50501
	replace target_category = 	"Drugs"	if target ==	50502
	replace target_category = 	"Drugs"	if target ==	50502
	replace target_category = 	"Drugs"	if target ==	50503
	replace target_category = 	"Drugs"	if target ==	50503
	replace target_category = 	"Drugs"	if target ==	50600
	replace target_category = 	"Other"	if target ==	100100
	replace target_category = 	"Other"	if target ==	100200
	replace target_category = 	"Person"	if target ==	30101
	replace target_category = 	"Person"	if target ==	30102
	replace target_category = 	"Person"	if target ==	30103
	replace target_category = 	"Person"	if target ==	30104
	replace target_category = 	"Person"	if target ==	30105
	replace target_category = 	"Person"	if target ==	30201
	replace target_category = 	"Person"	if target ==	30202
	replace target_category = 	"Person"	if target ==	30203
	replace target_category = 	"Person"	if target ==	30204
	replace target_category = 	"Police"	if target ==	20100
	replace target_category = 	"Vehicles"	if target ==	70100
	replace target_category = 	"Vehicles"	if target ==	70200
	replace target_category = 	"Vehicles"	if target ==	70300
	replace target_category = 	"Vehicles"	if target ==	70400
	replace target_category = 	"Vehicles"	if target ==	70500
	replace target_category = 	"Vehicles"	if target ==	70600
	replace target_category = 	"Vehicles"	if target ==	70700
	replace target_category = 	"Weapons"	if target ==	60100
	replace target_category = 	"Weapons"	if target ==	60200
	replace target_category = 	"Weapons"	if target ==	60300
	replace target_category = 	"Weapons"	if target ==	60400
	replace target_category = 	"Weapons"	if target ==	60500
	replace target_category = 	"Weapons"	if target ==	60501
	replace target_category = 	"Weapons"	if target ==	60600
	replace target_category = 	"Weapons"	if target ==	60700
	replace target_category = 	"Communications"	if source ==	90100
	replace target_category = 	"Other"	if source ==	100100
	replace target_category = 	"Other"	if source ==	100200

}
		* End target categories

	* 7.4.3 Recode action categories 
	
		* Recode FIND -> SEIZE only for DRUGS
			replace action=500 if action==300 & target_category=="Drugs" 
		* Recode action category (modified version)
			{
				gen action_category = ""						
					replace action_category =	"Arrest"	if action ==	100
					replace action_category =	"Destroy"	if action ==	200
					replace action_category =	"Find"	if action ==	300
					replace action_category =	"Release"	if action ==	400
					replace action_category =	"Seize"	if action ==	500
					replace action_category = 	"Seizure"	if action ==	99500
				}	
					* End action categories
		
			
			
**************************************
* 7.5. Order varialbes
	order date year month day document paragraph source_category action_category target_category

	
	
	
**************************************
* 7.6. Impute source when other information is not available
	* Imputed value 99999 corresponds to "State generic"
	replace source=99999 if source ==. & action~=. & target~=. 		
		

**************************************
* 7.7. Drop categories and re-generate them
	drop source_category 

	* 7.7.1 Source categories
	{
gen source_category = ""						
	replace source_category	="Army"	if source ==	10100
	replace source_category	="Army"	if source ==	10200
	replace source_category	="Assets"	if source ==	80100
	replace source_category	="Assets"	if source ==	80200
	replace source_category	="Assets"	if source ==	80201
	replace source_category	="Assets"	if source ==	80202
	replace source_category	="Assets"	if source ==	80300
	replace source_category	="Assets"	if source ==	80400
	replace source_category	="Assets"	if source ==	80500
	replace source_category	="Assets"	if source ==	80600
	replace source_category	="Communications"	if source ==	90100
	replace source_category	="Criminals"	if source ==	40100
	replace source_category	="Drugs"	if source ==	50100
	replace source_category	="Drugs"	if source ==	50200
	replace source_category	="Drugs"	if source ==	50300
	replace source_category	="Drugs"	if source ==	50400
	replace source_category	="Drugs"	if source ==	50501
	replace source_category	="Drugs"	if source ==	50502
	replace source_category	="Drugs"	if source ==	50502
	replace source_category	="Drugs"	if source ==	50503
	replace source_category	="Drugs"	if source ==	50503
	replace source_category	="Drugs"	if source ==	50600
	replace source_category	="Other"	if source ==	100100
	replace source_category	="Other"	if source ==	100200
	replace source_category	="Person"	if source ==	30101
	replace source_category	="Person"	if source ==	30102
	replace source_category	="Person"	if source ==	30103
	replace source_category	="Person"	if source ==	30104
	replace source_category	="Person"	if source ==	30105
	replace source_category	="Person"	if source ==	30201
	replace source_category	="Person"	if source ==	30202
	replace source_category	="Person"	if source ==	30203
	replace source_category	="Person"	if source ==	30204
	replace source_category	="Police"	if source ==	20100
	replace source_category	="Vehicles"	if source ==	70100
	replace source_category	="Vehicles"	if source ==	70200
	replace source_category	="Vehicles"	if source ==	70300
	replace source_category	="Vehicles"	if source ==	70400
	replace source_category	="Vehicles"	if source ==	70500
	replace source_category	="Vehicles"	if source ==	70600
	replace source_category	="Vehicles"	if source ==	70700
	replace source_category	="Weapons"	if source ==	60100
	replace source_category	="Weapons"	if source ==	60200
	replace source_category	="Weapons"	if source ==	60300
	replace source_category	="Weapons"	if source ==	60400
	replace source_category	="Weapons"	if source ==	60500
	replace source_category	="Weapons"	if source ==	60501
	replace source_category	="Weapons"	if source ==	60600
	replace source_category	="Weapons"	if source ==	60700
	replace source_category ="Communications"	if source ==	90100
	replace source_category ="Other"	if source ==	100100
	replace source_category ="Other"	if source ==	100200
	replace source_category	="State imputed"	if source ==	99999

}
		* End source categories
	


****************************************************************************
****************************************************************************
* NOW RECODE SPECIAL CASES
	
	
	
	
	
















