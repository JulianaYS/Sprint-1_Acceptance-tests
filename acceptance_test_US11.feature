Feature: Filtro en la búsqueda de eventos
  Como asistente, quiero poder filtrar los eventos por fecha, ubicación, tipo y precio para encontrar opciones que se ajusten a mis necesidades.

  Scenario: Aplicación exitosa de filtros
    Given el asistente está buscando eventos
    When selecciona filtros como fecha, ubicación, tipo y precio
    Then el sistema muestra los eventos que coinciden con los filtros aplicados

    Examples:
      | fecha        | ubicación  | tipo       | precio |
      | 2024-05-12   | Lima       | concierto  | 50     |
      | 2024-10-25   | Arequipa   | taller     | 100    |

  Scenario: Búsqueda sin resultados después de aplicar filtros
    Given el asistente aplica filtros demasiado restrictivos
    When hace click en el botón "Aplicar filtros"
    Then el sistema muestra un mensaje indicando que no hay eventos que coincidan con los filtros y sugiere cambiar los criterios de búsqueda

    Examples:
      | fecha      | ubicación | tipo         | precio |
      | 2025-01-01 | Cusco     | festival     | 500    |
      | 2026-12-12 | Piura     | exposición   | 300    |

  Scenario: Eliminación de filtros
    Given el asistente ha aplicado varios filtros y desea ver más opciones
    When hace click en la opción "Eliminar todos los filtros"
    Then el sistema muestra todos los eventos disponibles sin ninguna restricción

    Examples:
      | usuario |
      | Carlos  |
      | Ana     |