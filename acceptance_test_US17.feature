Feature: Confirmación de compra
  Como asistente, quiero recibir una confirmación y un ticket digital tras realizar mi compra para garantizar que mi compra fue exitosa.

  Scenario: Confirmación de compra exitosa
    Given el asistente ha completado la compra de una entrada
    When finaliza la transacción
    Then el sistema envía un correo electrónico con la confirmación y genera un ticket digital para su acceso al evento

    Examples:
      | evento                | método de confirmación |
      | Concierto Lima 2024   | correo electrónico     |
      | Festival Arequipa     | SMS                    |

  Scenario: Compra sin confirmación
    Given el asistente ha realizado una compra, pero ocurre un error en el sistema
    When no recibe una confirmación de compra
    Then el sistema muestra un mensaje de error y permite reintentar el proceso o contactar al soporte

    Examples:
      | evento                | error    |
      | Concierto Lima 2024   | 500      |
      | Festival Arequipa     | 404      |

  Scenario: Reenviar confirmación de compra
    Given el asistente ha realizado la compra, pero ha perdido el correo de confirmación
    When accede a la sección de "Mis compras"
    Then el sistema le permite reenviar el correo de confirmación y visualizar el ticket digital desde la aplicación

    Examples:
      | usuario | evento                |
      | Carlos  | Concierto Lima 2024   |
      | Ana     | Festival Arequipa     |