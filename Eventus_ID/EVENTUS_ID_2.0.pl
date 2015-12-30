#\uFEFF#
# Identificador de Eventos
# IDEV
#

# Sintaxis:
# perl IDEV_version.pl ACTORES_1 ACTROES_2 VERBOS_1 CORPUS SALIDA_leer SALIDA_codigo

#if (!open(FILE, $ARGV[3])) {print STDERR "archivo CORPUS $ARGV[3] invalido \n";exit(0);}
#if (!open(SALIDA1 , ">AUX1.TMP")) {print STDERR "archivo AUXILIAR no se pudo crear \n";exit(0);}

print "\n";
print "Welcome to / Bienvenido a \n";
print "\n";
print "************************************************************************\n";
print "\n";
print "EEEEEE	VV  VV	EEEEEE	NN  NN	TTTTTT	UU  UU	SSSSSS	   III DDDD   \n";
print "EEE   	VV  VV	EEE   	NNN NN	  TT  	UU  UU	SSS   	   III DD DDD \n";
print "EEEEEE	 VVVV 	EEEEEE	NNNNNN	  TT  	UU  UU	SSSSSS	== III DD  DD \n";
print "EEE   	 VVVV 	EEE   	NN NNN	  TT  	UUUUUU	   SSS	   III DD DDD \n";
print "EEEEEE	  VV   	EEEEEE	NN  NN	  TT  	 UUUU 	SSSSSS	   III DDDD   \n";
print "\n";
print "************************************************************************\n";
print "\n";

# Press enter
print "\n\n";
print "Press Enter to continue... \n";
print "Teclea Enter para continuar... \n";
$reply = <STDIN>;

print "ENGLISH: \n";
print "Welcome to Eventus ID, v2.0\n";
print "\n";
print "Copyright (C) 2014, Javier Osorio and Alejandro Reyes. \n";
print "\n";
print "This program is free software: you can redistribute it and/or modify it under\n";
print "the terms of the GNU General Public License as published by the Free Software\n";
print "Foundation, either version 3 of the License, or any later version.\n";
print "\n";
print "This program is distributed in the hope that it will be useful, but WITHOUT\n";
print "ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS\n";
print "FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.\n";
print "\n";
print "You should have received a copy of the GNU General Public License along with \n";
print "this program. If not, see http://www.gnu.org/licenses/.\n";
print "\n";
print "How to cite this program:\n";
print "Javier Osorio and Alejandro Reyes. 2014. Eventus ID. Version 2.0.\n";
print "\n";
print "\n";

print "\n";
print "************************************\n";
print "\n";

# Press enter
print "\n\n";
print "Press Enter to continue... \n";
print "Teclea Enter para continuar... \n";
$reply = <STDIN>;

print "ESPANOL:\n";
print "Bienvenido a Eventus ID, v2.0\n";
print "\n";
print "Copyright (C) 2014, Javier Osorio and Alejandro Reyes \n";
print "\n";
print "Este programa es software libre: usted puede distribuirlo y/o modificarlo bajo\n";
print "los terminos de la Licencia Publica General GNU como esta publicada por el\n";
print "Free Software Foundation, ya sea en la version 3 de la Licencia, o cualquier\n";
print "version posterior. \n"; 
print "\n";
print "Este programa es distribuido con la esperanza que le sea util, pero NO TIENE\n";
print "NINGUNA GARANTIA; ni siquiera la garantia implicita de COMERCIABILIDAD o \n";
print "CONVENIENCIA PARA UN PROPOSITO PARTICULAR. Para mayores detalles, ver la \n";
print "Licencia Publica General GNU. \n";
print "\n";
print "Used debio haber recibido una copia de la Licencia Publica General de GNU junto\n";
print "con este programa. Si no, vea http://www.gnu.org/licenses/.\n";
print "\n";
print "Como citar este programa:\n";
print "Javier Osorio y Alejandro Reyes. 2014. Eventus ID. Version 2.0.\n";
print "\n";
print "\n";

print "\n";
print "************************************\n";
print "\n";

# Press enter
print "\n\n";
print "Press Enter to begin your coding project... \n";
print "Teclea Enter para iniciar tu proyecto de codificacion... \n";
$reply = <STDIN>;


