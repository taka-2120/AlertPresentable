//
//  AlertPresentableProtocol.swift
//  FTPresentation
//
//  Created by Yu Takahashi on 12/9/24.
//

///
/// `AlertPresentable` protocol is required when you use `alert(using: AlertPresentable)` modifier
/// This protocol includes `alertController` variable to configure all necessary structs and values.
///
public protocol AlertPresentable {
    ///
    /// `AlertController` includes functions to show, necessary variables, and structs which configure alert's actions and mode.
    ///
    var alertController: AlertController { get set }
}
