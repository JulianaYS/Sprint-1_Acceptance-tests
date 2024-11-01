Feature: Inicio de sesión de usuario
  Como usuario registrado, quiero iniciar sesión para acceder a mi perfil y eventos guardados.

  Scenario: Inicio de sesión exitoso
    Given el usuario ingresa su correo electrónico y contraseña correctos
    When hace click en el botón "Iniciar sesión"
    Then el sistema le permite acceder a su perfil y eventos guardados

    Examples:
      | correo              | contraseña |
      | carlos@example.com  | pass1234   |
      | ana@example.com     | pass5678   |

  Scenario: Inicio de sesión fallido por contraseña incorrecta
    Given el usuario ingresa una contraseña incorrecta
    When intenta iniciar sesión
    Then el sistema muestra un mensaje de error indicando que las credenciales no son correctas

    Examples:
      | correo              | contraseña |
      | carlos@example.com  | wrongpass  |
      | ana@example.com     | 123456     |

  Scenario: Inicio de sesión fallido por cuenta no verificada
    Given el usuario ha registrado una cuenta, pero no ha verificado su correo electrónico
    When intenta iniciar sesión
    Then el sistema muestra un mensaje indicando que debe verificar su cuenta antes de iniciar sesión

    Examples:
      | correo                | contraseña |
      | luis@example.com      | pass1111   |
      | maria@example.com     | pass2222   |