if ($#ARGV >= 0){
	if (!open(FILE_CONFIG , $ARGV[0])) {print STDERR "archivo CONFIG $argv[0] invalido \n";exit(0);}
	#while ($linea = <FILE_CONFIG>){
	#}
	my $actores1 = <FILE_CONFIG>;
	chop($actores1);
	if (!open(FILE_ACTORES1 , $actores1)) {print STDERR "archivo ACTORES $actores1 invalido \n";exit(0);}
	my $actores2 = <FILE_CONFIG>;
	chop($actores2);
	if (!open(FILE_ACTORES2 , $actores2)) {print STDERR "archivo ACTORES $actores2 invalido \n";exit(0);}
	my $verbos = <FILE_CONFIG>;
	chop($verbos);
	if (!open(FILE_VERBOS , $verbos)) {print STDERR "archivo VERBOS $verbos invalido \n";exit(0);}
	my $corpus = <FILE_CONFIG>;
	chop($corpus);
	if (!open(FILE_CORPUS , $corpus)) {print STDERR "archivo CORPUS $corpus no se pudo cargar \n";exit(0);}
	
	my $municipios = <FILE_CONFIG>;
	chop($municipios);
	if ($municipios eq "NA"){
		print "decido no habilitar el reconocimiento de municipios \n";
	}else{
		if (!open(FILE_MUNICIPIOS , "<:encoding(UTF-8)", $municipios)) {print STDERR "archivo MUNICIPIOS $municipios no se pudo cargar \n Si no quiere reconocer municipios poner NA \n";exit(0);}
	}
	
	my $estados = <FILE_CONFIG>;
	chop($estados);
	if ($estados eq "NA"){
		print "decido no habilitar el reconocimiento de estados \n";
	}else{
		if (!open(FILE_ESTADOS , "<:encoding(UTF-8)", $estados)) {print STDERR "archivo ESTADOS $estados no se pudo cargar \n Si no quiere reconocer estados poner NA \n";exit(0);}
	}
	
	my $filtroLugares = <FILE_CONFIG>;
	chop($filtroLugares);
	if ($filtroLugares eq "NA"){
		print "decido no habilitar el filtro de lugares \n";
	}else{
		if (!open(FILE_FILTROLUGARES , "<:encoding(UTF-8)", $filtroLugares)) {print STDERR "archivo FILTRO LUGARES $filtroLugares no se pudo cargar \n Si no quiere reconocer estados poner NA \n";exit(0);}
	}
	
	my $salida = <FILE_CONFIG>;
	chop($salida);
	if (!open(SALIDA1 , ">texto_".$salida)) {print STDERR "archivo SALIDA1 texto_$salida invalido \n";exit(0);}
	#print "\n###### Teclea el nombre del archivo de salida que contendra el codigo de los actores y verbos encontrados.\n";
	if (!open(SALIDA2 , ">codigos_".$salida)) {print STDERR "archivo SALIDA2 codigos_$salida invalido \n";exit(0);}
	print "$actores1 - $actores2 - $verbos - $corpus - $salida\n";
	
	$opcionAlgoritmo = <FILE_CONFIG>;
	chop($opcionAlgoritmo);
	
}else{
	#1-Abro el archivo de actores
	#2-Abro el archivo de verbos
	print "\n************************************\n";
	print "###### ENG: Enter the file name containg the source actors.\n";
	print "###### ESP: Teclea el nombre del archivo que contiene los actores fuente.\n";
	print "************************************\n";	
	my $actores1 = <STDIN>;
	if (!open(FILE_ACTORES1 , $actores1)) {print STDERR "archivo ACTORES $actores1 invalido \n";exit(0);}
	
	print "\n************************************\n";
	print "###### ENG: Enter the file name containg the target actors.\n";
	print "###### ESP: Teclea el nombre del archivo que contiene los actores objetivo.\n";
	print "************************************\n";	
	my $actores2 = <STDIN>;
	if (!open(FILE_ACTORES2 , $actores2)) {print STDERR "archivo ACTORES $actores2 invalido \n";exit(0);}
	
	print "\n************************************\n";
	print "###### ENG: Enter the file name containg the verbs.\n";
	print "###### ESP: Teclea el nombre del archivo que contiene los verbos.\n";
	print "************************************\n";	
	my $verbos = <STDIN>;
	if (!open(FILE_VERBOS , $verbos)) {print STDERR "archivo VERBOS $verbos invalido \n";exit(0);}
	#if (!open(FILE, $ARGV[3])) {print STDERR "archivo CORPUS $ARGV[3] invalido \n";exit(0);}
	
	print "\n************************************\n";
	print "###### ENG: Enter the file name containg the text corpus.\n";
	print "######      The corpus must have bee generated using Web2Eventus.\n";
	print "###### ESP: Teclea el nombre del archivo que contiene el corpus de texto.\n";
	print "######      El corpus debio haber sido generado utilizando Web2Eventus.\n";
	print "************************************\n";	
	my $corpus = <STDIN>;
	if (!open(FILE_CORPUS , $corpus)) {print STDERR "archivo CORPUS_AUXILIAR $corpus no se pudo cargar \n";exit(0);}
	
	print "\n************************************\n";
	print "###### ENG: Enter the file name containg the municipalities.\n";
	print "###### ESP: Teclea el nombre del archivo que contiene los municipios.\n";
	print "************************************\n";	
	my $municipios = <STDIN>;
	if ($municipios eq "NA"){
		print "decido no habilitar el reconocimiento de municipios \n";
	}else{
		#if (!open(FILE_MUNICIPIOS , "<:encoding(UTF-8)", $municipios)) {print STDERR "archivo MUNICIPIOS $municipios no se pudo cargar \n Si no quiere reconocer municipios poner NA \n";exit(0);}
		if (!open(FILE_MUNICIPIOS , $municipios)) {print STDERR "archivo MUNICIPIOS $municipios no se pudo cargar \n Si no quiere reconocer municipios poner NA \n";exit(0);}
	}
	
	print "\n************************************\n";
	print "###### ENG: Enter the file name containg the states.\n";
	print "###### ESP: Teclea el nombre del archivo que contiene los estados.\n";
	print "************************************\n";		my $estados = <STDIN>;
	if ($estados eq "NA"){
		print "decido no habilitar el reconocimiento de estados \n";
	}else{
		#if (!open(FILE_ESTADOS , "<:encoding(UTF-8)", $estados)) {print STDERR "archivo ESTADOS $estados no se pudo cargar \n Si no quiere reconocer estados poner NA \n";exit(0);}
		if (!open(FILE_ESTADOS , $estados)) {print STDERR "archivo ESTADOS $estados no se pudo cargar \n Si no quiere reconocer estados poner NA \n";exit(0);}
	}
	
	print "\n************************************\n";
	print "###### ENG: Enter the file name containg the location filters.\n";
	print "###### ESP: Teclea el nombre del archivo que contiene los filtros de lugares.\n";
	print "************************************\n";	
	my $filtroLugares = <STDIN>;
	if ($filtroLugares eq "NA"){
		print "decido no habilitar el filtro de lugares \n";
	}else{
		#if (!open(FILE_FILTROLUGARES , "<:encoding(UTF-8)", $filtroLugares)) {print STDERR "archivo FILTRO LUGARES $filtroLugares no se pudo cargar \n Si no quiere reconocer estados poner NA \n";exit(0);}
		if (!open(FILE_FILTROLUGARES , $filtroLugares)) {print STDERR "archivo FILTRO LUGARES $filtroLugares no se pudo cargar \n Si no quiere reconocer estados poner NA \n";exit(0);}
	}
	
	
	print "\n************************************\n";
	print "###### ENG: Enter the name assigned to the output file.\n";
	print "###### ESP: Teclea el nombre asignado para el archivo de salida.\n";
	print "************************************\n";	
	my $salida = <STDIN>;
	if (!open(SALIDA1 , ">texto_".$salida)) {print STDERR "archivo SALIDA1 texto_$salida invalido \n";exit(0);}
	#print "\n###### Teclea el nombre del archivo de salida que contendra el codigo de los actores y verbos encontrados.\n";
	if (!open(SALIDA2 , ">codigos_".$salida)) {print STDERR "archivo SALIDA2 codigos_$salida invalido \n";exit(0);}
	
	
	print "\n###### Teclea el tipo de algoritmo que se usará para la codificación.";
	print "\n###### 1 - fuente-accion-objetivo\t2 - fuente-accion-objetivo y accion-objetivo.\n";
	
	print "************************************\n";
	print "###### ENG: Select the algorith used for event coding.\n";
	print "######      1 - Only source-action-target.\n";
	print "######      2 - Both source-action-target and action-target.\n";
	print "###### ESP: Selecciona el tipo de algoritmo para codificar eventos.\n";
	print "######      1 - Solo fuente-accion-objetivo.\n";
	print "######      2 - Ambos fuente-accion-objetivo y accion-objetivo.\n";
	print "************************************\n";
	my $opcionAlgoritmo = <STDIN>;

}

