# Proyecto: Control de Estado con Crédito y Display 7 Seg

## How it works

Este proyecto implementa un sistema de control de estado que utiliza señales de crédito y avance para determinar la transición de estados. Está diseñado para ser controlado mediante entradas digitales (`ui_in`) y proporcionar una visualización del estado actual en un display de 7 segmentos.

### Componentes:

- **Credito**: Evalúa si hay crédito disponible. Si al menos uno de los bits de entrada `sw_credito` está en alto, la salida `hay_credito` será 1.
- **ControlEstado**: Decide el nuevo estado en función del estado actual, si hay crédito, y si se activa la señal de avance.
- **Display7Seg**: Convierte el valor numérico del estado actual a un patrón para display de 7 segmentos.

### Lógica:

1. El sistema recibe como entrada:
   - 4 bits de crédito (`ui[7:4]`)
   - 1 bit de avance (`ui[3]`)
   - 3 bits para definir el estado deseado (`ui[2:0]`)
2. Si hay crédito y se activa la señal de avance, se actualiza el estado.
3. El estado actual se representa visualmente en un display de 7 segmentos (`uo[7:1]`).
4. Un bit (`uo[0]`) indica si hay crédito activo.

---

## Inputs

| Pin   | Nombre lógico | Descripción                       |
|-------|----------------|-----------------------------------|
| ui[7] | sw_credito[3]  | Bit 3 del crédito                 |
| ui[6] | sw_credito[2]  | Bit 2 del crédito                 |
| ui[5] | sw_credito[1]  | Bit 1 del crédito                 |
| ui[4] | sw_credito[0]  | Bit 0 del crédito                 |
| ui[3] | avance         | Activa el cambio de estado       |
| ui[2] | estado[2]      | Estado bit alto                  |
| ui[1] | estado[1]      | Estado bit medio                 |
| ui[0] | estado[0]      | Estado bit bajo                  |

---

## Outputs

| Pin   | Nombre lógico | Descripción                                 |
|-------|----------------|---------------------------------------------|
| uo[0] | hay_credito    | Indica si hay crédito                      |
| uo[1] | seg[0]         | Segmento A del display 7 segmentos         |
| uo[2] | seg[1]         | Segmento B                                 |
| uo[3] | seg[2]         | Segmento C                                 |
| uo[4] | seg[3]         | Segmento D                                 |
| uo[5] | seg[4]         | Segmento E                                 |
| uo[6] | seg[5]         | Segmento F                                 |
| uo[7] | seg[6]         | Segmento G                                 |

---

## Bidirectional Pins

No se utilizan pines bidireccionales en este proyecto (`uio[7:0]` están deshabilitados).

---

## Author

OscarRP1091
