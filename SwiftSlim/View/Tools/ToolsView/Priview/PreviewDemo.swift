//
//  PreviewDemo.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/22.
//

enum PreviewDemo {
    // 展示
    case text
    case image
    case color
    case divider
    case spacer
    case label
    case labeledContent
    case progressView
    case asyncImage
    case gauge
    case contentUnavailableView
    case emptyView
    
    // 交互
    case button
    case link
    case menu
    case navigationLink
    case shareLink
    case editButton
    
    // 输入
    case textField
    case secureField
    case textEditor
    case toggle
    case slider
    case stepper
    case pickerSegmented
    case pickerMenu
    case pickerWheel
    case datePicker
    case multiDatePicker
    case colorPicker
    
    // 布局
    case vStack
    case hStack
    case zStack
    case lazyVStack
    case lazyHStack
    case grid
    case lazyVGrid
    case lazyHGrid
    case viewThatFits
    case geometryReader
    
    // 容器
    case scrollView
    case list
    case section
    case form
    case group
    case groupBox
    case disclosureGroup
    case controlGroup
    case scrollViewReader
    
    // 数据展示
    case table
    case chart
    
    // 导航
    case tabView
    case navigationStack
    case navigationSplitView
    
    // 呈现
    case sheet
    case alert
    case fullScreenCover
    case popover
    case confirmationDialog
    
    // 媒体 / 系统能力
    case map
    case photosPicker
    case videoPlayer
    
    // 绘图
    case canvas
    
    // 形状
    case circle
    case rectangle
    case roundedRectangle
    case capsule
    case ellipse
    case unevenRoundedRectangle
    case containerRelativeShape
    case path
}
