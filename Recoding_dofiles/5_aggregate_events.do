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
************** AGGREGATE FULL EVENTS BY MUNICIPALITY DAY
**************
**************
****************************************************************************
****************************************************************************


****************************************************************************
****************************************************************************
* 1. Generate variable for incomplete events 
	gen incomplete=1 if source==. | action==. | target==.


****************************************************************************
****************************************************************************
* 2. Generate fully geo-coded event variable 
	gen geo_event=1  if any_match==1 & incomplete==.

	
****************************************************************************
****************************************************************************	
* 3. Identify duplicates
	sort document date cve_ent1 cve_mun1 source action target
	by document date cve_ent1 cve_mun1 source action target: gen duplicates2=cond(_N==1,0,_n) 
		** Note: Stata interprets _N to mean the total number of observations in the by-group and _n to be the observation number within the by-group.

	/*
	** One way of generating the final database is by directly eliminating duplicates. Steps 4-6 are another way of doing it.
		drop if duplicates>1
		drop if geo_event~=1
		save "no_duplicates", replace
	*/
	
****************************************************************************
****************************************************************************	
* 4. Collapse by day and matched municipality	
	gen event_count=1

	collapse (count) event_count  (mean)  year month day   if geo_event==1, by(document date cve_ent1 cve_mun1 source action target)  
	

	
****************************************************************************
****************************************************************************	
* 5. Generate subcategories again	
	
	* 5.1 Source subcategories
	{
gen source_subcat = ""						
	replace source_subcat	="Army"	if source ==	10100
	replace source_subcat	="Army"	if source ==	10200
	replace source_subcat	="Assets"	if source ==	80100
	replace source_subcat	="Assets"	if source ==	80200
	replace source_subcat	="Assets"	if source ==	80201
	replace source_subcat	="Assets"	if source ==	80202
	replace source_subcat	="Assets"	if source ==	80300
	replace source_subcat	="Assets"	if source ==	80400
	replace source_subcat	="Assets"	if source ==	80500
	replace source_subcat	="Assets"	if source ==	80600
	replace source_subcat	="Communications"	if source ==	90100
	replace source_subcat	="Criminals"	if source ==	40100
	replace source_subcat	="Drugs"	if source ==	50100
	replace source_subcat	="Drugs"	if source ==	50200
	replace source_subcat	="Drugs"	if source ==	50300
	replace source_subcat	="Drugs"	if source ==	50400
	replace source_subcat	="Drugs"	if source ==	50501
	replace source_subcat	="Drugs"	if source ==	50502
	replace source_subcat	="Drugs"	if source ==	50502
	replace source_subcat	="Drugs"	if source ==	50503
	replace source_subcat	="Drugs"	if source ==	50503
	replace source_subcat	="Drugs"	if source ==	50600
	replace source_subcat	="Other"	if source ==	100100
	replace source_subcat	="Other"	if source ==	100200
	replace source_subcat	="Person"	if source ==	30101
	replace source_subcat	="Person"	if source ==	30102
	replace source_subcat	="Person"	if source ==	30103
	replace source_subcat	="Person"	if source ==	30104
	replace source_subcat	="Person"	if source ==	30105
	replace source_subcat	="Person"	if source ==	30201
	replace source_subcat	="Person"	if source ==	30202
	replace source_subcat	="Person"	if source ==	30203
	replace source_subcat	="Person"	if source ==	30204
	replace source_subcat	="Police"	if source ==	20100
	replace source_subcat	="Vehicles"	if source ==	70100
	replace source_subcat	="Vehicles"	if source ==	70200
	replace source_subcat	="Vehicles"	if source ==	70300
	replace source_subcat	="Vehicles"	if source ==	70400
	replace source_subcat	="Vehicles"	if source ==	70500
	replace source_subcat	="Vehicles"	if source ==	70600
	replace source_subcat	="Vehicles"	if source ==	70700
	replace source_subcat	="Weapons"	if source ==	60100
	replace source_subcat	="Weapons"	if source ==	60200
	replace source_subcat	="Weapons"	if source ==	60300
	replace source_subcat	="Weapons"	if source ==	60400
	replace source_subcat	="Weapons"	if source ==	60500
	replace source_subcat	="Weapons"	if source ==	60501
	replace source_subcat	="Weapons"	if source ==	60600
	replace source_subcat	="Weapons"	if source ==	60700
	replace source_subcat ="Communications"	if source ==	90100
	replace source_subcat ="Other"	if source ==	100100
	replace source_subcat ="Other"	if source ==	100200
	replace source_subcat	="State imputed"	if source ==	99999

}
		* End source subcategories

		
	* 5.2 Action subcategories (basic version)
{
gen action_subcat = ""						
	replace action_subcat =	"Arrest"	if action ==	100
	replace action_subcat =	"Destroy"	if action ==	200
	replace action_subcat =	"Find"	if action ==	300
	replace action_subcat =	"Release"	if action ==	400
	replace action_subcat =	"Seize"	if action ==	500
	replace action_subcat =	"Seize imputed"	if action ==	99500
}	
		* End action categories
			

	* 5.3 Target subcategories
	{
gen target_subcat = ""						
	replace target_subcat = 	"Army"	if target ==	10100
	replace target_subcat = 	"Army"	if target ==	10200
	replace target_subcat = 	"Assets"	if target ==	80100
	replace target_subcat = 	"Assets"	if target ==	80200
	replace target_subcat = 	"Assets"	if target ==	80201
	replace target_subcat = 	"Assets"	if target ==	80202
	replace target_subcat = 	"Assets"	if target ==	80300
	replace target_subcat = 	"Assets"	if target ==	80400
	replace target_subcat = 	"Assets"	if target ==	80500
	replace target_subcat = 	"Assets"	if target ==	80600
	replace target_subcat = 	"Communications"	if target ==	90100
	replace target_subcat = 	"Criminals"	if target ==	40100
	replace target_subcat = 	"Drugs"	if target ==	50100
	replace target_subcat = 	"Drugs"	if target ==	50200
	replace target_subcat = 	"Drugs"	if target ==	50300
	replace target_subcat = 	"Drugs"	if target ==	50400
	replace target_subcat = 	"Drugs"	if target ==	50501
	replace target_subcat = 	"Drugs"	if target ==	50502
	replace target_subcat = 	"Drugs"	if target ==	50502
	replace target_subcat = 	"Drugs"	if target ==	50503
	replace target_subcat = 	"Drugs"	if target ==	50503
	replace target_subcat = 	"Drugs"	if target ==	50600
	replace target_subcat = 	"Other"	if target ==	100100
	replace target_subcat = 	"Other"	if target ==	100200
	replace target_subcat = 	"Person"	if target ==	30101
	replace target_subcat = 	"Person"	if target ==	30102
	replace target_subcat = 	"Person"	if target ==	30103
	replace target_subcat = 	"Person"	if target ==	30104
	replace target_subcat = 	"Person"	if target ==	30105
	replace target_subcat = 	"Person"	if target ==	30201
	replace target_subcat = 	"Person"	if target ==	30202
	replace target_subcat = 	"Person"	if target ==	30203
	replace target_subcat = 	"Person"	if target ==	30204
	replace target_subcat = 	"Police"	if target ==	20100
	replace target_subcat = 	"Vehicles"	if target ==	70100
	replace target_subcat = 	"Vehicles"	if target ==	70200
	replace target_subcat = 	"Vehicles"	if target ==	70300
	replace target_subcat = 	"Vehicles"	if target ==	70400
	replace target_subcat = 	"Vehicles"	if target ==	70500
	replace target_subcat = 	"Vehicles"	if target ==	70600
	replace target_subcat = 	"Vehicles"	if target ==	70700
	replace target_subcat = 	"Weapons"	if target ==	60100
	replace target_subcat = 	"Weapons"	if target ==	60200
	replace target_subcat = 	"Weapons"	if target ==	60300
	replace target_subcat = 	"Weapons"	if target ==	60400
	replace target_subcat = 	"Weapons"	if target ==	60500
	replace target_subcat = 	"Weapons"	if target ==	60501
	replace target_subcat = 	"Weapons"	if target ==	60600
	replace target_subcat = 	"Weapons"	if target ==	60700
	replace target_subcat = 	"Communications"	if source ==	90100
	replace target_subcat = 	"Other"	if source ==	100100
	replace target_subcat = 	"Other"	if source ==	100200

}
		* End target subcategories
		
	
	
	
	
	
