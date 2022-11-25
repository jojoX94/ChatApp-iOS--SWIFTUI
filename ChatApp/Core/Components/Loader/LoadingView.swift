//
//  LoadingView.swift
//  ChatApp
//
//  Created by Madiapps on 25/11/2022.
//

import SwiftUI


public struct LoadingView: View {
    @State var isAnimating: Bool = false
    public let count: UInt
    public let width: CGFloat
    public let spacing: CGFloat

    public init(count: UInt = 3, width: CGFloat = 2, spacing: CGFloat = 1) {
        self.count = count
        self.width = width
        self.spacing = spacing
    }

    public var body: some View {
        VStack {
            GeometryReader { geometry in
                ForEach(0..<Int(count)) { index in
                    item(forIndex: index, in: geometry.size)
                        .rotationEffect(isAnimating ? .degrees(360) : .degrees(0))
                        .animation(
                            Animation.default
                                .speed(Double.random(in: 0.2...0.5))
                                .repeatCount(isAnimating ? .max : 1, autoreverses: false)
                        )
                }
            }
            .onAppear { isAnimating = true }
            .onDisappear { isAnimating = false }
            .aspectRatio(contentMode: .fit)
        }
        .frame(width: 110, height: 110)
    }

    private func item(forIndex index: Int, in geometrySize: CGSize) -> some View {
        Group { () -> Path in
            var p = Path()
            p.addArc(center: CGPoint(x: geometrySize.width/2, y: geometrySize.height/2),
                     radius: geometrySize.width/2 - width/2 - CGFloat(index) * (width + spacing),
                     startAngle: .degrees(0),
                     endAngle: .degrees(Double(Int.random(in: 120...300))),
                     clockwise: true)
            return p.strokedPath(.init(lineWidth: width))
        }
        .frame(width: geometrySize.width, height: geometrySize.height)
    }
}



