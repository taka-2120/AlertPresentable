import AlertPresentable
import SwiftUI

struct ContentView: View {
    @State private var alertController = AlertController()

    var body: some View {
        VStack {
            Button("Error") {
                alertController.showAlert(mode: .error, message: "This is an error dialog.")
            }

            Button("Warning") {
                alertController.showAlert(mode: .warning, message: "This is a warning dialog.")
            }

            Button("Yes / No") {
                alertController.showAlert(
                    title: "Yes/No",
                    message: "This is a yes / no dialog.",
                    actions: [
                        .no,
                        .yes,
                    ]
                )
            }

            Button("Custom Actions") {
                alertController.showAlert(
                    title: "Custom Actions",
                    message: "This is a customized dialog.",
                    actions: [
                        .no,
                        .yes {
                            print("Hello, world!")
                        },
                    ]
                )
            }

            Button("Custom Buttons") {
                alertController.showAlert(
                    title: "Custom Actions",
                    message: "This is a customized dialog.",
                    actions: [
                        .init(label: "Hello", role: .cancel),
                        .init(label: "World", role: .destructive) {
                            print("Hello, world!")
                        },
                    ]
                )
            }
        }
        .padding()
        .alert(using: $alertController)
    }
}

#Preview {
    ContentView()
}
