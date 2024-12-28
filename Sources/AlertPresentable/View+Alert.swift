//
//  View+Alert.swift
//  FTPresentation
//
//  Created by Yu Takahashi on 12/9/24.
//

import SwiftUI

public extension View {
    ///
    /// Show native alert using a class inherited `AlertPresentable` protocol.
    ///
    /// - parameter alertPresentable: A binding class (mostly view model) inherited `AlertPresentable` protocol.
    ///
    func alert(using alertPresentable: Binding<some AlertPresentable>) -> some View {
        modifier(CommonAlert(alertPresentable: alertPresentable))
    }
}

private struct CommonAlert<T: AlertPresentable>: ViewModifier {
    @Binding var alertPresentable: T

    func body(content: Content) -> some View {
        content
            .alert(alertPresentable.alertController.title, isPresented: $alertPresentable.alertController.isPresented) {
                ForEach(alertPresentable.alertController.actions) { action in
                    Button(action.label, role: action.role) {
                        if let action = action.action {
                            action()
                            return
                        }
                        alertPresentable.alertController.isPresented = false
                    }
                }
            } message: {
                Text(alertPresentable.alertController.message)
            }
    }
}
