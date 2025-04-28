///
/// `AlertPresentable` protocol is required when you use `alert(using: AlertPresentable)` modifier
/// This protocol includes `alertController` variable to configure all necessary structs and values.
///
@MainActor
public protocol AlertPresentable {
    ///
    /// `AlertController` includes functions to show, necessary variables, and structs which configure alert's actions and mode.
    ///
    var alertController: AlertController { get set }
}
