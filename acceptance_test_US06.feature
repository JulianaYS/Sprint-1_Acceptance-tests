Feature: Cerrar sesión
  Como usuario quiero poder cerrar sesión en la aplicación cuando termine de utilizarla, para proteger mi información y privacidad.

  Scenario: Cerrar sesión exitosa
    Given el usuario está autenticado y ha terminado de utilizar la aplicación
    When hace click en el botón "Cerrar sesión"
    Then el sistema cierra la sesión y redirige al usuario a la pantalla de inicio de sesión

    Examples:
      | usuario  |
      | Carlos   |
      | Ana      |

  Scenario: Cerrar sesión fallido por sesión caducada
    Given la sesión del usuario ha caducado
    When intenta cerrar sesión
    Then el sistema muestra un mensaje indicando que la sesión ya había caducado y redirige al usuario a la pantalla de inicio

    Examples:
      | usuario  |
      | Carlos   |
      | Ana      |

  Scenario: Cerrar sesión desde múltiples dispositivos
    Given el usuario ha iniciado sesión en varios dispositivos
    When cierra sesión desde uno de los dispositivos
    Then el sistema cierra solo la sesión del dispositivo en uso y mantiene las otras sesiones activas

    Examples:
      | usuario  |
      | Carlos   |
      | Ana      |
