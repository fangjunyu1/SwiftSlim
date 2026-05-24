//
//  PreviewItemDemoView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/5/24.
//

import SwiftUI

struct PreviewItemDemoView: View {
    @State private var buttonCount = 0  // Button
    @State private var textFieldText = ""   // TextField
    @State private var secureText = ""  // SecureField
    @State private var editorText = "This is TextEditor"    // TextEditor
    @State private var toggleValue = true   // Toggle
    @State private var sliderValue: Double = 50 // Slider
    @State private var stepperValue = 1 // Stepper
    @State private var segmentedSelection = 0   // PickerSegmented
    @State private var menuSelection = "Light"  // PickerMenu
    @State private var wheelSelection = "Apple" // PickerWheel
    @State private var selectedDate = Date()    // DatePicker
    @State private var selectedColor: Color = .blue // ColorPicker
    @State private var isShowDetails = true    // DisclosureGroup
    @State private var tabSelection = 0 // TabView
    @State private var editItems = ["Text", "Image", "Button"]  // EditButton
    @State private var selectedDates: Set<DateComponents> = []  //  MultiDatePicker
    @State private var showSheet = false    //  Sheet
    @State private var showPopover = false  // Popover
    @State private var showAlert = false    //  Alert
    @State private var showConfirmationDialog = false   //  ConfirmationDialog
    
    
    let item: PreviewComponent
    
    // Demo 中的 TabView 使用的页面视图组件
    private func demoPage(title: String, icon: String, color: Color) -> some View {
        RoundedRectangle(cornerRadius: 18, style: .continuous)
            .fill(color.opacity(0.15))
            .overlay(
                VStack(spacing: 10) {
                    Image(systemName: icon)
                        .font(.system(size: 28))
                        .foregroundColor(color)
                    Text(title)
                        .font(.system(size: 18, weight: .bold))
                }
            )
            .padding(.vertical, 4)
    }
    
    // 日期格式
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View {
        switch item.demo {
            
            // MARK: 展示
            // Text
        case .text:
            Text(verbatim: "Hello, SwiftUI")
                .font(.system(size: 24, weight: .semibold))
            
            // Image
        case .image:
            HStack(spacing: 20) {
                Image(systemName: "swift")
                    .font(.system(size: 40))
                    .foregroundColor(.orange)
                
                Image(systemName: "heart.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.pink)
            }
            
            // Label
        case .label:
            VStack(alignment: .leading, spacing: 10) {
                Label(title:  {
                    Text(verbatim: "Favorites")
                }, icon: {
                    Image(systemName: "star.fill")
                })
                Label(title:  {
                    Text(verbatim: "Downloads")
                }, icon: {
                    Image(systemName: "arrow.down.circle.fill")
                })
                Label(title:  {
                    Text(verbatim: "Photos")
                }, icon: {
                    Image(systemName: "photo.fill")
                })
            }
            .foregroundColor(.primary)
            
            // Divider
        case .divider:
            VStack(spacing: 12) {
                Text(verbatim: "Top Content")
                Divider()
                Text(verbatim: "Bottom Content")
            }
            
            // Spacer
        case .spacer:
            HStack {
                Text(verbatim: "Left")
                    .font(.system(size: 16, weight: .semibold))
                
                Spacer()
                
                Text(verbatim: "Right")
                    .font(.system(size: 16, weight: .semibold))
            }
            .padding()
            .background(.gray.opacity(0.12))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            // Color
        case .color:
            HStack(spacing: 16) {
                Color.blue
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                
                Color.purple
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
            }
            
            // ProgressView
        case .progressView:
            VStack(alignment: .leading, spacing: 12) {
                ProgressView(value: 0.30)
                Text(verbatim: "30% Completed")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
            }
            
            // AsyncImage
        case .asyncImage:
            AsyncImage(url: URL(string: "https://picsum.photos/160")) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 120, height: 120)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            // Gauge
        case .gauge:
            CircularGaugeFallback(
                value: 0.65,
                currentValue: "65%",
                color: .blue
            )
            .frame(width: 53)
            
            //  ContentUnavailableView
        case .contentUnavailableView:
            VStack(spacing: 10) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 46))
                    .foregroundStyle(Color.secondary)
                