#########################################

$actor_ant="";
while( $l_actores1 = <FILE_ACTORES1> ) {
	chop($l_actores1);
	#chop($l_actores1);
	$l_actores1 =~ s/  / /g;
	$l_actores1 =~ s/  / /g;
	$l_actores1 =~ s/  / /g;
	$l_actores1 =~ s/  / /g;
	$l_actores1 = lc($l_actores1);
	
	#################pregunto que no sea una l\u00EDnea vac\u00EDa
	if ($l_actores1=~ m/[A-Za-z]/){
		
		###############pregunto si es un actor o es un actor compuesto
		if ($l_actores1 =~ m/^\-/){
			####Actor compuesto
			@partes=split(/ /,$l_actores1);
			
			#Pregunto si el actor sencillo lo agrego al inicio o fin
			if ($partes[1] eq "*"){
				$lista_actores1{$actor_ant.$partes[2]}=$partes[3];
			}else{						
				$lista_actores1{$partes[1].$actor_ant}=$partes[3];
			}
		}else{
			####Actor sencillo
			@partes=split(/ /,$l_actores1);
			$actor_ant=$partes[0];
			#$partes[1]
			if ($partes[1] !~ /---/){
				$lista_actores1{$partes[0]}=$partes[1];
			}else{
				#lista con no compuestos
				$lista_filtros{$partes[0]}=$partes[1];
			}
		}#fin else l_actores -
		
	}#Fin de existe algo en la l\u00EDnea
}

#########################################
$actor_ant="";
while( $l_actores2 = <FILE_ACTORES2> ) {
	chop($l_actores2);
	#chop($l_actores2);
	$l_actores2 =~ s/  / /g;
	$l_actores2 =~ s/  / /g;
	$l_actores2 =~ s/  / /g;
	$l_actores2 = lc($l_actores2);
	
	#################pregunto que no sea una l\u00EDnea vac\u00EDa
	if ($l_actores2=~ m/[A-Za-z]/){
		
		###############pregunto si es un actor o es un actor compuesto
		if ($l_actores2 =~ m/^\-/){
			####Actor compuesto
			@partes=split(/ /,$l_actores2);
			
			#Pregunto si el actor sencillo lo agrego al inicio o fin
			if ($partes[1] eq "*"){
				$lista_actores2{$actor_ant.$partes[2]}=$partes[3];
			}else{						
				$lista_actores2{$partes[1].$actor_ant}=$partes[3];
			}
		}else{
			####Actor sencillo
			@partes=split(/ /,$l_actores2);
			$actor_ant=$partes[0];
			#$partes[1]
			if ($partes[1] !~ /---/){
				$lista_actores2{$partes[0]}=$partes[1];
			}else{
				#lista con no compuestos
				$lista_filtros{$partes[0]}=$partes[1];
			}
		}#fin else l_actores -
		
	}#Fin de existe algo en la l\u00EDnea
}
#########################################

