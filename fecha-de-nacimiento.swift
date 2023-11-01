import Foundation

print("Ingresa tu fecha de nacimiento (en el formato YYYY-MM-DD):")
ingresoDeinformaacion()

func ingresoDeinformaacion (){
    if let fechaNacimiento = readLine() {
    if let fechaConvertida = convertirDeTextoAFecha(fechaNacimiento) {
        imprimirInformacionDeEdad(fechaConvertida)
    }
    }
}

func convertirDeTextoAFecha(_ fechaNacimiento: String) -> Date? {
    let dateFormatter = formatearFecha()
    return dateFormatter.date(from: fechaNacimiento)
}

func formatearFecha() -> DateFormatter {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter
}

func calcularEdadUsuario(_ fechaNacimiento: Date) -> Int? {
    let calendar = Calendar.current
    let ageComponents = calendar.dateComponents([.year], from: fechaNacimiento, to: Date())
    let edad = ageComponents.year
    return edad
}

func imprimirInformacionDeEdad(_ fechaNacimiento: Date) {
    if let edad = calcularEdadUsuario(fechaNacimiento) {
        print("Tienes \(edad) años.")
    }
}
