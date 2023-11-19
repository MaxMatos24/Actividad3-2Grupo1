# Función para convertir un número romano a decimal
def romano_a_arabigo(numero_romano):
    # Verifica si el número romano es válido
    if not es_numero_romano_valido(numero_romano):
        return "El número romano no es válido."

    total = 0
    valor_anterior = 0
    for letra in numero_romano:
        # Asigna el valor decimal correspondiente a la letra romana
        if letra == 'I':
            valor_actual = 1
        elif letra == 'V':
            valor_actual = 5
        elif letra == 'X':
            valor_actual = 10
        elif letra == 'L':
            valor_actual = 50
        elif letra == 'C':
            valor_actual = 100
        elif letra == 'D':
            valor_actual = 500
        elif letra == 'M':
            valor_actual = 1000

        # Si el valor anterior es menor que el valor actual, se resta el doble del valor anterior
        if (valor_anterior == 1 and (valor_actual == 5 or valor_actual == 10)):
            total -= valor_anterior * 2
        elif (valor_anterior == 10 and (valor_actual == 50 or valor_actual == 100)):
            total -= valor_anterior * 2
        elif (valor_anterior == 100 and (valor_actual == 500 or valor_actual == 1000)):
            total -= valor_anterior * 2

        # Se suma el valor actual al total
        total += valor_actual
        
        # El valor actual se convierte en el valor anterior para la próxima iteración
        valor_anterior = valor_actual
    return total

# Función para verificar si un número romano es válido
def es_numero_romano_valido(numero_romano):
    numeros_romanos = ['I', 'V', 'X', 'L', 'C', 'D', 'M']
    numeros_romanos_repetibles = ['I', 'X', 'C', 'M']
    numeros_romanos_no_repetibles = ['V', 'L', 'D']
    max_repeticiones = 3
   
    # Itera sobre cada letra en el número romano
    for i in range(len(numero_romano)):
        # Si la letra no es un número romano válido, devuelve False
        if numero_romano[i] not in numeros_romanos:
            return False
        # Si la letra es repetible y se repite más de las veces permitidas, devuelve False
        if numero_romano[i] in numeros_romanos_repetibles:
            repeticiones = numero_romano.count(numero_romano[i])
            if repeticiones > max_repeticiones:
                return False
        # Si la letra no es repetible y se repite más de una vez, devuelve False    
        if numero_romano[i] in numeros_romanos_no_repetibles:
            repeticiones = numero_romano.count(numero_romano[i])
            if repeticiones > 1:
                return False
    return True

# Solicita al usuario que introduzca un número romano
numero_romano = input("Introduce un número romano: ")
# Imprime el resultado de la conversión de romano a decimal
print(romano_a_arabigo(numero_romano))
