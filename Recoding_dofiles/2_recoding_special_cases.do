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
************** RECODING SPECIAL CASES
**************
**************
****************************************************************************
****************************************************************************



****************************************************************************
****************************************************************************
* 1. Recoding of special cases


* Begin recoding of special cases
{
	* Tab variablees
		tab source
			* There should be no drugs as actors	
		tab action
			* Looks good
		tab target
			* Looks good 
	* Further inspection 
		tab source
		tab source, nolab	
		* kidnapped person
			edit source action target if source==30104
		* drugs
			edit source action target if source==50100
		* marijuana
			edit source action target if source==50200
		* poppy plantation
			edit source  action target if source==80202
		* plantation
			edit source  action target if source==80200
			
	* Gen special recoding tag 
	gen special_recoding=.
		replace special_recoding=2 if  source==30104
		replace special_recoding=2 if  source==50100
		replace special_recoding=2 if  source==50200
		replace special_recoding=2 if  source==80202
		replace special_recoding=2 if  source==80200
	
	* Duplicate special recoding observatons 
	expand special_recoding, gen(special_recoding_dup)
	
	* Special recoding
		* Special Event: kidnapped person -> Seize -> marijuana
			* 0 Recode as: State imputed -> Release -> kidnapped person
				replace source=99999 if special_recoding_dup==0 & source==30104 & action==500 & target==50200
				replace action=400 if special_recoding_dup==0 & source==30104 & action==500 & target==50200
				replace target=30104 if special_recoding_dup==0 & source==30104 & action==500 & target==50200
			* 1 Recode as: State imputed -> Seize -> marijuana
				replace source=99999 if special_recoding_dup==1 & source==30104 & action==500 & target==50200
				replace action=500 if special_recoding_dup==1 & source==30104 & action==500 & target==50200
				replace target=50200 if special_recoding_dup==1 & source==30104 & action==500 & target==50200		
		* Special Event: drug -> arrest -> person
			* 0 Recode as: State imputed -> arrest -> person
				replace source=99999 if special_recoding_dup==0 & source==50100 & action==100 & target==30201
				replace action=100 if special_recoding_dup==0 & source==50100 & action==100 & target==30201
				replace target=30201 if special_recoding_dup==0 & source==50100 & action==100 & target==30201
			* 1 Recode as: State imputed -> Seize -> drug
				replace source=99999 if special_recoding_dup==1 & source==50100 & action==100 & target==30201
				replace action=500 if special_recoding_dup==1 & source==50100 & action==100 & target==30201
				replace target=50100 if special_recoding_dup==1 & source==50100 & action==100 & target==30201				
		* Special Event: marijuana -> arrest -> individual
			* 0 Recode as: State imputed -> arrest -> individual
				replace source=99999 if special_recoding_dup==0 & source==50200 & action==100 & target==30101
				replace action=100 if special_recoding_dup==0 & source==50200 & action==100 & target==30101
				replace target=30101 if special_recoding_dup==0 & source==50200 & action==100 & target==30101
			* 1 Recode as: State imputed -> Seize -> marijuana
				replace source=99999 if special_recoding_dup==1 & source==50200 & action==100 & target==30101
				replace action=500 if special_recoding_dup==1 & source==50200 & action==100 & target==30101
				replace target=50200 if special_recoding_dup==1 & source==50200 & action==100 & target==30101			
		* Special Event: poppy plantation -> Find -> landing strip
			* 0 Recode as: State imputed -> Find -> poppy plantation
				replace source=99999 if special_recoding_dup==0 & source==80202 & action==200 & target==80600
				replace action=200 if special_recoding_dup==0 & source==80202 & action==200 & target==80600
				replace target=80202 if special_recoding_dup==0 & source==80202 & action==200 & target==80600
			* 1 Recode as: State imputed -> Find -> landing strip
				replace source=99999 if special_recoding_dup==1 & source==80202 & action==200 & target==80600
				replace action=200 if special_recoding_dup==1 & source==80202 & action==200 & target==80600
				replace target=80600 if special_recoding_dup==1 & source==80202 & action==200 & target==80600	
		* Special Event: plantation -> Find -> landing strip
			* 0 Recode as: State imputed -> Find -> poppy plantation
				replace source=99999 if special_recoding_dup==0 & source==80200 & action==200 & target==80600
				replace action=200 if special_recoding_dup==0 & source==80200 & action==200 & target==80600
				replace target=80202 if special_recoding_dup==0 & source==80200 & action==200 & target==80600
			* 1 Recode as: State imputed -> Find -> landing strip
				replace source=99999 if special_recoding_dup==1 & source==80200 & action==200 & target==80600
				replace action=200 if special_recoding_dup==1 & source==80200 & action==200 & target==80600
				replace target=80600 if special_recoding_dup==1 & source==80200 & action==200 & target==80600	

				
				
}
	* End recoding of special cases

****************************************************************************
****************************************************************************
* 2. Order and drop unnecessary variables
	order date year month day document paragraph P_local P_global source_category action_category target_category
	drop only_action ADVWCO
	

	* End recode seizure of assets, drugs, vehicles and weapons	
	
	
	