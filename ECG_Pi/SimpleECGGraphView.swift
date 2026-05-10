//
//  SimpleECGGraphView.swift
//  ECG_Pi
//
//  Created by NATEz Ekkaluck on 3/30/25.
//


import SwiftUI

struct SimpleECGGraphView: View {
    let data: [Double]

    var body: some View {
        GeometryReader { geo in
            Canvas { context, size in
                guard data.count > 1 else { return }

                let path = Path { path in
                    let width = size.width
                    let height = size.height
                    let stepX = width / CGFloat(data.count - 1)

                    let minY = data.min() ?? 0
                    let maxY = data.max() ?? 1
                    let yRange = maxY - minY

                    func yPosition(_ value: Double) -> CGFloat {
                        let normalized = (value - minY) / yRange
                        return height * (1 - CGFloat(normalized))
                    }

                    path.move(to: CGPoint(x: 0, y: yPosition(data[0])))

                    for i in 1..<data.count {
                        let x = CGFloat(i) * stepX
                        let y = yPosition(data[i])
                        path.addLine(to: CGPoint(x: x, y: y))
                    }
                }

                context.stroke(path, with: .color(.red), lineWidth: 1.5)
            }
        }
    }
}