                VStack {
                    Text(verbatim: "No Results")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text(verbatim: "Try another keyword.")
                        .font(.subheadline)
                        .foregroundStyle(Color.gray)
                }
            }
            
            // MARK: 交互
            // Button
        case .button:
            VStack(spacing: 12) {
                Button(action: {
                    buttonCount += 1
                }, label: {
                    Text(verbatim: "Tap Me")
                })
                .buttonStyle(.borderedProminent)
                
                Text(verbatim: "Count: \(buttonCount)")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
            }
            
            // Link
        case .link:
            Link(destination: URL(string: "https://fangjunyu.com/")!) {
                Text(verbatim: "Open Fang Junyu")
                    .font(.system(size: 16, weight: .semibold))
            }
            
            // Menu
        case .menu:
            Menu {
                Button(action: {
                    
                }, label: {
                    Text(verbatim: "Edit")
                })
                Button(action: {
                    
                }, label: {
                    Text(verbatim: "Share")
                })
                Button(role: .destructive) {
                    
                } label: {
                    Text(verbatim: "Delete")
                }
            }
            label: {
                Label(title: {
                    Text(verbatim: "More Actions")
                        .font(.system(size: 16, weight: .semibold))
                }, icon: {
                    Image(systemName: "ellipsis.circle")
                })
            }
            
            // NavigationLink
        case .navigationLink:
            NavigationLink {
                Text(verbatim: "Detail Page")
                    .font(.largeTitle.bold())
            } label: {
                HStack {
                    Image(systemName: "arrow.right.circle.fill")
                    Text(verbatim: "Go to Detail")
                    Spacer()
                }
                .padding()
                .background(Color.blue.opacity(0.12))
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
            }
            .buttonStyle(.plain)
            
            //  ShareLink
        case .shareLink:
            if #available(iOS 16.0, macOS 13.0, *) {
                if let url = URL(string: "https://www.apple.com/swift/") {
                    ShareLink(item: url) {
                        Label {
                            Text(verbatim: "Share")
                        } icon: {
                            Image(systemName: "square.and.arrow.up")
                        }
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.horizontal, 18)
                        .padding(.vertical, 10)
                        .background(.blue.opacity(0.14))
                        .clipShape(Capsule())
                    }
                }
            } else {
                Text(verbatim: "Requires iOS 16 or later")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            //  EditButton
        case .editButton:
            if #available(iOS 16.0, macOS 13.0, *) {
                NavigationStack {
                    List {
                        ForEach(editItems, id: \.self) { item in
                            Text(verbatim: item)
                        }
                        .onDelete { offsets in
                            editItems.remove(atOffsets: offsets)
                        }
                    }
                    .navigationTitle("Items")
                    .toolbar {
                        EditButton()
                    }
                }
                .frame(width: 280, height: 220)
            } else {
                NavigationView {
                    List {
                        ForEach(editItems, id: \.self) { item in
                            Text(verbatim: item)
                        }
                        .onDelete { offsets in
                            editItems.remove(atOffsets: offsets)
                        }
                    }
                    .navigationTitle("Items")
                    .toolbar {
                        EditButton()
                    }
                }
                .frame(width: 280, height: 220)
            }
            
            //  ControlGroup
        case .controlGroup:
            ControlGroup {
                Button { } label: {
                    Label {
                        Text(verbatim: "Copy")
                    } icon: {
                        Image(systemName: "doc.on.doc")
                    }
                }
                
                Button { } label: {
                    Label {
                        Text(verbatim: "Share")
                    } icon: {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
                
                Button { } label: {
                    Label {
                        Text(verbatim: "Delete")
                    } icon: {
                        Image(systemName: "trash")
                    }
                }
            }
            .labelStyle(.iconOnly)
            
            // MARK: 输入
            // TextField
        case .textField:
            VStack(alignment: .leading, spacing: 10) {
                TextField(text: $textFieldText) {
                    Text(verbatim: "Enter your name")
                }
                .textFieldStyle(.roundedBorder)
                
                Text(verbatim: "Input: \(textFieldText.isEmpty ? "-" : textFieldText)")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
            }
            
            // SecureField
        case .secureField:
            VStack(alignment: .leading, spacing: 10) {
                SecureField(text: $secureText) {
                    Text(verbatim: "Enter password")
                }
                .textFieldStyle(.roundedBorder)
                
                Text(verbatim: "Length: \(secureText.count)")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
            }
            
            // TextEditor
        case .textEditor:
            VStack(alignment: .leading, spacing: 10) {
                TextEditor(text: $editorText)
                    .frame(height: 100)
                    .padding(8)
                    .background(Color(.systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                    )
                
                Text(verbatim: "Characters: \(editorText.count)")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
            }
            
            // Toggle
        case .toggle:
            Toggle(isOn: $toggleValue) {
                Text(verbatim: "Dark Mode")
            }
            
            // Slider
        case .slider:
            VStack(spacing: 12) {
                Slider(value: $sliderValue, in: 0...100, step: 1)
                Text(verbatim: "Value: \(Int(sliderValue))")
                    .font(.system(size: 16, weight: .medium, design: .monospaced))
                    .foregroundColor(.secondary)
            }
            
            // Stepper
        case .stepper:
            Stepper(value: $stepperValue, in: 1...10) {
                Text(verbatim: "Num: \(stepperValue)")
            }
            
            // PickerSegmented
        case .pickerSegmented:
            Picker(selection: $segmentedSelection) {
                Text(verbatim: "First").tag(0)
                Text(verbatim: "Second").tag(1)
                Text(verbatim: "Third").tag(2)
            } label: {
                EmptyView()
            }
            .pickerStyle(.segmented)
            
            // PickerMenu
        case .pickerMenu:
            Picker(selection: $menuSelection) {
                Text(verbatim: "Light").tag("Light")
                Text(verbatim: "Dark").tag("Dark")
                Text(verbatim: "System").tag("System")
            } label: {
                EmptyView()
            }
            .pickerStyle(MenuPickerStyle())
            
            // PickerWheel
        case .pickerWheel:
            Picker(selection: $wheelSelection) {
                Text(verbatim: "Apple").tag("Apple")
                Text(verbatim: "Banana").tag("Banana")
                Text(verbatim: "Cherry").tag("Cherry")
            } label: {
                EmptyView()
            }
            .pickerStyle(.wheel)
            .frame(height: 160)
            
            // DatePicker
        case .datePicker:
            VStack(alignment: .leading, spacing: 10) {
                DatePicker(
                    selection: $selectedDate,
                    displayedComponents: [.date, .hourAndMinute],
                    label: {
                        EmptyView()
                    })
                .frame(maxWidth: .infinity)
                .offset(x: -15)
                
                Text(dateFormatter.string(from: selectedDate))
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
            }
            
            // MultiDatePicker
        case .multiDatePicker:
            if #available(iOS 16.0, macOS 13.0, *) {
                MultiDatePicker("Dates", selection: $selectedDates)
                    .frame(maxWidth: 320)
            } else {
                VStack(spacing: 10) {
                    Image(systemName: "calendar")
                        .font(.system(size: 36))
                        .foregroundStyle(.secondary)
                    
                    Text(verbatim: "Requires iOS 16 or later")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            
            // ColorPicker
        case .colorPicker:
            VStack(alignment: .leading, spacing: 10) {
                ColorPicker(selection: $selectedColor, label: {
                    Text(verbatim: "Accent Color")
                })
                
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(selectedColor)
                    .frame(height: 44)
            }
            
            //  MAKR: 布局
            //  VStack
        case .vStack:
            VStack(spacing: 12) {
                Text(verbatim: "First")
                    .frame(width: 120)
                    .padding(10)
                    .background(.blue.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text(verbatim: "Second")
                    .frame(width: 120)
                    .padding(10)
                    .background(.blue.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text(verbatim: "Third")
                    .frame(width: 120)
                    .padding(10)
                    .background(.blue.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            //  HStack
        case .hStack:
            HStack(spacing: 12) {
                Text(verbatim: "Left")
                    .padding(10)
                    .background(.orange.opacity(0.16))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text(verbatim: "Center")
                    .padding(10)
                    .background(.orange.opacity(0.16))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text(verbatim: "Right")
                    .padding(10)
                    .background(.orange.opacity(0.16))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            //  ZStack
        case .zStack:
            ZStack {
                Circle()
                    .fill(.blue.opacity(0.18))
                    .frame(width: 120, height: 120)
                
                Circle()
                    .fill(.blue.opacity(0.28))
                    .frame(width: 82, height: 82)
                
                Image(systemName: "star.fill")
                    .font(.system(size: 34))
                    .foregroundStyle(.blue)
            }
            
            //  LazyVStack
        case .lazyVStack:
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(0..<6, id: \.self) { index in
                        Text(verbatim: "Item \(index + 1)")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.gray.opacity(0.12))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding(.horizontal, 4)
            }
            .frame(width: 260, height: 220)
            
            //  LazyHStack
        case .lazyHStack:
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 12) {
                    ForEach(0..<6, id: \.self) { index in
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.blue.opacity(0.18))
                            .frame(width: 90, height: 90)
                            .overlay {
                                Text(verbatim: "\(index + 1)")
                                    .font(.headline)
                            }
                    }
                }
                .padding(.horizontal, 4)
            }
            .frame(width: 260, height: 110)
            
            //  Grid
        case .grid:
            if #available(iOS 16.0, macOS 13.0, *) {
                Grid(horizontalSpacing: 12, verticalSpacing: 12) {
                    GridRow {
                        Text(verbatim: "A")
                        Text(verbatim: "B")
                        Text(verbatim: "C")
                    }
                    
                    GridRow {
                        Text(verbatim: "1")
                        Text(verbatim: "2")
                        Text(verbatim: "3")
                    }
                    
                    GridRow {
                        Image(systemName: "star.fill")
                        Image(systemName: "heart.fill")
                        Image(systemName: "bolt.fill")
                    }
                }
                .font(.system(size: 20, weight: .semibold))
                .padding()
                .background(.gray.opacity(0.12))
                .clipShape(RoundedRectangle(cornerRadius: 14))
            } else {
                Text(verbatim: "Requires iOS 16 or later")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            //  LazyVGrid
        case .lazyVGrid:
            LazyVGrid(
                columns: [
                    GridItem(.adaptive(minimum: 60), spacing: 10)
                ],
                spacing: 10
            ) {
                ForEach(0..<8, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.blue.opacity(0.18))
                        .frame(height: 60)
                        .overlay {
                            Text(verbatim: "\(index + 1)")
                                .font(.headline)
                        }
                }
            }
            .frame(width: 260)
            
            //  LazyHGrid
        case .lazyHGrid:
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(
                    rows: [
                        GridItem(.fixed(60), spacing: 10),
                        GridItem(.fixed(60), spacing: 10)
                    ],
                    spacing: 10
                ) {
                    ForEach(0..<8, id: \.self) { index in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.purple.opacity(0.18))
                            .frame(width: 70)
                            .overlay {
                                Text(verbatim: "\(index + 1)")
                                    .font(.headline)
                            }
                    }
                }
                .padding(.horizontal, 4)
            }
            .frame(width: 260, height: 140)
            
            //  ViewThatFits
        case .viewThatFits:
            if #available(iOS 16.0, macOS 13.0, *) {
                ViewThatFits {
                    HStack(spacing: 10) {
                        Text(verbatim: "SwiftUI")
                        Text(verbatim: "Layout")
                        Text(verbatim: "Preview")
                    }
                    
                    VStack(spacing: 8) {
                        Text(verbatim: "SwiftUI")
                        Text(verbatim: "Layout")
                        Text(verbatim: "Preview")
                    }
                }
                .font(.system(size: 16, weight: .semibold))
                .padding()
                .frame(width: 180)
                .background(.gray.opacity(0.12))
                .clipShape(RoundedRectangle(cornerRadius: 14))
            } else {
                Text(verbatim: "Requires iOS 16 or later")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            //  GeometryReader
        case .geometryReader:
            GeometryReader { geo in
                VStack(spacing: 8) {
                    Text(verbatim: "Width: \(Int(geo.size.width))")
                    Text(verbatim: "Height: \(Int(geo.size.height))")
                }
                .font(.system(size: 15, weight: .medium))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(width: 260, height: 120)
            .background(.gray.opacity(0.12))
            .clipShape(RoundedRectangle(cornerRadius: 14))
            
            // MARK: 容器
            // ScrollView
        case .scrollView:
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(1...8, id: \.self) { index in
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(Color.blue.opacity(0.15))
                            .frame(width: 110, height: 80)
                            .overlay(
                                Text(verbatim: "Card \(index)")
                                    .font(.system(size: 15, weight: .semibold))
                            )
                    }
                }
            }
            
            // List
        case .list:
            List {
                Text(verbatim: "Apple")
                Text(verbatim: "Banana")
                Text(verbatim: "Orange")
            }
            .frame(height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            
            // Section
        case .section:
            List {
                Section(content: {
                    Text(verbatim: "Apple")
                    Text(verbatim: "Orange")
                }, header: {
                    Text(verbatim: "Fruits")
                })
            }
            .frame(height: 160)
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            
            // Form
        case .form:
            Form {
                Section(content: {
                    TextField(text: .constant("fangjunyu")) {
                        Text(verbatim: "Username")
                    }
                    SecureField(text: .constant("123456")) {
                        Text(verbatim: "Password")
                    }
                }, header: {
                    Text(verbatim: "Account")
                })
            }
            .frame(height: 160)
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            
            // DisclosureGroup
        case .disclosureGroup:
            VStack {
                Button(action: {
                    withAnimation {
                        isShowDetails.toggle()
                    }
                }, label: {
                    HStack {
                        Text(verbatim: "Show Details")
                        Spacer()
                        Image(systemName:"chevron.right")
                            .font(.system(size: 14, weight: .semibold))
                            .imageScale(.small)
                            .rotationEffect(Angle(degrees: isShowDetails ? 90 : 0))
                    }
                })
                if isShowDetails {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(verbatim: "This is the first line.")
                        Text(verbatim: "This is the second line.")
                        Text(verbatim: "This is the third line.")
                    }
                    .padding(.top, 8)
                }
                Spacer()
            }
            .frame(height: 140)
            
            // Group
        case .group:
            VStack(spacing: 8) {
                Group {
                    Text(verbatim: "SwiftUI")
                    Text(verbatim: "Preview")
                }
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(.blue)
            }
            .padding()
            .frame(width: 180)
            .background(.gray.opacity(0.12))
            .clipShape(RoundedRectangle(cornerRadius: 14))
            
            // GroupBox
        case .groupBox:
            GroupBox {
                HStack(spacing: 10) {
                    Image(systemName: "person.crop.circle")
                        .font(.system(size: 28))
                        .foregroundStyle(.blue)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(verbatim: "Profile")
                            .font(.headline)
                        
                        Text(verbatim: "SwiftUI Developer")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(width: 260)
            
            // MARK: 导航
            // TabView
        case .tabView:
            TabView(selection: $tabSelection) {
                demoPage(title: "Home", icon: "house.fill", color: .blue).tag(0)
                demoPage(title: "Courses", icon: "book.fill", color: .green).tag(1)
                demoPage(title: "Tools", icon: "square.grid.2x2.fill", color: .orange).tag(2)
            }
            .frame(height: 180)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            
            //  NavigationStack
        case .navigationStack:
            if #available(iOS 16.0, macOS 13.0, *) {
                NavigationStack {
                    VStack(spacing: 16) {
                        NavigationLink {
                            Text(verbatim: "Detail View")
                                .font(.headline)
                        } label: {
                            Label {
                                Text(verbatim: "Open Detail")
                            } icon: {
                                Image(systemName: "arrow.right.circle")
                            }
                        }
                    }
                    .navigationTitle("Stack")
                }
                .frame(width: 260, height: 180)
            } else {
                Text(verbatim: "Requires iOS 16 or later")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            //  NavigationSplitView
        case .navigationSplitView:
            if #available(iOS 16.0, macOS 13.0, *) {
                NavigationSplitView {
                    List(["Home", "Tools", "Settings"], id: \.self) { item in
                        Text(verbatim: item)
                    }
                    .navigationTitle("Sidebar")
                } detail: {
                    VStack(spacing: 10) {
                        Image(systemName: "sidebar.left")
                            .font(.system(size: 32))
                            .foregroundStyle(.blue)
                        
                        Text(verbatim: "Detail")
                            .font(.headline)
                    }
                }
                .frame(width: 280, height: 200)
            } else {
                Text(verbatim: "Requires iOS 16 or later")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            //  MARK: 呈现
            //  Sheet
        case .sheet:
            Button {
                showSheet = true
            } label: {
                Label {
                    Text(verbatim: "Show Sheet")
                } icon: {
                    Image(systemName: "rectangle.bottomthird.inset.filled")
                }
                .font(.system(size: 16, weight: .semibold))
                .padding(.horizontal, 18)
                .padding(.vertical, 10)
                .background(.blue.opacity(0.14))
                .clipShape(Capsule())
            }
            .sheet(isPresented: $showSheet) {
                VStack(spacing: 14) {
                    Image(systemName: "rectangle.bottomthird.inset.filled")
                        .font(.system(size: 40))
                        .foregroundStyle(.blue)
                    
                    Text(verbatim: "Sheet Content")
                        .font(.headline)
                    
                    Button {
                        showSheet = false
                    } label: {
                        Text(verbatim: "Done")
                    }
                }
                .padding()
            }
            
            // Alert
        case .alert:
            Button {
                showAlert = true
            } label: {
                Label {
                    Text(verbatim: "Show Alert")
                } icon: {
                    Image(systemName: "exclamationmark.triangle")
                }
                .font(.system(size: 16, weight: .semibold))
                .padding(.horizontal, 18)
                .padding(.vertical, 10)
                .background(.orange.opacity(0.16))
                .clipShape(Capsule())
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text(verbatim: "Delete Item?"),
                    message: Text(verbatim: "This action cannot be undone."),
                    primaryButton: .destructive(Text(verbatim: "Delete")),
                    secondaryButton: .cancel(Text(verbatim: "Cancel"))
                )
            }
            
            //  Popover
        case .popover:
            Button {
                showPopover = true
            } label: {
                Label {
                    Text(verbatim: "Show Popover")
                } icon: {
                    Image(systemName: "bubble.left.and.bubble.right")
                }
                .font(.system(size: 16, weight: .semibold))
                .padding(.horizontal, 18)
                .padding(.vertical, 10)
                .background(.purple.opacity(0.14))
                .clipShape(Capsule())
            }
            .popover(isPresented: $showPopover) {
                VStack(spacing: 10) {
                    Image(systemName: "bubble.left.and.bubble.right")
                        .font(.system(size: 32))
                        .foregroundStyle(.purple)
                    
                    Text(verbatim: "Popover Content")
                        .font(.headline)
                    
                    Text(verbatim: "A popover presents related content near the button.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding()
                .frame(width: 240)
            }
            
            //  ConfirmationDialog
        case .confirmationDialog:
            Button {
                showConfirmationDialog = true
            } label: {
                Label {
                    Text(verbatim: "Show Options")
                } icon: {
                    Image(systemName: "ellipsis.circle")
                }
                .font(.system(size: 16, weight: .semibold))
                .padding(.horizontal, 18)
                .padding(.vertical, 10)
                .background(.gray.opacity(0.14))
                .clipShape(Capsule())
            }
            .confirmationDialog(
                "Choose an action",
                isPresented: $showConfirmationDialog,
                titleVisibility: .visible
            ) {
                Button {
                } label: {
                    Text(verbatim: "Copy")
                }
                
                Button {
                } label: {
                    Text(verbatim: "Share")
                }
                
                Button(role: .destructive) {
                } label: {
                    Text(verbatim: "Delete")
                }
                
                Button(role: .cancel) {
                } label: {
                    Text(verbatim: "Cancel")
                }
            } message: {
                Text(verbatim: "Select one operation to continue.")
            }
            
            // MARK: 形状
            // Circle
        case .circle:
            HStack {
                Circle()
                    .fill(.blue)
                    .frame(width: 80, height: 80)
            }
            
            // Rectangle
        case .rectangle:
            Rectangle()
                .fill(.green)
                .frame(width: 120, height: 70)
            
            // RoundedRectangle
        case .roundedRectangle:
            RoundedRectangle(cornerRadius: 20)
                .fill(.purple)
                .frame(width: 120, height: 70)
            
            // Capsule
        case .capsule:
            Capsule()
                .fill(.orange)
                .frame(width: 140, height: 60)
            
            // Ellipse
        case .ellipse:
            Ellipse()
                .fill(.pink)
                .frame(width: 130, height: 70)
            
            // UnevenRoundedRectangleFallback
        case .unevenRoundedRectangle:
            UnevenRoundedRectangleFallback(
                topLeading: 28,
                bottomLeading: 8,
                bottomTrailing: 28,
                topTrailing: 8
            )
            .fill(.cyan)
            .frame(width: 120, height: 70)
            
            //  ContainerRelativeShape
        case .containerRelativeShape:
            ZStack {
                ContainerRelativeShape()
                    .fill(.blue.opacity(0.18))
                
                VStack(spacing: 8) {
                    Image(systemName: "rectangle.on.rectangle")
                        .font(.system(size: 30))
                        .foregroundStyle(.blue)
                    
                    Text(verbatim: "Container")
                        .font(.headline)
                }
            }
            .frame(width: 170, height: 110)
            .containerShape(RoundedRectangle(cornerRadius: 28))
            
            //  Path
        case .path:
            Path { path in
                path.move(to: CGPoint(x: 20, y: 80))
                path.addLine(to: CGPoint(x: 70, y: 20))
                path.addLine(to: CGPoint(x: 120, y: 80))
                path.addLine(to: CGPoint(x: 20, y: 80))
            }
            .stroke(
                .blue,
                style: StrokeStyle(
                    lineWidth: 5,
                    lineCap: .round,
                    lineJoin: .round
                )
            )
            .frame(width: 140, height: 100)
        }
    }
}

#Preview {
    NavigationView {
        PreviewView()
            .environmentObject(AppStorageManager.shared)
            .environmentObject(IAPManager.shared)
    }
}
