Proceso RomanosArabigos
    // Definimos las variables
    Definir numeroRomano Como Caracter;
    Definir numerosRomanos Como Caracter;
    Definir numerosArabigos Como Entero;
    Definir valorTotal Como Entero;
    Definir i Como Entero;
    Definir longi Como Entero;
    Definir valorActual Como Entero;
    Definir valorSiguiente Como Entero;
    Definir maxRepeticiones Como Entero;
    Definir repeticiones Como Entero;
    Definir esValido Como Logico;
    Definir continuar Como Logico;
    Definir error Como Logico; // Nueva variable para controlar el mensaje de error
	
    // Creamos los arrays con los valores de los números romanos y los numeros árabes y le asignamos sus valores
	
    Dimension numerosRomanos[7];
	
    numerosRomanos[1] <- "I";
    numerosRomanos[2] <- "V";
    numerosRomanos[3] <- "X";
    numerosRomanos[4] <- "L";
    numerosRomanos[5] <- "C";
    numerosRomanos[6] <- "D";
    numerosRomanos[7] <- "M";
	
    Dimension numerosArabigos[7]
	
    numerosArabigos[1] <- 1;
    numerosArabigos[2] <- 5;
    numerosArabigos[3] <- 10;
    numerosArabigos[4] <- 50;
    numerosArabigos[5] <- 100;
    numerosArabigos[6] <- 500;
    numerosArabigos[7] <- 1000;
	
    // Pedimos al usuario que introduzca un numero romano
    Escribir "Ingrese un número romano:";
    Leer numeroRomano;
	
    // Calculamos la longitud del numero romano
    longi <- Longitud(numeroRomano);
    valorTotal <- 0;
    maxRepeticiones <- 3;
    continuar <- Verdadero;
    error <- Falso; // Inicializamos la variable error en Falso
	
    // Validamos el número romano
    Para i <- 1 Hasta longi Con Paso 1 Hacer
        esValido <- Falso;
        Para j <- 1 Hasta 7 Con Paso 1 Hacer
            Si Subcadena(numeroRomano,i,i) = numerosRomanos[j] Entonces
                esValido <- Verdadero;
            FinSi
        FinPara
        Si esValido = Falso Entonces
            Si error = Falso Entonces // Solo mostramos el mensaje de error si no se ha mostrado antes
                Escribir "El número romano ingresado no es válido.";
                error <- Verdadero; // Marcamos que ya se ha mostrado el mensaje de error
            FinSi
            continuar <- Falso;
        FinSi
		
        repeticiones <- 0;
        Para k <- 1 Hasta longi Con Paso 1 Hacer
            Si Subcadena(numeroRomano,k,k) = Subcadena(numeroRomano,i,i) Entonces
                repeticiones <- repeticiones + 1;
            FinSi
        FinPara
        Si (Subcadena(numeroRomano,i,i) = "I" o Subcadena(numeroRomano,i,i) = "X" o Subcadena(numeroRomano,i,i) = "C" o Subcadena(numeroRomano,i,i) = "M") y repeticiones > maxRepeticiones Entonces
            Si error = Falso Entonces // Solo mostramos el mensaje de error si no se ha mostrado antes
                Escribir "El número romano ingresado no es válido.";
                error <- Verdadero; // Marcamos que ya se ha mostrado el mensaje de error
            FinSi
            continuar <- Falso;
        FinSi
        Si (Subcadena(numeroRomano,i,i) = "V" o Subcadena(numeroRomano,i,i) = "L" o Subcadena(numeroRomano,i,i) = "D") y repeticiones > 1 Entonces
            Si error = Falso Entonces // Solo mostramos el mensaje de error si no se ha mostrado antes
                Escribir "El número romano ingresado no es válido.";
                error <- Verdadero; // Marcamos que ya se ha mostrado el mensaje de error
            FinSi
            continuar <- Falso;
        FinSi
        Si continuar = Verdadero Entonces
			// Establecemos un bucle para los carácteres del número romano
			Para i <- 1 Hasta longi Con Paso 1 Hacer;
				valorActual <- 0;
				valorSiguiente <- 0;
				
				// Determinamos el valor del carácter actual
				Para j <- 1 Hasta 7 Con Paso 1 Hacer;
					Si Subcadena(numeroRomano, i, i) = numerosRomanos[j] Entonces;
						valorActual <- numerosArabigos[j];
					FinSi
				FinPara
				
				// Determinamos el valor numerico del siguiente carácter, si existe
				Si i < longi Entonces;
					Para j <- 1 Hasta 7 Con Paso 1 Hacer;
						Si Subcadena(numeroRomano, i+1, i+1) = numerosRomanos[j] Entonces;
							valorSiguiente <- numerosArabigos[j];
						FinSi
					FinPara
				FinSi
				
				// Decidiendo si sumar o restar el valor actual segun el valor del siguiente carácter
				Si valorActual < valorSiguiente Entonces;
					valorTotal <- valorTotal - valorActual;
				Sino
					valorTotal <- valorTotal + valorActual;
				FinSi
			FinPara
			
			Escribir "El número arábigo equivalente es: ", valorTotal;
		FinSi
    FinPara

FinProceso