$verbo_ant="";
while( $l_verbos = <FILE_VERBOS> ) {
	chop($l_verbos);
	#chop($l_verbos);
	$l_verbos =~ s/  / /g;
	$l_verbos =~ s/  / /g;
	$l_verbos =~ s/  / /g;
	$l_verbos = lc($l_verbos);
	
	#################pregunto que no sea una l\u00EDnea vac\u00EDa
	if ($l_verbos=~ m/[A-Za-z]/){
		
		#Evito agregar verbos que tenga --- que significa que no son admitidos
		#!!!Para mejorar esto, cargar los --- a una lista de t\u00E9rminos a eliminar
		#!!!y al recorrer el corpus, eliminarlos directamente
		if ($l_verbos !~ /\[---\]/){
			#print $l_verbos."++++++++++++++++\n";
		###############pregunto si es un verbo o es un verbo compuesto
		#########Si empieza (^) con - es compuesto
			if ($l_verbos =~ m/^\-/){
				####Verbo compuesto
				@partes=split(/ /,$l_verbos);
				$l_verbos =~ m/\- (.*) \[/;		#almaceno la palabra entres -  [
				$verbo_comp=$1;
				#print $verbo_comp."--------------\n";
				#print substr($verbo_comp,0,1)."fin \n";
			
				#if ($partes[1] eq "*"){
				if (substr($verbo_comp,0,1) eq "*"){
					$verbo_comp =~ s/\*/$verbo_ant/;
				}else{
					#print substr($verbo_comp,-1,1)."ini \n";
					$verbo_comp =~ s/\*/$verbo_ant/;
					#if ($partes[$#partes-1] eq "*"){
					#	$verbo_comp =~ s/ \*/$verbo_ant/;
					#}else{
					#	$verbo_comp =~ s/ \* /$verbo_ant/;
					#}
				}
			
				$lista_verbos{$verbo_comp}=$partes[$#partes];

			}else{
				####Verbo sencillo
				@partes=split(/ /,$l_verbos);
				$verbo_ant=$partes[0];
				#$partes[1]
				#if ($partes[1] !~ /---/){
					$lista_verbos{$partes[0]}=$partes[1];
				#}	
			}#fin else l_verbos -
		
		}else{
				#lista con no compuestos
				@partes=split(/ /,$l_verbos);
				$lista_filtros{$partes[0]}=$partes[1];
			}
		
	}#Fin de existe algo en la l\u00EDnea
}

#########################################

while ($l_municipios=<FILE_MUNICIPIOS>){
  chop($l_municipios);
  @archivo=split(/\t/,$l_municipios);

	$archivo[1]=~s/\u00E1/a/g;	$archivo[1]=~s/\u00E9/e/g;	$archivo[1]=~s/\u00ED/i/g;
	$archivo[1]=~s/\u00F3/o/g;	$archivo[1]=~s/\u00FA/u/g;
	$archivo[1]=~s/\u00C1/A/g;	$archivo[1]=~s/\u00C9/E/g;	$archivo[1]=~s/\u00CD/I/g;
	$archivo[1]=~s/\u00D3/O/g;	$archivo[1]=~s/\u00DA/U/g;
	$archivo[1]=~s/\u00F1/nn/g;	$archivo[1]=~s/\u00D1/NN/g;
	$archivo[1] = lc($archivo[1]);

	#si el nombre tiene varios c\u00F3digos los agrego.
	if ( exists $l_mun{"$archivo[1]"} == 1){
		$l_mun{"$archivo[1]"}=$l_mun{"$archivo[1]"}.","."u-$archivo[0]";
	}else{
		$l_mun{"$archivo[1]"}="u-$archivo[0]";
	}
	$l_mun_tam{"$archivo[1]"}=length($archivo[1]);
	$l_cod{"$archivo[0]"}=$archivo[1];
	
}

#########################################

while ($l_estados=<FILE_ESTADOS>){		
  chop($l_estados);
  @archivo=split(/\t/,$l_estados);
  
	$archivo[1]=~s/\u00E1/a/g;	$archivo[1]=~s/\u00E9/e/g;	$archivo[1]=~s/\u00ED/i/g;
	$archivo[1]=~s/\u00F3/o/g;	$archivo[1]=~s/\u00FA/u/g;
	$archivo[1]=~s/\u00C1/A/g;	$archivo[1]=~s/\u00C9/E/g;	$archivo[1]=~s/\u00CD/I/g;
	$archivo[1]=~s/\u00D3/O/g;	$archivo[1]=~s/\u00DA/U/g;
	$archivo[1]=~s/\u00F1/nn/g;	$archivo[1]=~s/\u00D1/NN/g;
	$archivo[1] = lc($archivo[1]);

#si el nombre tiene varios c\u00F3digos los agrego.
	if ( exists $l_edo{"$archivo[1]"} == 1){
		$l_mun{"$archivo[1]"}=$l_mun{"$archivo[1]"}.","."e-$archivo[0]";
	}else{
		$l_mun{"$archivo[1]"}="e-$archivo[0]";
	}
	$l_mun_tam{"$archivo[1]"}=length($archivo[1]);
	$l_cod{"$archivo[0]"}=$archivo[1];
	$l_estados=$l_estados."$archivo[1]|";

}
chop($l_estados);
$l_estados=~s/\./\\\./g;
$l_estados="[$l_estados]";

#########################################

while ($l_filtrolug=<FILE_FILTROLUGARES>){		
  chop($l_filtrolug);
  @archivo=split(/\t/,$l_filtrolug);
  
	$archivo[1]=~s/\u00E1/a/g;	$archivo[1]=~s/\u00E9/e/g;	$archivo[1]=~s/\u00ED/i/g;
	$archivo[1]=~s/\u00F3/o/g;	$archivo[1]=~s/\u00FA/u/g;
	$archivo[1]=~s/\u00C1/A/g;	$archivo[1]=~s/\u00C9/E/g;	$archivo[1]=~s/\u00CD/I/g;
	$archivo[1]=~s/\u00D3/O/g;	$archivo[1]=~s/\u00DA/U/g;
	$archivo[1]=~s/\u00F1/nn/g;	$archivo[1]=~s/\u00D1/NN/g;
	$archivo[1]=~s/á/a/g;				$archivo[1]=~s/é/e/g;				$archivo[1]=~s/í/i/g;
	$archivo[1]=~s/ó/o/g;				$archivo[1]=~s/ú/u/g;				
	$archivo[1] = lc($archivo[1]);

	#Pongo el filtro en la misma lista de filtros de actores y verbos
	#if ($archivo[1] eq "0"){
	#	print $archivo[1]."\n";
	#	print $l_filtrolug."\n";
	#	exit;
	#}
	$lista_filtros{"$archivo[1]"}="0";
	$lista_filtros_tam{"$archivo[1]"}=length($archivo[1]);
}

####Para comprobar la lista hash de actores
#foreach my $key (keys %lista_actores){
#	print "$key = $lista_actores{$key}\n";
#}
####Para comprobar la lista hash de verbos
#foreach my $key (keys %lista_verbos){
#	print "$key = $lista_verbos{$key}\n";
#}
#foreach my $key (keys %lista_filtros){
#print "$key = $lista_filtros{$key}\n";
#}
#exit;
#foreach my $key (keys %l_mun){
#print "$key = $l_mun{$key}\n";
#}
#exit;

$idAnterior = "";
$nombresEncontrados = "";
$estadosEncontrados = "";
$municipiosEncontrados = "";
$codigosEncontrados = "";
$estadosCodEncontrados = "";
$municipiosCodEncontrados = "";
%estadosHash1 = ();
%municipiosHash1 = ();

while( $l_corpus = <FILE_CORPUS> ) {
	chop($l_corpus);
	#quito espacios en blanco
	$l_corpus =~ s/  / /g;
	$l_corpus =~ s/  / /g;
	$l_corpus =~ s/  / /g;
	
	######################################
	#separo la noticia de su identificador
	@partes=split(/\|/,$l_corpus);
	@identificador=split(/\t/,$partes[0]);
	@idNota=split(/_/,$identificador[1]);
	
	#print $partes[0]."\t".$estadosEncontrados."\n";
	print $identificador[1]."\n";
	#print $idNota[0]."\n";
	
	$estadosEncontrados =~ s/\\//g;
	$municipiosEncontrados =~ s/\\//g;
	
	if ($idNota[0] ne $idAnterior){
		@partesNombres = split(/\n/,$nombresEncontrados);
		foreach $parteNombre (@partesNombres){
			@tabs = split(/\t/,$parteNombre);
			#print SALIDA1 $parteNombre."\t".$#tabs."\n";
			if (length($parteNombre)>1){
				if ($#tabs > 6){
					print SALIDA1 $parteNombre."\n";
				}else{
					print SALIDA1 $parteNombre."Edos_i".$estadosEncontrados."\tMpos_i".$municipiosEncontrados."\n";
				}
			}
		}
		@partesCodigos = split(/\n/,$codigosEncontrados);
		foreach $parteCodigo (@partesCodigos){
			@tabs = split(/\t/,$parteCodigo);
			#print SALIDA1 $parteNombre."\t".$#tabs."\n";
			if (length($parteCodigo)>1){
				if ($#tabs > 6){
					print SALIDA2 $parteCodigo."\n";
				}else{
					print SALIDA2 $parteCodigo."\tEdos_i".$estadosCodEncontrados."\tMpos_i".$municipiosCodEncontrados."\n";
				}
			}
		}
		#print SALIDA1 $nombresEncontrados;
		%estadosHash1 = ();
		%municipiosHash1 = ();
		$estadosEncontrados = "";
		$municipiosEncontrados = "";
		$nombresEncontrados = "";
		$codigosEncontrados = "";
		$estadosCodEncontrados = "";
		$municipiosCodEncontrados = "";
		$idAnterior = $idNota[0];
	}
	#print $idNota[0]."\n";
	######################################
	#convierto todo a minusculas
	$texto = lc($partes[1]);
	
	###Elimino palabras con [---]
	foreach my $key (keys %lista_filtros){
		$frase_eliminar = $key;
		$frase_eliminar =~ s/_/ /g;
		
		if ($texto =~ $frase_eliminar){
			#print "$frase_eliminar = $lista_filtros{$key}\n";
		}
		$texto =~ s/$frase_eliminar/ /ig;
		#print "$frase_eliminar = $lista_filtros{$key}\n";
	}
	
	#Busco si en el texto existe algún municipio
	#############################################						
	$listaLugares = subEncuentraFechas($texto);					
	@lugares=split(/\,/,$listaLugares);						
	############################################
	
	#print "$texto\n\n";
	#separo cada una de las palabras
	@palabras=split(/ /,$texto);

	#while ($l_corpus_ant =~ /(([0-9]{2} de )?(enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre)( de [0-9]{4})?)/igm){
		#print $partes[0]."\t".$1."\n";
	#	print SALIDA1 "\t".$1;
	#	print SALIDA2 "\t".$1;
	#}
				
	#print SALIDA1 "\n$partes[0]\t";
	#print SALIDA2 "\n$partes[0]\t";
	$SALIDA_txt1 = "\n$partes[0]\t";
	$SALIDA_txt2 = "\n$partes[0]\t";
	#Banderas de b\u00FAsqueda
	$actor1=0;
	$verbo=0;
	$actor2=0;
	$anterior = 0; #0=actor 2 o que inicia
								 #1 = actor 1
								 #2 = verbo 1
								 
	#print "\n$partes[0]\t";
	#recorre cada una de las palabras de la noticia
	#$i_pal es el indice de la palabra en el texto
	for ($i_pal=0; $i_pal<$#palabras; $i_pal++){
		#Creacion de palabras compuestas ?
		for($i_pcj=1; $i_pcj<=12; $i_pcj++){
			$arr_pcj[$i_pcj]="";
			for ($j=0; $j<$i_pcj; $j++){
				$arr_pcj[$i_pcj]=$arr_pcj[$i_pcj].$palabras[$i_pal+$j]."_";
			}
		}
				
		#print $palabras[$i_pal]." ";
		
		############recorro cada una de las palabras generadas de mayor a menor
		for($i_pcj=12; $i_pcj>=1; $i_pcj--){				
				if ( (exists $l_mun{"$arr_pcj[$i_pcj]"}) ){
					print $arr_pcj[$i_pcj]."\n";
				}
				
				if ( $arr_pcj[$i_pcj] eq "Monterrey" ){
					print $arr_pcj[$i_pcj]."\n";
				}
		
			  #Si existe un actor y estoy buscando el primer actor
				if ( (exists $lista_actores1{$arr_pcj[$i_pcj]}) && $anterior == 0 ){
					$fuente = "$lista_actores1{$arr_pcj[$i_pcj]} = $arr_pcj[$i_pcj]";
					$codigo = $lista_actores1{$arr_pcj[$i_pcj]};
					#print "A1-$i_pal-$i_pcj-$anterior - \t";
					#$i_pcj=0;
					
					#salto al final de la palabra
					$i_pal=$i_pal+$i_pcj-1;
					$existe=1;
					$actor1=1;
					$verbo=0;
					$actor2=0;
					#$anterior = 1;		#es que encontré un actor1
					
				}elsif (exists $lista_verbos{$arr_pcj[$i_pcj]} ){
				#}
				#if (exists $lista_verbos{$arr_pcj[$i_pcj]} ){
					$verbo1 = "$lista_verbos{$arr_pcj[$i_pcj]} = $arr_pcj[$i_pcj]";
					$codigo = $lista_verbos{$arr_pcj[$i_pcj]};
					#print "V1-$i_pal-$i_pcj-$anterior - \t";
					#$i_pcj=0;
					
					#salto al final de la palabra
					$i_pal=$i_pal+$i_pcj-1;
					$existe=1;
					$actor1=0;
					$verbo=1;
					$actor2=0;					
					#$anterior=2; 		#encontré un verbo, busco actor 2 u otro verbo que
													#rompa la estructura
					
				}elsif ( (exists $lista_actores2{$arr_pcj[$i_pcj]}) && $anterior != 1 ){
				#}
				#if (exists $lista_actores2{$arr_pcj[$i_pcj]} ){
					$objetivo = "$lista_actores2{$arr_pcj[$i_pcj]} = $arr_pcj[$i_pcj]";
					$codigo = $lista_actores2{$arr_pcj[$i_pcj]};
					#print "A2-$i_pal-$i_pcj-$anterior - \t";
					#$i_pcj=0;
					
					#salto al final de la palabra
					$i_pal=$i_pal+$i_pcj-1;
					$existe=1;
					$actor1=0;
					$verbo=0;
					$actor2=1;				
					#$anterior=0		#encontré un actor 2, por lo que busco de nuevo actor 1
				}
				
				
				####################################
				######################Si existe algo
				if ($existe == 1){
					$existe = 0;
							

					if ($actor1==1){
						#print "existe 0 \t";
						$SALIDA_txt1 = $SALIDA_txt1."A1.-$fuente";
						$codigo =~ s/\[//g;
						$codigo =~ s/\]//g;
						$SALIDA_txt2 = $SALIDA_txt2."$codigo";
						
						$anterior = 1;
						
					}elsif ($verbo == 1){
						#print "existe 1 \t";
						#if ($anterior == 1){
						#}else{
						if ($anterior == 2){
							#Busco si en el texto existe algún municipio
							#############################################						
							#$listaLugares = subEncuentraFechas($texto);					
							#@lugares=split(/\,/,$listaLugares);						
							############################################
							#print SALIDA1 $SALIDA_txt1."\tEdos".$lugares[2]."\tMpos\t".$lugares[0];
							#$estadosEncontrados = $estadosEncontrados.$lugares[2];
							#$municipiosEncontrados = $municipiosEncontrados.$lugares[0];
							if ($opcionAlgoritmo eq "10"){
								if ( (length($lugares[0]) > 1 ) ||(length($lugares[2]) > 1) ){
									$nombresEncontrados = $nombresEncontrados.$SALIDA_txt1."\t\tEdos".$lugares[2]."\tMpos\t".$lugares[0];
								}else{
									$nombresEncontrados = $nombresEncontrados.$SALIDA_txt1;
								}
								#print SALIDA2 $SALIDA_txt2."\tEdos".$lugares[3]."\tMpos\t".$lugares[1];
								if ( (length($lugares[1]) > 1 ) ||(length($lugares[3]) > 1) ){
									$codigosEncontrados = $codigosEncontrados.$SALIDA_txt2."\t\tEdos".$lugares[3]."\tMpos\t".$lugares[1];
								}else{
									$codigosEncontrados = $codigosEncontrados.$SALIDA_txt2;
								}
			  
								$SALIDA_txt1 = "\n$partes[0]\t";
								$SALIDA_txt2 = "\n$partes[0]\t";
							}
						}
						
						#if ( ($opcionAlgoritmo eq "2") && ($anterior == 1) ){
						if ( ($anterior == 1) ){
							$SALIDA_txt1 = $SALIDA_txt1."\tV1.-$verbo1";
							$codigo =~ s/\[//g;
							$codigo =~ s/\]//g;
							$SALIDA_txt2 = $SALIDA_txt2."\t$codigo ";
						
							$anterior = 2;
						
						}else{
							if ( ($opcionAlgoritmo eq "2")  ){
								$SALIDA_txt1 = $SALIDA_txt1."\tV1.-$verbo1";
								$codigo =~ s/\[//g;
								$codigo =~ s/\]//g;
								$SALIDA_txt2 = $SALIDA_txt2."\t$codigo ";
						
								$anterior = 2;
							}
						}
						
					}elsif ($actor2==1){
						#Busco si en el texto existe algún municipio
						#############################################						
						#$listaLugares = subEncuentraFechas($texto);					
						#@lugares=split(/\,/,$listaLugares);						
						############################################
						$SALIDA_txt1 = $SALIDA_txt1."\tA2.-$objetivo";
						$codigo =~ s/\[//g;
						$codigo =~ s/\]//g;
						$SALIDA_txt2 = $SALIDA_txt2."\t$codigo";				
						#print SALIDA1 $SALIDA_txt1."\tEdos".$lugares[2]."\tMpos\t".$lugares[0];
						#$estadosEncontrados = $estadosEncontrados.$lugares[2];
					    #$municipiosEncontrados = $municipiosEncontrados.$lugares[0];
						if ( (length($lugares[0]) > 1 ) ||(length($lugares[2]) > 1) ){
							$nombresEncontrados = $nombresEncontrados.$SALIDA_txt1."\tEdos".$lugares[2]."\tMpos\t".$lugares[0];
						}else{
							$nombresEncontrados = $nombresEncontrados.$SALIDA_txt1."\t";
						}
						#print SALIDA2 $SALIDA_txt2."\tEdos".$lugares[3]."\tMpos\t".$lugares[1];
						if ( (length($lugares[1]) > 1 ) ||(length($lugares[3]) > 1) ){
								$codigosEncontrados = $codigosEncontrados.$SALIDA_txt2."\tEdos".$lugares[3]."\tMpos\t".$lugares[1];
						}else{
								$codigosEncontrados = $codigosEncontrados.$SALIDA_txt2;
						}
			  
						$SALIDA_txt1 = "\n$partes[0]\t";
						$SALIDA_txt2 = "\n$partes[0]\t";
						
						$anterior = 0;
					}
					
					$i_pcj=0;
				}
				
		}
			
	}#fin for palabras noticia
	
	if ( length($SALIDA_txt1) > 40){
		#Busco si en el texto existe algún municipio
		#############################################						
		#$listaLugares = subEncuentraFechas($texto);					
		#@lugares=split(/\,/,$listaLugares);						
		############################################		
		#print SALIDA1 $SALIDA_txt1."\tEdos".$lugares[2]."\tMpos\t".$lugares[0];
		#$estadosEncontrados = $estadosEncontrados.$lugares[2];
	    #$municipiosEncontrados = $municipiosEncontrados.$lugares[0];
	  #print "opcAlg\t".$opcionAlgoritmo."\n";
	  #if ($opcionAlgoritmo eq "1"){
			if ($anterior==1){
				if ( (length($lugares[0]) > 1 ) ||(length($lugares[2]) > 1) ){
					$nombresEncontrados = $nombresEncontrados.$SALIDA_txt1."\t\t\tEdos".$lugares[2]."\tMpos\t".$lugares[0];
				}else{
					$nombresEncontrados = $nombresEncontrados.$SALIDA_txt1."\t\t\t";
				}
			}else{
				if ( (length($lugares[0]) > 1 ) ||(length($lugares[2]) > 1) ){
					$nombresEncontrados = $nombresEncontrados.$SALIDA_txt1."\t\tEdos".$lugares[2]."\tMpos\t".$lugares[0];
				}else{
					$nombresEncontrados = $nombresEncontrados.$SALIDA_txt1."\t\t";
				}
			}
			#print SALIDA2 $SALIDA_txt2."\tEdos".$lugares[3]."\tMpos\t".$lugares[1];
			if ($anterior==1){
				if ( (length($lugares[3]) > 1 ) ||(length($lugares[1]) > 1) ){
					$codigosEncontrados = $codigosEncontrados.$SALIDA_txt2."\t\t\tEdos".$lugares[3]."\tMpos\t".$lugares[1];
				}else{
					$codigosEncontrados = $codigosEncontrados.$SALIDA_txt2."\t\t";
				}
			}else{
				if ( (length($lugares[3]) > 1 ) ||(length($lugares[1]) > 1) ){
					$codigosEncontrados = $codigosEncontrados.$SALIDA_txt2."\t\tEdos".$lugares[3]."\tMpos\t".$lugares[1];
				}else{
					$codigosEncontrados = $codigosEncontrados.$SALIDA_txt2."\t";
				}
			}
		#}
	}
	
	$l_corpus_ant = $l_corpus;
}

######################Subrutina para buscar fechas
sub subEncuentraFechas{
	my ($var) = @_;
	
	$linea = $var;
						
  @arr_edos=();
  @arr_edos_name=();
  @arr_mpos=();
  @arr_mpos_name=();
  $i_edos=0;
  $i_mpos=0;
  $entro=0;
  #recorro estados y municipios
  foreach my $key (sort {$l_mun_tam{$b} <=> $l_mun_tam{$a}} keys %l_mun_tam){
	
	$value = $l_mun{$key};
      
	#agrego una \ antes de los . para que el punto no se confunda
	$key2=$key;
	$key=~s/\./\\\./g;							
      
    $peq_valida = 1;
    if ( (length($key)<=3) && ($linea =~ / $key /) && ($linea !~ /| $key /) ){
		$peq_valida= 1;
      	print "una pequeña";
	}
      				
	#esta instruccion acepta son sin etc ...
	if ( ($linea =~ / $key /i) && ( ($peq_valida == 1) || (length($key)>=4) ) ){
		#print "EXISTEEEEEEEEEEE ALGOOOOOOOOOOOOOO\n";
		#if ($key == "pue"){
		#	print SALIDA "-".$key."-";
		#}
		$positivo=0;
		$negativo=0;
		$remplazo="";

							if ($linea =~ / Ciudad de $key/i){ $positivo=1; 	$remplazo="Ciudad de $key";}
							if ($linea =~ / Ciudad $key/i){ $positivo=1; 		$remplazo="Ciudad $key";}
							if ($linea =~ / Estado de $key/i){ $positivo=2; 	$remplazo="Estado de $key";}
							if ($linea =~ / Municipio de $key/i){ $positivo=1; 	$remplazo="Municipio de $key";}

							if ($linea =~ /Originario de $key/i){ $negativo=1;	$remplazo="Originario de $key"; }
							if ($linea =~ /Originario del $key/i){ $negativo=1;	$remplazo="Originario del $key"; }
							#if ($linea =~ /Procedente de \Q$key\E/i){ $negativo=1;	$remplazo="Procedente de $key"; }

							if ($linea =~ /Originarios de $key/i){ $negativo=1;	$remplazo="Originarios de $key"; }
							if ($linea =~ /Originarios del $key/i){ $negativo=1;	$remplazo="Originarios del $key"; }
							if ($linea =~ /Procedentes de $key/i){ $negativo=1;	$remplazo="Procedentes de $key"; }
							#if ($linea =~ /Con destino a \Q$key\E/i){ $negativo=1; 	$remplazo="Con destino a $key";}

							if ($linea =~ /Gobierno de $key/i){ $negativo=1; 	$remplazo="Gobierno de $key";}
							if ($linea =~ /Gobierno del Estado de $key/i){ $negativo=1; 	$remplazo="Gobierno del Estado de $key";}
							if ($linea =~ /Gobernador de $key/i){ $negativo=1; 	$remplazo="Gobierno de $key";}
							if ($linea =~ /Gobernador del Estado de $key/i){ $negativo=1; 	$remplazo="Gobernador del Estado de $key";}
							if ($linea =~ /Justicia del Estado de $key/i){ $negativo=1; 	$remplazo="Justicia del Estado de $key";}

							if ($linea =~ /Seguridad de $key/i){ $negativo=1; 	$remplazo="Seguridad de $key";}
							if ($linea =~ /Publica de $key/i){ $negativo=1; 	$remplazo="Publica de $key";}
							if ($linea =~ /Seguridad del Estado de $key/i){ $negativo=1; 	$remplazo="Seguridad del Estado de $key";}
							if ($linea =~ /Publica del Estado de $key/i){ $negativo=1; 	$remplazo="Publica del Estado de $key";}

							if ($linea =~ /Estado de Derecho $key/i){ $negativo=1; 	$remplazo="Estado de Derecho $key";}

							if ($linea =~ /Con placas de $key/i){ $negativo=1; 	$remplazo="Con placas de $key";}
							if ($linea =~ /Con placas del Estado de $key/i){ $negativo=1; 	$remplazo="Con placas del Estado de $key";}


				$remplazo2=$remplazo;
				$remplazo2=~s/ /_/g;

				#Si encuentro un remplazo negativo lo elimino
				if ($negativo == 1){
					#print "NEGATIVOOOOO\n";
	    		if ($linea =~ /$remplazo[,|.| ] $l_estados/i){
	      		$linea_archivo =~ s/($remplazo[,|.| ] $l_estados)/<Filtro>$1<\/Filtro>/gi;
	      		$linea =~ s/($remplazo[,|.| ] $l_estados)/<Filtro>$1<\/Filtro>/gi;
	    		}else{
	      		$linea_archivo =~ s/$remplazo/<Filtro>$remplazo2<\/Filtro>/gi;
	      		$linea =~ s/$remplazo/<Filtro>$remplazo2<\/Filtro>/gi;
	    		}
				}elsif ($positivo == 1){
					#print "MUNICIPIOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO\n";
	    		$linea_archivo =~ s/$remplazo/<mun_$value>$remplazo2<\/mun>/gi;
	    		$linea =~ s/$remplazo/<mun_$value>$remplazo2<\/mun>/gi;
					#$value=~s/u\-//g;
					@codigos=split(/\,/,$value);
					foreach $codigo(@codigos){
			  		if ($codigo=~/u/){
			    		$codigo=~s/u\-//;
			    		$arr_mpos[$i_mpos]=$codigo;
			    		$arr_mpos_name[$i_mpos]=$key;
			    		$i_mpos++;
			  		}
					}
				}elsif ($positivo==2)
				{
					#Si es un estado
					#print "ESTADOOOOOOOOOOOOOOOOOOOOOOOOOO\n";
					$linea_archivo =~ s/$remplazo/<edo_$value>$remplazo<\/edo>/gi;
			
					@codigos=split(/\,/,$value);
					foreach $codigo(@codigos){
						if($codigo=~/e\-/){
							$codigo=~s/e\-//g;
							$arr_edos[$i_edos]=$codigo;
							$arr_edos_name[$i_edos]=$key;
							$i_edos++;
						}
					}
				}else
				{
              	    	#preguntar si tiene varias opciones
					@codigos=split(/\,/,$value);
					foreach $codigo(@codigos){
		    		if ($codigo=~/u/){
							$codigo=~s/u\-//;
							$arr_mpos[$i_mpos]=$codigo;
							$arr_mpos_name[$i_mpos]=$key;
							$i_mpos++;
		    		}else{
							$codigo=~s/e\-//;
							$arr_edos[$i_edos]=$codigo;
							$arr_edos_name[$i_edos]=$key;
							$i_edos++;
		    		}
					}
					$value=~s/u\-//g;	$value=~s/e\-//g;
		
					#$linea_archivo =~ s/$key\./<lugar_$value>$key2<\/lugar>\./gi;
					#$linea_archivo =~ s/$key /<lugar_$value>$key2<\/lugar> /gi;
					#$linea_archivo =~ s/$key\,/<lugar_$value>$key2<\/lugar>\,/gi;
		
					$linea=~s/ $key\./ /gi;	$linea=~s/ $key / /gi;	$linea=~s/ $key\,/ /gi;
					#imprime el nombre del mpo o edo y su c\u00F3digo
					#print $key2."\t$value\t";
								}					
							}
						}#fin for each key
						
						$l_edos_encontrados="";
						$l_edos_encontrados_cod="";
						my %hash1 = ();
						for ($i=0; $i<$i_edos; $i++){
							#$l_edos_encontrados=$l_edos_encontrados."|".$l_cod{$arr_edos[$i]};
							if (! exists $estadosHash1{$arr_edos[$i]}){
								$estadosEncontrados = $estadosEncontrados."\t".$arr_edos[$i]."-".$arr_edos_name[$i];
								$estadosCodEncontrados = $estadosCodEncontrados."\t".$arr_edos[$i];
								$estadosHash1{$arr_edos[$i]}="ok";
								print "\tEdo: ". $arr_edos_name[$i]."\t".$arr_edos[$i]."\t";
							}
							
							if (! exists $hash1{$arr_edos[$i]}){	    				
								$l_edos_encontrados=$l_edos_encontrados."\t".$arr_edos[$i]."-".$arr_edos_name[$i];
								$l_edos_encontrados_cod=$l_edos_encontrados_cod."\t".$arr_edos[$i];
								$hash1{$arr_edos[$i]}="ok";
							}
						}
						$l_edos_encontrados =~ s/\\//g;
						
						$l_mpos_encontrados="";
						$l_mpos_encontrados_cod="";
						my %hash1 = ();
						for ($i=0; $i<$i_mpos; $i++){
							#$l_mpos_encontrados=$l_mpos_encontrados."|".$l_cod{$arr_mpos[$i]};
							if (! exists $municipiosHash1{$arr_mpos[$i]}){
								$municipiosEncontrados = $municipiosEncontrados."\t".$arr_mpos[$i]."-".$arr_mpos_name[$i];
								$municipiosCodEncontrados = $municipiosCodEncontrados."\t".$arr_mpos[$i];
								$municipiosHash1{$arr_mpos[$i]}="ok";
							}
							if (! exists $hash1{$arr_mpos[$i]}){	    				
								$l_mpos_encontrados=$l_mpos_encontrados."\t".$arr_mpos[$i]."-".$arr_mpos_name[$i];
								$l_mpos_encontrados_cod=$l_mpos_encontrados_cod."\t".$arr_mpos[$i];
								$hash1{$arr_mpos[$i]}="ok";
							}
						}
						#$l_mpos_encontrados =~ s/
						
						#Verifico si centro aparece solo en tabasco
						for ($i=0; $i<$i_mpos; $i++){
	    				#excepci\u00F3n para centro, mal echa
	     				if (27004 == $arr_mpos[$i]){
								if ($l_edos_encontrados!~/tabasco/i){	
									$arr_mpos[$i]=" ";	$arr_mpos_name[$i]="";  
								}
	    				}
	 					}
	return $l_mpos_encontrados.",".$l_mpos_encontrados_cod.",".$l_edos_encontrados.",".$l_edos_encontrados_cod
}