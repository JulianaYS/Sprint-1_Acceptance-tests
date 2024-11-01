Feature: Elección de método de pago
  Como asistente, quiero poder elegir diferentes métodos de pago para tener opciones flexibles al momento de adquirir mis entradas.

  Scenario: Selección exitosa de método de pago
    Given el asistente está en el proceso de compra de entradas
    When selecciona un método de pago (tarjeta, criptomonedas, etc.)
    Then el sistema acepta la opción seleccionada y procede al pago
    
    Examples:
      | método de pago |
      | tarjeta        |
      | criptomoneda   |
      | PayPal         |

  Scenario: Método de pago no aceptado
    Given el asistente selecciona un método de pago que no está habilitado para su ubicación o no es aceptado
    When intenta pagar
    Then el sistema muestra un mensaje de error indicando que el método de pago no es válido y sugiere otras opciones

    Examples:
      | método de pago |
      | cheque         |
      | transferencia  |

  Scenario: Guardar método de pago para futuras compras
    Given el asistente selecciona un método de pago
    When marca la opción de "Guardar método de pago"
    Then el sistema guarda el método de pago de manera segura para facilitar compras futuras

    Examples:
      | usuario | método de pago |
      | Carlos  | tarjeta        |
      | Ana     | criptomoneda   |