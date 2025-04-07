import SwiftUI

public extension View {
    ///
    /// Show native alert using a class inherited `AlertPresentable` protocol.
    ///
    /// - parameter alertPresentable: A binding class (mostly view model) inherited `AlertPresentable` protocol.
    ///
    func alert(using alertPresentable: Binding<some AlertPresentable>) -> some View {
        modifier(CommonAlert(alertController: alertPresentable.alertController))
    }

    ///
    /// Show native alert using a `AlertController`.
    ///
    /// - parameter alertController: A binding variable of `AlertController`.
    ///
    func alert(using alertController: Binding<AlertController>) -> some View {
        modifier(CommonAlert(alertController: alertController))
    }
}

private struct CommonAlert: ViewModifier {
    @Binding var alertController: AlertController

    func body(content: Content) -> some View {
        content
            .alert(alertController.title, isPresented: $alertController.isPresented) {
                ForEach(alertController.actions) { action in
                    Button(action.label, role: action.role) {
                        if let action = action.action {
                            action()
                            alertController.isPresented = false
                            return
                        }
                        alertController.isPresented = false
                    }
                }
            } message: {
                Text(alertController.message)
            }
    }
}
