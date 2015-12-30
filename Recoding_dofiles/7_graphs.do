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
************** GENERATE GRAPHS
**************
**************
****************************************************************************
****************************************************************************


** Install catplot
** Uncomment if necessary
* ssc install catplot


* 6.1 Main categories
catplot source_maincat, aspect(1) var1opts(label(labsize(large))) ytitle(Frequency, size(large))
	graph export graph_maincat_source.pdf, replace
catplot action_maincat, aspect(1) var1opts(label(labsize(large))) ytitle(Frequency, size(large))
	graph export graph_maincat_action.pdf, replace
catplot target_maincat, aspect(1) var1opts(label(labsize(large))) ytitle(Frequency, size(large))
	graph export graph_maincat_target.pdf, replace

catplot source_subcat, aspect(1) var1opts(label(labsize(large))) ytitle(Frequency, size(large))
	graph export graph_subcat_source.pdf, replace
catplot action_subcat, aspect(1) var1opts(label(labsize(large))) ytitle(Frequency, size(large))
	graph export graph_subcat_action.pdf, replace
catplot target_subcat, aspect(1) var1opts(label(labsize(large))) ytitle(Frequency, size(large))
	graph export graph_subcat_target.pdf, replace
	
	
* 6.2 Actions conducted by Government authorities
catplot   target_maincat action_maincat  if source_maincat=="Government authorities" , aspect(2) var1opts(label(labsize(large))) ytitle(Frequency, size(large)) ysize(7)
	graph export graph_action_target_maincat.pdf, replace

	
	
* 6.3 Further detail of actions conducted by Government authorities
catplot   target   if source_maincat=="Government authorities" & action_maincat=="Seize" & target_maincat=="Assets", by(target_maincat, note("")) yscale(range(0 50)) aspect(1)  
	graph export graph_target_assets.pdf, replace 
catplot   target   if source_maincat=="Government authorities" & action_maincat=="Seize" & target_maincat=="Drugs", by(target_maincat, note("")) yscale(range(0 50)) aspect(1)
	graph export graph_target_drugs.pdf, replace 
catplot   target   if source_maincat=="Government authorities" & action_maincat=="Seize" & target_maincat=="Other", by(target_maincat, note("")) yscale(range(0 50))  aspect(1)
	graph export graph_target_other.pdf, replace 
catplot   target   if source_maincat=="Government authorities" & action_maincat=="Seize" & target_maincat=="Weapons", by(target_maincat, note("")) yscale(range(0 50)) aspect(1)
	graph export graph_target_weapons.pdf, replace 
	
	
* 6.4 Tables by location 

catplot   cve_ent1 , var1opts(label(labsize(large))) ytitle(Frequency, size(large))
	graph export graph_states.pdf, replace 	

catplot   cve_mun1 , ysize(10) var1opts(label(labsize(large))) ytitle(Frequency, size(large))
	graph export graph_muns.pdf, replace 	
	
	
/*	
catplot cve_mun1 if cve_ent1==2 , by(cve_ent1, note("")) yscale(range(0 30)) aspect(1) 
	graph export graph_mun2.pdf, replace 	
catplot cve_mun1 if cve_ent1==5 , by(cve_ent1, note("")) yscale(range(0 30)) aspect(1) 
	graph export graph_mun3.pdf, replace 
catplot cve_mun1 if cve_ent1==8 , by(cve_ent1, note("")) yscale(range(0 30)) aspect(1) 
	graph export graph_mun8.pdf, replace 
catplot cve_mun1 if cve_ent1==10 , by(cve_ent1, note("")) yscale(range(0 30)) aspect(1) 
	graph export graph_mun10.pdf, replace 
catplot cve_mun1 if cve_ent1==14 , by(cve_ent1, note("")) yscale(range(0 30)) aspect(1) 
	graph export graph_mun14.pdf, replace 
catplot cve_mun1 if cve_ent1==17 , by(cve_ent1, note("")) yscale(range(0 30)) aspect(1) 
	graph export graph_mun17.pdf, replace 
catplot cve_mun1 if cve_ent1==18 , by(cve_ent1, note("")) yscale(range(0 30)) aspect(1) 
	graph export graph_mun18.pdf, replace 
catplot cve_mun1 if cve_ent1==20 , by(cve_ent1, note("")) yscale(range(0 30)) aspect(1) 
	graph export graph_mun20.pdf, replace 
catplot cve_mun1 if cve_ent1==23 , by(cve_ent1, note("")) yscale(range(0 30)) aspect(1) 
	graph export graph_mun23.pdf, replace 
catplot cve_mun1 if cve_ent1==24 , by(cve_ent1, note("")) yscale(range(0 30)) aspect(1) 
	graph export graph_mun24.pdf, replace 
catplot cve_mun1 if cve_ent1==25 , by(cve_ent1, note("")) yscale(range(0 30)) aspect(1) 
	graph export graph_mun25.pdf, replace 
catplot cve_mun1 if cve_ent1==26 , by(cve_ent1, note("")) yscale(range(0 30)) aspect(1) 
	graph export graph_mun26.pdf, replace 
catplot cve_mun1 if cve_ent1==27 , by(cve_ent1, note("")) yscale(range(0 30)) aspect(1) 	
	graph export graph_mun27.pdf, replace 
catplot cve_mun1 if cve_ent1==28 , by(cve_ent1, note("")) yscale(range(0 30)) aspect(1) 
	graph export graph_mun28.pdf, replace 
catplot cve_mun1 if cve_ent1==30 , by(cve_ent1, note("")) yscale(range(0 30)) aspect(1) 	 
	graph export graph_mun30.pdf, replace 
*/


