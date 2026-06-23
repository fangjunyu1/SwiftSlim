//
//  ChartFallbackDemo.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/6/23.
//


import SwiftUI
import Charts

struct ChartFallbackDemo: View {
    
    private struct DemoSales: Identifiable {
        var id: String { month }
        let month: String
        let value: Int
    }
    
    private let chartSales: [DemoSales] = [
        .init(month: "Jan", value: 20),
        .init(month: "Feb", value: 35),
        .init(month: "Mar", value: 28),
        .init(month: "Apr", value: 45)
    ]
    
    private let nums: [Int] = [60, 40, 20, 0]
    
    // 数值最大值
    private let maxValue: CGFloat = 60
    // 绘图区域的高度
    private let plotHeight: CGFloat = 150
    private let labelHeight: CGFloat = 20
    
    var body: some View {
        if #available(iOS 16.0, *) {
            nativeChart
        } else {
            fallbackChart
        }
    }
    
    @available(iOS 16.0, *)
    private var nativeChart: some View {
        Chart(chartSales) { item in
            BarMark(
                x: .value(Text(verbatim: "Month"), item.month),
                y: .value(Text(verbatim: "Value"), item.value)
            )
        }
        .frame(height: 180)
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    private var fallbackChart: some View {
        HStack(alignment: .top, spacing: 3) {
            ZStack(alignment: .top) {
                VStack(spacing: 0) {
                    ZStack(alignment: .bottom) {
                        // 水平实线
                        horizontalLine
                        // 柱状图
                        plotArea
                    }
                    .frame(height: plotHeight)
                    // x 轴标签
                    xAxisLabels
                        .frame(height: labelHeight)
                }
                // 垂直虚线
                verticalDashedLine
                    .frame(height: plotHeight + labelHeight)
            }
            // 刻度线
            scaleLines
                .frame(height: plotHeight)
        }
        .padding(16)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    // 水平竖线
    private var horizontalLine: some View {
        VStack(spacing: 0) {
            ForEach(0..<nums.count, id: \.self) { index in
                Divider()
                if index != nums.count - 1 {
                    Spacer()
                }
            }
        }
    }
    
    // 垂直虚线
    private var verticalDashedLine: some View {
        HStack(spacing: 0) {
            ForEach(0...chartSales.count, id: \.self) { index in
                DashedLine(isVertical: true)
                    .stroke(
                        .gray.opacity(0.5),
                        style: StrokeStyle(
                            lineWidth: 0.5,
                            dash: [2, 1.5]
                        )
                    )
                    .frame(width: 1)

                if index != chartSales.count {
                    Spacer()
                }
            }
        }
    }
    
    // 柱状图
    private var plotArea: some View {
        // 柱状图
        GeometryReader { geo in
            let categoryWidth = geo.size.width / CGFloat(chartSales.count)
            let barWidth = categoryWidth * 0.68

            HStack(alignment: .bottom, spacing: 0) {
                ForEach(chartSales) { item in
                    Rectangle()
                        .fill(.blue)
                        .frame(
                            width: barWidth,
                            height: CGFloat(item.value) / maxValue * plotHeight
                        )
                        .frame(maxWidth: .infinity, alignment: .bottom)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        }
    }
    
    private var xAxisLabels: some View {
        HStack(spacing: 0) {
            ForEach(chartSales) { item in
                Text(verbatim: item.month)
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity)
            }
        }
    }
    
    // 刻度线
    private var scaleLines: some View {
        VStack {
            ForEach(Array(nums.enumerated()), id: \.offset) { index, num in
                Text(verbatim: "\(num)")
                    .font(.system(size: 10))
                    .foregroundStyle(Color.gray)
                
                if index != nums.count - 1 {
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ScrollView {
        ChartFallbackDemo()
    }
}
