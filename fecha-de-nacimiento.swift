import Foundation

print("Ingresa tu fecha de nacimiento (en el formato YYYY-MM-DD):")
let fechaNacimiento = readLine()

func convertirFecha(fechaNacimiento: String) -> Date? {
    let dateFormatter = formatearFecha()
    return dateFormatter.date(from: fechaNacimiento)
}

func formatearFecha() -> DateFormatter {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter
}

func calcularEdad(fechaNacimiento: Date) -> Int? {
    let calendar = Calendar.current
    let ageComponents = calendar.dateComponents([.year], from: fechaNacimiento, to: Date())
    let edad = ageComponents.year
    return edad
}

func imprimirInformacion() {
    if let fechaNacimiento = fechaNacimiento, let fechaConvertida = convertirFecha(fechaNacimiento: fechaNacimiento) {
        if let edad = calcularEdad(fechaNacimiento: fechaConvertida) {
            print("Tienes \(edad) años.")
        }
    }
}

imprimirInformacion()
