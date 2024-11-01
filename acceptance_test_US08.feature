Feature: Inscripción a eventos
  Como asistente, quiero poder inscribirme en un evento fácilmente, para asegurar mi asistencia y recibir toda la información necesaria antes del evento.

  Scenario: Inscripción exitosa a un evento
    Given el asistente selecciona un evento disponible y hace click en el botón "Inscribirse"
    When completa la inscripción ingresando la información requerida
    Then el sistema confirma la inscripción y envía un correo con los detalles del evento

    Examples:
      | evento               | nombre  | correo                |
      | Conferencia AI       | Carlos  | carlos@example.com    |
      | Concierto de Jazz    | Ana     | ana@example.com       |

  Scenario: Inscripción fallida por evento lleno
    Given el asistente selecciona un evento lleno
    When intenta inscribirse
    Then el sistema muestra un mensaje de error indicando que el evento ha alcanzado su capacidad máxima y ofrece una lista de eventos similares

    Examples:
      | evento            |
      | Taller de Pintura |
      | Seminario Blockchain |

  Scenario: Inscripción fallida por datos incompletos
    Given el asistente no ha completado todos los campos requeridos para la inscripción
    When intenta inscribirse
    Then el sistema muestra un mensaje de error indicando que faltan datos y bloquea la inscripción hasta que se complete toda la información

    Examples:
      | evento               | nombre  | correo              |
      | Conferencia AI       | Carlos  |                    |
      | Concierto de Jazz    |         | ana@example.com     |
