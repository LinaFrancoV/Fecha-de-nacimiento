import Foundation

print("Ingresa tu fecha de nacimiento (en el formato YYYY-MM-DD):")
let fechaNacimiento = readLine()

func calcularEdad(fechaNacimiento: String) -> Int? {
    let dateFormatter = FormatoFecha()
    if let fechaNacimientoDate = dateFormatter.date(from: fechaNacimiento) {
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: fechaNacimientoDate, to: Date())
        let edad = ageComponents.year
        return edad
    } else {
        print("La fecha de nacimiento ingresada no es válida.")
        return nil
    }
}

func FormatoFecha() -> DateFormatter {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter
}

func calcularDiaSemana(fechaNacimiento: String) -> String? {
    let dateFormatter = FormatoFecha()
    if let fechaNacimientoDate = dateFormatter.date(from: fechaNacimiento) {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.weekday], from: fechaNacimientoDate)
        if let weekday = components.weekday {
            let weekdayNames = dateFormatter.weekdaySymbols
            return weekdayNames[weekday - 1]
        } else {
            return "Día de la semana no disponible."
        }
    } else {
        print("La fecha de nacimiento ingresada no es válida.")
        return nil
    }
}

func imprimirInformacion() {
    if let fechaNacimiento = fechaNacimiento,
        let edad = calcularEdad(fechaNacimiento: fechaNacimiento),
        let diaSemana = calcularDiaSemana(fechaNacimiento: fechaNacimiento) {
        print("Tu fecha de nacimiento es un \(diaSemana). Tienes \(edad) años.")
    }
}

imprimirInformacion()