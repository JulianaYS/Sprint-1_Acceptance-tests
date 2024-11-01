Feature: Registro de usuario
  Como usuario, quiero poder registrarme en la plataforma para acceder a sus beneficios.

  Scenario: Registro de cuenta exitoso
    Given el usuario ingresa correctamente su nombre, correo electrónico y contraseña válidos
    When hace click en el botón "Registrar"
    Then su cuenta se crea exitosamente y se le envía un correo electrónico de confirmación

    Examples:
      | nombre  | correo                  | contraseña |
      | Carlos  | carlos@example.com      | pass1234   |
      | Ana     | ana@example.com         | pass5678   |

  Scenario: Registro de cuenta fallido por correo registrado
    Given el usuario ingresa un correo electrónico que ya está registrado
    When hace click en el botón "Registrar"
    Then el sistema muestra un mensaje de error indicando que el correo electrónico ya está en uso

    Examples:
      | correo               |
      | carlos@example.com   |
      | ana@example.com      |

  Scenario: Registro de cuenta fallido por campos incompletos
    Given el usuario no completa todos los campos obligatorios
    When intenta registrarse
    Then el sistema muestra un mensaje indicando que debe completar todos los campos obligatorios

    Examples:
      | nombre  | correo                | contraseña |
      | Carlos  |                       | pass1234   |
      |         | ana@example.com       | pass5678   |
