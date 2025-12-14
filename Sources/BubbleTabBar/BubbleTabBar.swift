// The Swift Programming Language
// https://docs.swift.org/swift-book
import SwiftUI

public struct BubbleTabBar: View {
    @Binding public var selectedTab: UUID?
    public let tabs: [TabItem]
    private let backgroundColor: Color
    
    public init(selectedTab: Binding<UUID?>, tabs: [TabItem], backgroundColor: Color = .purple) {
        self._selectedTab = selectedTab
        self.tabs = tabs
        self.backgroundColor = backgroundColor
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
        .padding(.vertical, 12)
        .background(
            GlassBackground(backgroundColor: backgroundColor)
                .shadow(color: .black.opacity(0.1), radius: 10, y: 5)
        )
        .padding(.horizontal, 20)
    }
}

struct TabBarButton: View {
    let tab: TabItem
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
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

struct GlassBackground: View {
    
    let backgroundColor: Color
    
    init(backgroundColor: Color) {
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        Capsule()
            .fill(.ultraThinMaterial)
            .overlay(
                Capsule()
                    .stroke(Color.gray.opacity(0.3), lineWidth: 2)
            )
    }
}
