//
//  Helpers.swift
//  Combi
//
//  Created by Kevin Harijanto on 25/07/22.
//

import SwiftUI

//MARK: Custom Corner
struct CustomCorner: Shape {
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}

// MARK: ScaledButton Style
struct ScaledButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.94 : 1)
            .animation(.easeInOut, value: configuration.isPressed)
    }
}

// MARK: Paging View
public struct PagingView<Views: View>: View {
  public typealias Config = _PagingViewConfig
  public typealias PageIndex = _VariadicView.Children.Index

  private let tree: _VariadicView.Tree<Root, Views>

  public init(
    config: Config = Config(),
    page: Binding<PageIndex>? = nil,
    @ViewBuilder _ content: () -> Views
  ) {
    tree = _VariadicView.Tree(
      Root(config: config, page: page),
      content: content
    )
  }

  public init(
    direction: _PagingViewConfig.Direction,
    page: Binding<PageIndex>? = nil,
    @ViewBuilder _ content: () -> Views
  ) {
    tree = _VariadicView.Tree(
      Root(config: .init(direction: direction), page: page),
      content: content
    )
  }

  public var body: some View { tree }

  struct Root: _VariadicView.UnaryViewRoot {
    let config: Config
    let page: Binding<PageIndex>?

    func body(children: _VariadicView.Children) -> some View {
      _PagingView(
        config: config,
        page: page,
        views: children
      )
    }
  }
}

extension View {
    // MARK: Safe Area Value
    func safeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene
        else { return .zero }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets
        else { return .zero }
        
        return safeArea
    }
    
    // MARK:: ScrollView Offset
    func offset(offset: Binding<CGFloat>)-> some View {
        return self
            .overlay {
                GeometryReader { proxy in
                    let minY = proxy.frame(in: .named("SCROLL")).minY
                    
                    Color.clear
                        .preference(key: OffsetKey.self, value: minY)
                }
                .onPreferenceChange(OffsetKey.self) { value in
                    offset.wrappedValue = value
                }
            }
    }
}

// MARK: Offset Key
struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
