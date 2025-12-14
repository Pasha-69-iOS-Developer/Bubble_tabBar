import SwiftUI


extension Color {
    
    static let systemGroupedBackground = Color.white
}

public struct BubbleTabView: View {
    @State private var selectedTab: UUID?
    private let tabs: [TabItem]
    
    private var backgroundColor: Color = Color.black
    
    
    public init(tabs: [TabItem]) {
        self.tabs = tabs
        self._selectedTab = State(initialValue: tabs.first?.id)
    }
    
    public var body: some View {
        ZStack {
            // Контент страниц
            if let selectedTab = selectedTab,
               let tab = tabs.first(where: { $0.id == selectedTab }) {
                tab.view
                    .transition(.opacity)
                    
            }
            
            VStack {
                Spacer()
                BubbleTabBar(
                    selectedTab: $selectedTab,
                    tabs: tabs,
                    backgroundColor: backgroundColor
                )
                    .padding(.top, 8)
            }
            .padding(.bottom, 10)
        }
        .ignoresSafeArea()
    }
}

