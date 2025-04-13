Algoritmo MayorDeTresNumeros
	
	Definir num_1, num_2, num_3, numMayor Como Real
	
	Escribir 'inserte el numero 1'
	leer num_1
	Escribir 'inserte el numero 2'
	leer num_2
	Escribir 'inserte el numero 3'
	leer num_3
	
	numMayor <- num_1;
	
	
    si(numMayor < num_2) Entonces
		numMayor <- num_2;
	FinSi
	
	si(numMayor < num_3) Entonces
		numMayor <- num_3;
	FinSi
	
	Escribir'El numero mayor es el ' , numMayor
FinAlgoritmo