# AlertPresentable

## Description

Show native alerts from ViewModel with ease.

## Requirements

- Swift 6.0 or later
- SwiftUI
- macOS 14, iOS 17, tvOS 17, watchOS 10, macCatalyst 17 or later

## Installation

### via SPM (Swift Package Manager)

- **Using GUI**

  Type the URL bellow to add this package to your project.

  ```shell
  https://github.com/taka-2120/AlertPresentable.git
  ```

- **Add to `Package.swift` manually**

  1. Add this package to the dependencies.

      ```swift
        dependencies: [
            .package(
                url: "https://github.com/taka-2120/AlertPresentable.git",
                .upToNextMajor(from: "1.0.0")
            ),
        ],
      ```

  2. Add this package product to your target.

      ```swift
      targets: [
          .target(
              name: "YourTarget",
              dependencies: [
                  .product(name: "AlertPresentable", package: "AlertPresentable"),
              ]
          ),
      ]
      ```

## Usage

1. Setup `AlertController`

    - Using View Model
    
        a. Add `AlertPresentable` protocol to your class (like view model).

            ```swift
            import AlertPresentable
            
            @Observable
            class YourClass: AlertPresentable {
                ...
            }
            ```

        b. Add a necessary variable to your class.

            ```swift
            import AlertPresentable
            
            @Observable
            class YourViewModel: AlertPresentable {
                var alertController = AlertController()
            }
            ```
            
        c. Add `alert` modifier to your view.

            ```swift
            import AlertPresentable

            struct YourView: View {
                @State private var viewModel = YourViewModel()

                var body: some View {
                    yourView
                        .alert(using: viewModel)
                }
            }
            ```
            
    - Using View Only (Above 1.1.0 or later)
        
        ```swift
        import AlertPresentable

        struct YourView: View {
            @State private var alertController = AlertController()

            var body: some View {
                yourView
                    .alert(using: $alertController)
            }
        }
        ```
    
2. Call `showAlert` function to show the alert.

    ```swift
    // Simplest alert (Show OK button)
    showAlert(mode: .error, message: error.localizedDescription)
    
    // Normal alert for yes/no question.
    showAlert(mode: .warning, message: "Are you sure to delete this image?", action: [
        .no, 
        .yes {
            // Delete the image...
        }
    ])
    
    // Complicated alert with custom title and custom actions.
    showAlert(title: "News", message: "New feature arrived!", action: [
        .init(label: "Don't ask me again", role: .destructive) {
            // Set doNotAskAgain flag...
        },
        .init(label: "Details...") {
            // Transition to the news page...
        }
    ])
    ```
