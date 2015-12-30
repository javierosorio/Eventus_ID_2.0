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
************** DISAGGREGATE LOCATIONS
**************
**************
****************************************************************************
****************************************************************************


/*
ATTENTION:

	Identify the minimum and maximum number
	of state (cve_ent#) and municipality (cve_mun#) variables

	In this case
		cve_ent: min=1 max=2
		cve_mun: min=1 max=7
*/


	tempfile data_original
	save `data_original', replace
	
	
****************************************************************************
****************************************************************************	
* APPEND DATA BY MUNICIPALITY 

	* Generate data for missing muns
		use `data_original'	
		forvalues i=1/7 {
			{
			keep if cve_mun`i'==. 	
			}
			* End procedure	
			}
			* End forvalues
		tempfile data_mun0
		save `data_mun0', replace	

		
	* Generate data for muns
		forvalues i=1/7 {
			{
			clear
			use `data_original'		
			keep if cve_mun`i'~=. 	
			replace cve_mun1=cve_mun`i'
			tempfile data_mun`i'
			save `data_mun`i'', replace
			}
			* End procedure	
			}
			* End forvalues

		
	* Append databases
		use `data_mun0'
		forvalues i=1/7 {
				{
				append using `data_mun`i''
				}
				* End procedure	
				}
				* End forvalues
	
	
	* Clean and save database	
		drop cve_mun2-cve_mun7
		tempfile data_appended_mun
		save `data_appended_mun', replace
		*save "data_appended_mun", replace
	

	
	
****************************************************************************
****************************************************************************	
* APPEND DATA BY STATE and MUNICIPALITY 	
	
	
	* Generate data for missing state
		use `data_appended_mun'	
		forvalues x=1/2 {
			{
			keep if cve_ent`x'==. 	
			}
			* End procedure	
			}
			* End forvalues
		tempfile data_ent0
		save `data_ent0', replace
	
	
	* Generate data for states
		forvalues i=1/2 {
			{
			clear
			use `data_appended_mun'		
			keep if cve_ent`i'~=. 	
			replace cve_ent1=cve_ent`i'
			tempfile data_ent`i'
			save `data_ent`i'', replace
			}
			* End procedure
			}
			* End forvalues
	
	
	* Append databases
		use `data_ent0'
		forvalues i=1/2 {
				{
				append using `data_ent`i''
				}
				* End procedure	
				}
				* End forvalues	
	
	
	* Clean and save database	
		drop cve_ent2
		tempfile data_appended_mun
		save `data_appended_ent_mun', replace
		*save "data_appended_ent_mun", replace
		
	
	
	