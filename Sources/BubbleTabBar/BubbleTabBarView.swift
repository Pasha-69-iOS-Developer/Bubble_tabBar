// The Swift Programming Language
// https://docs.swift.org/swift-book
import SwiftUI


public struct BubbleTabBarView: View {
    @Binding public var selectedTab: TabItem.ID?
    public let tabs: [TabItem]
    
    public init(selectedTab: Binding<TabItem.ID?>, tabs: [TabItem]) {
        self._selectedTab = selectedTab
        self.tabs = tabs
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            ForEach(tabs) { tab in
                TabBarButton(
                    tab: tab,
                    isSelected: selectedTab == tab.id,
                    action: {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            selectedTab = tab.id
                        }
                    }
                )
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.horizontal, 16)
    }
}

public struct TabBarButton: View {
    let tab: TabItem
    let isSelected: Bool
    let action: () -> Void
    
    public var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                ZStack {
                    if isSelected {
                        Circle()
                            .fill(.ultraThinMaterial)
                            .overlay(
                                Circle()
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                            .frame(width: 55, height: 55)
                            .shadow(color: .black.opacity(0.1), radius: 3, y: 2)
                            .transition(.scale.combined(with: .opacity))
                    }
                    
                    Image(systemName: tab.icon)
                        .font(.system(size: isSelected ? 22 : 20, weight: .medium))
                        .foregroundColor(isSelected ? tab.selectedColor : .gray)
                        .scaleEffect(isSelected ? 1.1 : 1.0)
                }
                .frame(height: 55)
                
                Text(tab.title)
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(isSelected ? tab.selectedColor : .gray)
                    .opacity(isSelected ? 1 : 0.7)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}


public struct BubbleTabBar_Previews: PreviewProvider {
    public static var previews: some View {
        let tabs = [
            TabItem(icon: "house.fill", title: "Home", color: .blue) {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()
            },
            TabItem(icon: "magnifyingglass", title: "Search", color: .green) {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()
            },
            TabItem(icon: "heart.fill", title: "Favorites", color: .pink) {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()
            }
         
        ]
        
        return BubbleTabBar(tabs: tabs)
            .preferredColorScheme(.light)
    }
}
