import SwiftUI

public struct TabItem: Identifiable {
    public let id: String
    public let icon: String
    public let title: String
    public let selectedColor: Color
    public let view: AnyView
    
    public init(
        id: String = "\(UUID().uuidString)",
        icon: String,
        title: String,
        color: Color,
        view: () -> View
    ) {
        self.id = id
        self.icon = icon
        self.title = title
        self.selectedColor = color
        self.view = AnyView(view())
    }
}

