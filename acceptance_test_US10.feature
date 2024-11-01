Feature: Visualizar eventos inscritos
  Como asistente, quiero ver una lista de los eventos a los que estoy inscrito, para mantenerme informado de los detalles y fechas importantes de los eventos que me interesan.

  Scenario: Visualización de eventos inscritos
    Given el asistente está inscrito en varios eventos
    When accede a la sección "Mis eventos"
    Then el sistema muestra una lista de todos los eventos a los que está inscrito, con fechas y detalles relevantes

    Examples:
      | usuario | eventos                 |
      | Carlos  | Conferencia AI, Música  |
      | Ana     | Concierto Jazz, Arte    |

  Scenario: Sin eventos inscritos
    Given el asistente no está inscrito en ningún evento
    When accede a la sección "Mis eventos"
    Then el sistema muestra un mensaje indicando que no hay eventos inscritos y sugiere explorar eventos disponibles

    Examples:
      | usuario |
      | Carlos  |
      | Ana     |

  Scenario: Ver detalles de eventos pasados y futuros
    Given el asistente está inscrito en eventos pasados y futuros
    When accede a la sección "Mis eventos"
    Then el sistema separa los eventos en categorías de "Próximos eventos" y "Eventos pasados" para facilitar la navegación

    Examples:
      | usuario | próximos        | pasados            |
      | Carlos  | Conferencia AI  | Taller Pintura     |
      | Ana     | Seminario Jazz  | Concierto Banda    |