****************************************************************************
****************************************************************************	
* 6. Generate main categories 	
	
	* 6.1 Source main categorie
	{
gen source_maincat = ""						
	replace source_maincat	="Government authorities"	if source_subcat ==	"Army"
	replace source_maincat	="Government authorities"	if source_subcat ==	"State imputed"
	replace source_maincat	="Government authorities"	if source_subcat ==	"Police"	
	replace source_maincat	="Assets"	if source_subcat ==	"Assets"
	replace source_maincat	="Assets"	if source_subcat ==	"Communications"
	replace source_maincat	="Assets"	if source_subcat ==	"Vehicles"
	replace source_maincat	="Criminals"	if source_subcat ==	"Criminals"
	replace source_maincat	="Drugs"	if source_subcat ==	"Drugs"	
	replace source_maincat	="Other"	if source_subcat ==	"Other"	
	replace source_maincat	="Person"	if source_subcat ==	"Person"
	replace source_maincat	="Weapons"	if source_subcat ==	"Weapons"
}
		* End source main categorie

		
	* 6.2 Action main categorie
{
gen action_maincat = ""						
	replace action_maincat =	"Arrest"	if action_subcat ==	"Arrest"
	replace action_maincat =	"Destroy"	if action_subcat ==	"Destroy"
	replace action_maincat =	"Seize"	if action_subcat ==	"Seize"
	replace action_maincat =	"Seize"	if action_subcat ==	"Find"	
	replace action_maincat =	"Seize"	if action_subcat ==	"Seize imputed"
	replace action_maincat =	"Release"	if action_subcat ==	"Release"
}	
		* End action main categorie
			

	* 6.3 Target main categorie
	{
gen target_maincat = ""						
	replace target_maincat ="Army"	if target_subcat ==	""
	replace target_maincat	="Government authorities"	if target_subcat ==	"Army"
	replace target_maincat	="Government authorities"	if target_subcat ==	"State imputed"
	replace target_maincat	="Government authorities"	if target_subcat ==	"Police"	
	replace target_maincat	="Assets"	if target_subcat ==	"Assets"
	replace target_maincat	="Assets"	if target_subcat ==	"Communications"
	replace target_maincat	="Assets"	if target_subcat ==	"Vehicles"
	replace target_maincat	="Criminals"	if target_subcat ==	"Criminals"
	replace target_maincat	="Drugs"	if target_subcat ==	"Drugs"	
	replace target_maincat	="Other"	if target_subcat ==	"Other"	
	replace target_maincat	="Person"	if target_subcat ==	"Person"
	replace target_maincat	="Weapons"	if target_subcat ==	"Weapons"
	
}
		* End target main categorie
				
		
****************************************************************************
****************************************************************************
* 7. Save aggregated geo-coded event database
	* MD accounts for Municipality-Day unit of analysis

	order date year month day document source_maincat action_maincat target_maincat source_subcat action_subcat target_subcat  source action target  cve_ent1 cve_mun1 event_count
	
	save "data_events_MD", replace

	 
	
	









