import SwiftUI

public struct BubbleTabBar: View {
    
    @State private var selectedTab: TabItem.ID?
    private let tabs: [TabItem]
    private let colorSchema: AnyShapeStyle
    private let horizontalPadding: CGFloat
    private let bottomPadding: CGFloat
    private let verticalPadding: CGFloat
    
    public init(
        tabs: [TabItem],
        colorSchema: AnyShapeStyle = AnyShapeStyle(.ultraThinMaterial),
        horizontalPadding: CGFloat = 15,
        bottomPadding: CGFloat = 10,
        verticalPadding: CGFloat = 16
        
    ) {
        self.tabs = tabs
        self._selectedTab = State(initialValue: tabs.first?.id)
        self.colorSchema = colorSchema
        self.horizontalPadding = horizontalPadding
        self.bottomPadding = bottomPadding
        self.verticalPadding = verticalPadding
    }
    
    public var body: some View {
        ZStack {
            if let selectedTab = selectedTab,
               let tab = tabs.first(where: { $0.id == selectedTab }) {
                tab.view
                    .transition(.opacity)
            }
            
            VStack {
                Spacer()
                BubbleTabBarView(
                    selectedTab: $selectedTab,
                    tabs: tabs
                )
                .padding(.vertical, verticalPadding)
                .background(
                    Capsule()
                        .fill(colorSchema)
                        .overlay(
                            Capsule()
                                .stroke(Color.gray.opacity(0.3), lineWidth: 2)
                                
                        )
                        .shadow(color: .black.opacity(0.5), radius: 10, y: 5)
                        .padding(.horizontal, horizontalPadding)
                        .padding(.top, bottomPadding)
                )
            }
            .padding(.bottom, bottomPadding)
        }
        .ignoresSafeArea()
    }
}

