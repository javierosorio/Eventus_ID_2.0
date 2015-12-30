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
************** FILL IN LOCATIONS
**************
**************
****************************************************************************
****************************************************************************




****************************************************************************
****************************************************************************
* Generate match state and municipal

	gen mun_temp = cve_mun1+100000						/*create a var with preceding zeros*/
		tostring mun_temp, gen(mun_temp_str)				/*make it a string var*/
		gen munstate_temp_str =substr(mun_temp_str, -5, 2) 	/*keep only the state identifier*/
		destring munstate_temp_str,replace					/*destring the state var*/
	
			* Impute state when the state and municipality have the same name		
				replace cve_ent1=munstate_temp_str if cve_ent1==. & cve_mun1==8019 		/* Chihuahua, Chih.	*/
				replace cve_ent1=munstate_temp_str if cve_ent1==. & cve_mun1==10005		/* Durango, Dgo. 	*/
				replace cve_ent1=munstate_temp_str if cve_ent1==. & cve_mun1==20067		/* Oaxaca, Oax. 	*/
				replace cve_ent1=munstate_temp_str if cve_ent1==. & cve_mun1==21114		/* Puebla, Pue.		*/
				replace cve_ent1=munstate_temp_str if cve_ent1==. & cve_mun1==29033		/* Tlaxcala, Tlax.	*/
				replace cve_ent1=munstate_temp_str if cve_ent1==. & cve_mun1==32056		/* Zacatecas, Zac.	*/
		
	gen match_state_mun=1 if cve_ent1==munstate_temp_str & cve_ent1~=.		/*Match mun and state*/
		
	drop mun_temp mun_temp_str  		/*drop irrelevant varialbes*/

	

		
				
		
****************************************************************************
****************************************************************************
* Discard location

	gen discard_loc=.
		replace discard_loc=1 if match_state_mun==. & cve_ent~=. & cve_mun1~=.


			
****************************************************************************
****************************************************************************
* Fill in state and mun when there is a match

	edit document paragraph P_global cve_ent1 cve_mun1 match_state_mun discard_loc   source_category action_category target_category source action target

	* first mun, then state 
	gsort +discard_loc +document +cve_mun1 +cve_ent  +paragraph +match_state_mun 	
		by discard_loc document: replace  cve_mun1=cve_mun1[_n-1] if cve_mun1==. & match_state_mun==.
		by discard_loc document: replace  cve_ent=cve_ent[_n-1]   if cve_ent==. & cve_mun1~=. & match_state_mun==. 

	* first state, then mun
	gsort +discard_loc +document +cve_ent +cve_mun1   +paragraph +match_state_mun 
		by discard_loc document: replace  cve_mun1=cve_mun1[_n-1] if cve_mun1==. & match_state_mun==.
		by discard_loc document: replace  cve_ent=cve_ent[_n-1]   if cve_ent==. & cve_mun1~=. & match_state_mun==. 
	
	
****************************************************************************
****************************************************************************
* Imputed  match state and municipal

	gen mun_temp2 = cve_mun1+100000						    	/*create a var with preceding zeros*/
		tostring mun_temp2, gen(mun_temp_str2)					/*make it a string var*/
		gen munstate_temp_str2 =substr(mun_temp_str2, -5, 2) 	/*keep only the state identifier*/
		destring munstate_temp_str2,replace					 	/*destring the state var*/
			
	gen match_state_mun2=1 if cve_ent1==munstate_temp_str2 & cve_ent1~=.		/*Match mun and state*/
	
	gen imputed_match=1 if match_state_mun2==1 & match_state_mun==. 			/*Gen imputed match*/
	
	gen any_match=1 if imputed_match==1 | match_state_mun==1
	
	edit document paragraph cve_ent1 match_state_mun2 cve_mun1 any_match match_state_mun2 imputed_match  source_category action_category target_category source action target
		
		drop mun_temp2 mun_temp_str2 munstate_temp_str2 match_state_mun2		/*drop irrelevant varialbes*/
		


****************************************************************************
****************************************************************************
* Drop discard_loc

	drop if discard_loc==1
	drop discard_loc










