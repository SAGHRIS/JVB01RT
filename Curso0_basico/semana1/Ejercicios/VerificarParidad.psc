Algoritmo VerificarParidad
	
	Escribir "Escribir un numero: "
	Definir num Como Entero
	Leer num
	
	Mientras num <= 0 Hacer
		Escribir "escribir un numero mayor que 0"
		leer num		
	Fin Mientras
	
	si num mod 2 = 0 Entonces
		Escribir "El numero " num " es par"
	SiNo
		Escribir "El numero " num " es impar"
	FinSi
	
FinAlgoritmo
