Feature: Creación del evento
  Como organizador, quiero crear y gestionar mis eventos fácilmente en la plataforma para promover mis actividades a una audiencia más amplia.

  Scenario: Creación de evento exitosa
    Given el organizador desea crear un evento
    When completa los campos obligatorios (nombre, descripción, fecha, etc.) y hace click en el botón "Crear evento"
    Then el sistema guarda el evento y lo publica en la plataforma para que sea visible a los asistentes

    Examples:
      | nombre del evento        | fecha       | ubicación |
      | Concierto Lima 2024      | 2024-05-12  | Lima      |
      | Festival Arequipa        | 2024-10-25  | Arequipa  |

  Scenario: Creación fallida por información incompleta
    Given el organizador intenta crear un evento
    When no completa todos los campos obligatorios
    Then el sistema muestra un mensaje de error indicando qué información falta para poder crear el evento

    Examples:
      | nombre del evento | descripción | fecha       | ubicación  | precio |  
      | Concierto Lima    |             | 2024-05-12  | Lima       | 50     |
      | Festival          |             | 2024-10-25  | Arequipa   | 100    |

  Scenario: Edición del evento
    Given el organizador ha creado un evento
    When desea modificar la información del evento
    Then el sistema le permite editar los detalles del evento antes de que comience

    Examples:
      | nombre del evento       |
      | Concierto Lima 2024     |
      | Festival Arequipa       |