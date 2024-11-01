Feature: Compra de entradas
  Como asistente, quiero poder comprar entradas para eventos de manera segura y rápida, utilizando tecnología blockchain, para evitar problemas al adquirir boletos, garantizar la transparencia en las transacciones y asegurar que las entradas no puedan ser falsificadas o duplicadas.

  Scenario: Compra de entrada exitosa utilizando blockchain
    Given el asistente ha seleccionado un evento con entradas disponibles,
    When completa el proceso de compra utilizando tecnología blockchain,
    Then el sistema confirma la compra, emite un ticket digital seguro y registra la transacción en la blockchain para garantizar la transparencia.

    Examples:
      | evento                | método de pago | saldo disponible |
      | Concierto Lima 2024   | blockchain     | 100              |
      | Festival Arequipa     | blockchain     | 200              |

  Scenario: Compra fallida por falta de saldo
    Given el asistente ha seleccionado un evento y está en proceso de compra,
    When intenta realizar el pago, pero no tiene saldo suficiente,
    Then el sistema muestra un mensaje de error indicando que el pago no se pudo completar y permite reintentar con otro método de pago.

    Examples:
      | evento                | método de pago | saldo disponible |
      | Concierto Lima 2024   | tarjeta        | 0               |
      | Festival Arequipa     | criptomoneda   | 10              |


  Scenario: Validación de entradas duplicadas
    Given el asistente ya ha comprado una entrada para el mismo evento,
    When intenta comprar otra entrada para el mismo evento,
    Then el sistema bloquea la compra y muestra un mensaje indicando que ya tiene una entrada para ese evento, evitando duplicados.

    Examples:
      | evento                | entradas compradas |
      | Concierto Lima 2024   | 1                  |
      | Festival Arequipa     | 1                  |
