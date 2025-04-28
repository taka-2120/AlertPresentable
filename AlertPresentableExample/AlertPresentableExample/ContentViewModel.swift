import AlertPresentable
import SwiftUI

@MainActor @Observable
final class ContentViewModel: AlertPresentable {
    var alertController = AlertController()
}
