import SwiftUI

public struct TabItem: Identifiable, Hashable {
    public let id = UUID()
    public let icon: String
    public let title: String
    public let selectedColor: Color
    public let view: AnyView
    
    public init<V: View>(
        icon: String,
        title: String,
        color: Color = .blue,
        @ViewBuilder view: () -> V
    ) {
        self.icon = icon
        self.title = title
        self.selectedColor = color
        self.view = AnyView(view())
    }
    
    public static func == (lhs: TabItem, rhs: TabItem) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
