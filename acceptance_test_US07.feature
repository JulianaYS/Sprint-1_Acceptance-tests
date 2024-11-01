Feature: Búsqueda de eventos
  Como asistente, quiero poder buscar eventos de diferentes categorías para encontrar actividades que se adapten a mis intereses.

  Scenario: Búsqueda de eventos exitosa
    Given el asistente ingresa una palabra clave en el campo de búsqueda
    When hace click en el ícono o en el botón "Buscar"
    Then el sistema muestra una lista de eventos que coinciden con la palabra clave

    Examples:
      | palabra clave    |
      | tecnología       |
      | música           |
      | deportes         |

  Scenario: Búsqueda fallida por falta de coincidencias
    Given el asistente ingresa una palabra clave que no tiene eventos asociados
    When hace click en el ícono o en el botón "Buscar"
    Then el sistema muestra un mensaje indicando que no se encontraron eventos que coincidan con la búsqueda

    Examples:
      | palabra clave    |
      | viaje espacial   |
      | submarinismo     |
      | astronomía       |

  Scenario: Búsqueda con sugerencias de autocompletar
    Given el asistente está escribiendo una palabra clave en el campo de búsqueda
    When escribe al menos tres letras
    Then el sistema muestra sugerencias basadas en las palabras clave más populares relacionadas con lo que está escribiendo

    Examples:
      | palabra clave |
      | cine          |
      | conferencias  |
      | workshop      |
