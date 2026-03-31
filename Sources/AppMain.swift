import SwiftUI

@main
struct AlertApp: App {
    var body: some Scene {
        Window("Alert 警告弹窗", id: "main") {
            ContentView()
        }
        .defaultSize(width: 500, height: 450)
    }
}
