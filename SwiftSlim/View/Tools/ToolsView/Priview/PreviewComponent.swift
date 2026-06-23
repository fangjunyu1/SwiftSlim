//
//  PreviewComponent.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/22.
//

import SwiftUI

struct PreviewComponent: Identifiable {
    var id: String { name }
    let category: PreviewCategory   // 类别
    let name: String    // 组件名称
    let subtitle: String    // 组件副标题
    let description: String // 组件描述
    let demo: PreviewDemo   // 测试 Demo
    let code: String    // 代码，用于复制
}

extension PreviewComponent {
    static let all: [PreviewComponent] = [
        // MARK: - 展示
        // Text
        .init(
            category: .display,
            name: "Text",
            subtitle: "Text",
            description: "Displays plain text.",
            demo: .text,
            code: """
Text("Hello, SwiftUI")
    .font(.system(size: 24, weight: .semibold))
"""
        ),
        
        // Image
        .init(
            category: .display,
            name: "Image",
            subtitle: "Image",
            description: "Displays system icons or local images.",
            demo: .image,
            code: """
Image(systemName: "swift")
    .font(.system(size: 40))
    .foregroundColor(.orange)
"""
        ),
        
        // Color
        .init(
            category: .display,
            name: "Color",
            subtitle: "Color",
            description: "Displays a solid color as a view.",
            demo: .color,
            code: """
        Color.blue
            .frame(width: 80, height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        """
        ),
        
        // Divider
        .init(
            category: .display,
            name: "Divider",
            subtitle: "Divider",
            description: "Separates content sections.",
            demo: .divider,
            code: """
VStack {
    Text("Top Content")
    Divider()
    Text("Bottom Content")
}
"""
        ),
        
        // Spacer
        .init(
            category: .display,
            name: "Spacer",
            subtitle: "Spacer",
            description: "Adds flexible empty space between views.",
            demo: .spacer,
            code: """
        HStack {
            Text("Left")
            Spacer()
            Text("Right")
        }
        """
        ),
        
        // Label
        .init(
            category: .display,
            name: "Label",
            subtitle: "Icon & Text",
            description: "Combines an icon and text.",
            demo: .label,
            code: """
Label("Favorites", systemImage: "star.fill")
"""
        ),
        
        // LabeledContent
        .init(
            category: .display,
            name: "LabeledContent",
            subtitle: "Label & Value",
            description: "Displays a label and its associated value.",
            demo: .labeledContent,
            code: """
            LabeledContent("Storage", value: "64 GB")
            
            LabeledContent {
                Text("Online")
                    .foregroundStyle(.green)
            } label: {
                Label("Status", systemImage: "wifi")
            }
            """
        ),
        
        // ProgressView
        .init(
            category: .display,
            name: "ProgressView",
            subtitle: "Progress",
            description: "Displays loading status or task progress.",
            demo: .progressView,
            code: """
ProgressView(value: 0.3)
"""
        ),
        
        // AsyncImage
        .init(
            category: .display,
            name: "AsyncImage",
            subtitle: "AsyncImage",
            description: "Loads and displays an image from a URL.",
            demo: .asyncImage,
            code: """
        AsyncImage(url: URL(string: "https://picsum.photos/160")) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            ProgressView()
        }
        """
        ),
        
        // Gauge
        .init(
            category: .display,
            name: "Gauge",
            subtitle: "Gauge",
            description: "Shows a value within a range.",
            demo: .gauge,
            code: """
        Gauge(value: 0.65) {
            Text("Storage")
        } currentValueLabel: {
            Text("65%")
        }
        .gaugeStyle(.accessoryCircularCapacity)
        .tint(.blue)
        """
        ),
        
        // ContentUnavailableView
        .init(
            category: .display,
            name: "ContentUnavailableView",
            subtitle: "Unavailable",
            description: "Shows an empty or unavailable content state.",
            demo: .contentUnavailableView,
            code: """
        ContentUnavailableView(
            "No Results",
            systemImage: "magnifyingglass",
            description: Text("Try another keyword.")
        )
        """
        ),
        
        // EmptyView
        .init(
            category: .display,
            name: "EmptyView",
            subtitle: "Invisible View",
            description: "Creates an invisible view.",
            demo: .emptyView,
            code: """
            VStack {
                Text("Before")
                EmptyView()
                Text("After")
            }
            """
        ),
        
        //  MARK: 交互
        //  Button
            .init(
                category: .action,
                name: "Button",
                subtitle: "Button",
                description: "Responds to tap actions.",
                demo: .button,
                code: """
Button("Tap Me") {
    count += 1
}
.buttonStyle(.borderedProminent)
"""
            ),
        
        //  Link
        .init(
            category: .action,
            name: "Link",
            subtitle: "Link",
            description: "Opens web pages or jumps to a URL.",
            demo: .link,
            code: """
Link("Open Fang Junyu",
     destination: URL(string: "https://fangjunyu.com/")!)
"""
        ),
        
        //  Menu
        .init(
            category: .action,
            name: "Menu",
            subtitle: "Menu",
            description: "Shows multiple actions.",
            demo: .menu,
            code: """
Menu("More Actions") {
    Button("Edit", action: {})
    Button("Share", action: {})
    Button("Delete", role: .destructive, action: {})
}
"""
        ),
        
        //  NavigationLink
        .init(
            category: .action,
            name: "NavigationLink",
            subtitle: "NavigationLink",
            description: "Navigates to another view.",
            demo: .navigationLink,
            code: """
NavigationLink {
    Text("Detail Page")
} label: {
    Text("Go to Detail")
}
"""
        ),
        
        //  ShareLink
        .init(
            category: .action,
            name: "ShareLink",
            subtitle: "Share Link",
            description: "Shares text, links, or other content.",
            demo: .shareLink,
            code: """
            ShareLink(item: URL(string: "https://www.apple.com/swift/")!) {
                Label("Share", systemImage: "square.and.arrow.up")
            }
            """
        ),
        
        //  EditButton
        .init(
            category: .action,
            name: "EditButton",
            subtitle: "Edit Button",
            description: "Toggles edit mode for editable content.",
            demo: .editButton,
            code: """
        @State private var items = ["Text", "Image", "Button"]
        
        NavigationStack {
            List {
                ForEach(items, id: \\.self) { item in
                    Text(item)
                }
                .onDelete { offsets in
                    items.remove(atOffsets: offsets)
                }
            }
            .toolbar {
                EditButton()
            }
        }
        """
        ),
        
        // MARK: 输入
        //  TextField
            .init(
                category: .input,
                name: "TextField",
                subtitle: "TextField",
                description: "Accepts short text input.",
                demo: .textField,
                code: """
TextField("Enter your name", text: $text)
    .textFieldStyle(.roundedBorder)
"""
            ),
        
        //  SecureField
        .init(
            category: .input,
            name: "SecureField",
            subtitle: "SecureField",
            description: "Hides sensitive text input.",
            demo: .secureField,
            code: """
SecureField("Enter password", text: $password)
    .textFieldStyle(.roundedBorder)
"""
        ),
        
        //  TextEditor
        .init(
            category: .input,
            name: "TextEditor",
            subtitle: "TextEditor",
            description: "Edits multi-line text.",
            demo: .textEditor,
            code: """
TextEditor(text: $text)
    .frame(height: 100)
"""
        ),
        
        //  Toggle
        .init(
            category: .input,
            name: "Toggle",
            subtitle: "Toggle",
            description: "Switches a value on or off.",
            demo: .toggle,
            code: """
Toggle("Dark Mode", isOn: $isOn)
"""
        ),
        
        //  Slider
        .init(
            category: .input,
            name: "Slider",
            subtitle: "Slider",
            description: "Selects a value in a range.",
            demo: .slider,
            code: """
Slider(value: $value, in: 0...100, step: 1)
"""
        ),
        
        //  Stepper
        .init(
            category: .input,
            name: "Stepper",
            subtitle: "Stepper",
            description: "Adjusts a value step by step.",
            demo: .stepper,
            code: """
Stepper("Num: \\(count)", value: $count, in: 1...10)
"""
        ),
        
        //  Picker (Segmented)
        .init(
            category: .input,
            name: "Picker (Segmented)",
            subtitle: "Segmented Picker",
            description: "Switches quickly between options.",
            demo: .pickerSegmented,
            code: """
Picker("Number", selection: $selection) {
    Text("First").tag(0)
    Text("Second").tag(1)
    Text("Third").tag(2)
}
.pickerStyle(.segmented)
"""
        ),
        
        //  Picker (Menu)
        .init(
            category: .input,
            name: "Picker (Menu)",
            subtitle: "Menu Picker",
            description: "Presents options in a menu.",
            demo: .pickerMenu,
            code: """
Picker("Theme", selection: $selection) {
    Text("Light").tag("Light")
    Text("Dark").tag("Dark")
    Text("System").tag("System")
}
.pickerStyle(MenuPickerStyle())
"""
        ),
        
        //  Picker (Wheel)
        .init(
            category: .input,
            name: "Picker (Wheel)",
            subtitle: "Wheel Picker",
            description: "Presents options in a wheel.",
            demo: .pickerWheel,
            code: """
Picker("Fruit", selection: $wheelSelection) {
    Text("Apple").tag("Apple")
    Text("Banana").tag("Banana")
    Text("Cherry").tag("Cherry")
}
.pickerStyle(.wheel)
"""
        ),
        
        //  DatePicker
        .init(
            category: .input,
            name: "DatePicker",
            subtitle: "DatePicker",
            description: "Selects a date and time.",
            demo: .datePicker,
            code: """
DatePicker("Select Date",
           selection: $date,
           displayedComponents: [.date, .hourAndMinute])
"""
        ),
        
        // MultiDatePicker
        .init(
            category: .input,
            name: "MultiDatePicker",
            subtitle: "Multi-Date Picker",
            description: "Lets users select multiple dates.",
            demo: .multiDatePicker,
            code: """
            @State private var selectedDates: Set<DateComponents> = []
            
            MultiDatePicker("Dates", selection: $selectedDates)
            """
        ),
        
        //  ColorPicker
        .init(
            category: .input,
            name: "ColorPicker",
            subtitle: "ColorPicker",
            description: "Selects a color.",
            demo: .colorPicker,
            code: """
ColorPicker("Accent Color", selection: $color)
"""
        ),
        
        // MARK: 布局
        // VStack
            .init(
                category: .layout,
                name: "VStack",
                subtitle: "Vertical Stack",
                description: "Arranges views vertically.",
                demo: .vStack,
                code: """
        VStack(spacing: 12) {
            Text("First")
            Text("Second")
            Text("Third")
        }
        """
            ),
        
        //  HStack
        .init(
            category: .layout,
            name: "HStack",
            subtitle: "Horizontal Stack",
            description: "Arranges views horizontally.",
            demo: .hStack,
            code: """
        HStack(spacing: 12) {
            Text("Left")
            Text("Center")
            Text("Right")
        }
        """
        ),
        
        //  ZStack
        .init(
            category: .layout,
            name: "ZStack",
            subtitle: "Depth Stack",
            description: "Overlays views on top of each other.",
            demo: .zStack,
            code: """
        ZStack {
            Circle()
            Image(systemName: "star.fill")
        }
        """
        ),
        
        //  LazyVStack
        .init(
            category: .layout,
            name: "LazyVStack",
            subtitle: "Lazy Vertical Stack",
            description: "Arranges views vertically and creates them as needed.",
            demo: .lazyVStack,
            code: """
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(1...6, id: \\.self) { index in
                    Text("Item \\(index)")
                }
            }
        }
        """
        ),
        
        //  LazyHStack
        .init(
            category: .layout,
            name: "LazyHStack",
            subtitle: "Lazy Horizontal Stack",
            description: "Arranges views horizontally and creates them as needed.",
            demo: .lazyHStack,
            code: """
        ScrollView(.horizontal) {
            LazyHStack(spacing: 12) {
                ForEach(1...6, id: \\.self) { index in
                    Text("\\(index)")
                }
            }
        }
        """
        ),
        
        //  Grid
        .init(
            category: .layout,
            name: "Grid",
            subtitle: "Grid Layout",
            description: "Arranges views in rows and columns.",
            demo: .grid,
            code: """
        Grid(horizontalSpacing: 12, verticalSpacing: 12) {
            GridRow {
                Text("A")
                Text("B")
                Text("C")
            }
        
            GridRow {
                Text("1")
                Text("2")
                Text("3")
            }
        }
        """
        ),
        
        //  LazyVGrid
        .init(
            category: .layout,
            name: "LazyVGrid",
            subtitle: "Lazy Vertical Grid",
            description: "Arranges views in a vertical grid.",
            demo: .lazyVGrid,
            code: """
        LazyVGrid(
            columns: [
                GridItem(.adaptive(minimum: 60), spacing: 10)
            ],
            spacing: 10
        ) {
            ForEach(1...8, id: \\.self) { index in
                Text("\\(index)")
            }
        }
        """
        ),
        
        //  LazyHGrid
        .init(
            category: .layout,
            name: "LazyHGrid",
            subtitle: "Lazy Horizontal Grid",
            description: "Arranges views in a horizontal grid.",
            demo: .lazyHGrid,
            code: """
        ScrollView(.horizontal) {
            LazyHGrid(
                rows: [
                    GridItem(.fixed(60), spacing: 10),
                    GridItem(.fixed(60), spacing: 10)
                ],
                spacing: 10
            ) {
                ForEach(1...8, id: \\.self) { index in
                    Text("\\(index)")
                }
            }
        }
        """
        ),
        
        //  ViewThatFits
        .init(
            category: .layout,
            name: "ViewThatFits",
            subtitle: "Adaptive Layout",
            description: "Chooses the first view that fits the available space.",
            demo: .viewThatFits,
            code: """
        ViewThatFits {
            HStack {
                Text("SwiftUI")
                Text("Layout")
                Text("Preview")
                Text("ViewThatFits")
            }
        
            VStack {
                Text("SwiftUI")
                Text("Layout")
                Text("Preview")
                Text("ViewThatFits")
            }
        }
        """
        ),
        
        //  GeometryReader
        .init(
            category: .layout,
            name: "GeometryReader",
            subtitle: "Geometry Reader",
            description: "Reads the size and position of its container.",
            demo: .geometryReader,
            code: """
        GeometryReader { geo in
            VStack {
                Text("Width: \\(geo.size.width)")
                Text("Height: \\(geo.size.height)")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(height: 120)
        """
        ),
        
        //  MARK: 容器
        //  ScrollView
            .init(
                category: .container,
                name: "ScrollView",
                subtitle: "ScrollView",
                description: "Shows scrollable content.",
                demo: .scrollView,
                code: """
ScrollView) {
    VStack(spacing: 12) {
        ForEach(1...8, id: \\.self) { index in
            Text("\\(index)")
        }
    }
}
"""
            ),
        
        //  List
        .init(
            category: .container,
            name: "List",
            subtitle: "List",
            description: "Shows data in rows.",
            demo: .list,
            code: """
List {
    Text("Apple")
    Text("Banana")
    Text("Orange")
}
"""
        ),
        
        //  Section
        .init(
            category: .container,
            name: "Section",
            subtitle: "Section",
            description: "Groups list or form content.",
            demo: .section,
            code: """
List {
    Section("Fruits") {
        Text("Apple")
        Text("Orange")
    }
}
"""
        ),
        
        //  Form
        .init(
            category: .container,
            name: "Form",
            subtitle: "Form",
            description: "Collects settings or user input.",
            demo: .form,
            code: """
Form {
    Section("Account") {
        TextField("Username", text: $username)
        SecureField("Password", text: $password)
    }
}
"""
        ),
        
        //  Group
        .init(
            category: .container,
            name: "Group",
            subtitle: "Group",
            description: "Groups views without creating a visible container.",
            demo: .group,
            code: """
            Group {
                Text("Title")
                Text("Subtitle")
            }
            .foregroundStyle(Color.blue)
            """
        ),
        
        //  GroupBox
        .init(
            category: .container,
            name: "GroupBox",
            subtitle: "Group Box",
            description: "Displays related content in a labeled container.",
            demo: .groupBox,
            code: """
            GroupBox("GroupBox") {
                Label("SwiftUI Basics", systemImage: "book.closed")
                Label("12 Lessons Completed", systemImage: "checkmark.circle")
            }
            """
        ),
        
        //  DisclosureGroup
        .init(
            category: .container,
            name: "DisclosureGroup",
            subtitle: "DisclosureGroup",
            description: "Expands or collapses content.",
            demo: .disclosureGroup,
            code: """
DisclosureGroup("Show Details") {
    Text("This is the content")
}
"""
        ),
        
        //  ControlGroup
        .init(
            category: .container,
            name: "ControlGroup",
            subtitle: "Control Group",
            description: "Groups related controls together.",
            demo: .controlGroup,
            code: """
            ControlGroup {
                Button("Copy") { }
                Button("Share") { }
                Button("Delete") { }
            }
            .labelStyle(.iconOnly)
            """
        ),
        
        // ScrollViewReader
        .init(
            category: .container,
            name: "ScrollViewReader",
            subtitle: "Programmatic Scrolling",
            description: "Scrolls to a specific item inside a ScrollView.",
            demo: .scrollViewReader,
            code: """
            ScrollViewReader { proxy in
                VStack {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(0..<20, id: \\.self) { index in
                                Text("\\(index)")
                                    .frame(width: 50, height: 50)
                                    .id(index)
                            }
                        }
                    }
                    
                    Button("Scroll to 10") {
                        withAnimation {
                            proxy.scrollTo(10, anchor: .center)
                        }
                    }
                }
            }
            """
        ),
        
        // MARK: - 数据展示
        
            .init(
                category: .data,
                name: "Table",
                subtitle: "Table",
                description: "Displays data in rows and columns.",
                demo: .table,
                code: """
        struct Person: Identifiable {
            let id = UUID()
            let name: String
            let role: String
        }
        
        let people = [
            Person(name: "Junyu", role: "Developer"),
            Person(name: "Ming", role: "Designer"),
            Person(name: "Luna", role: "Product")
        ]
        
        Table(people) {
            TableColumn("Name", value: \\.name)
            TableColumn("Role", value: \\.role)
        }
        """
            ),
        
            .init(
                category: .data,
                name: "Chart",
                subtitle: "Chart",
                description: "Displays data as charts using Swift Charts.",
                demo: .chart,
                code: """
        import Charts
        
        struct Sales: Identifiable {
            let id = UUID()
            let month: String
            let value: Int
        }
        
        let sales = [
            Sales(month: "Jan", value: 20),
            Sales(month: "Feb", value: 35),
            Sales(month: "Mar", value: 28),
            Sales(month: "Apr", value: 45)
        ]
        
        Chart(sales) { item in
            BarMark(
                x: .value("Month", item.month),
                y: .value("Value", item.value)
            )
        }
        .frame(height: 180)
        """
            ),
        
        // MARK: 导航
        //  TabView
            .init(
                category: .navigation,
                name: "TabView",
                subtitle: "TabView",
                description: "Switches between multiple views.",
                demo: .tabView,
                code: """
TabView {
    Text("Home").tag(0)
    Text("Courses").tag(1)
    Text("Tools").tag(2)
}
.tabViewStyle(PageTabViewStyle())
"""
            ),
        
        //  NavigationStack
        .init(
            category: .navigation,
            name: "NavigationStack",
            subtitle: "Stack Navigation",
            description: "Manages push-style navigation between views.",
            demo: .navigationStack,
            code: """
        NavigationStack {
            NavigationLink {
                Text("Detail View")
            } label: {
                Text("Open Detail")
            }
            .navigationTitle("Stack")
        }
        """
        ),
        
        //  NavigationSplitView
        .init(
            category: .navigation,
            name: "NavigationSplitView",
            subtitle: "Split Navigation",
            description: "Creates a sidebar and detail navigation layout.",
            demo: .navigationSplitView,
            code: """
        NavigationSplitView {
            List(["Home", "Tools", "Settings"], id: \\.self) { item in
                Text(item)
            }
            .navigationTitle("Sidebar")
        } detail: {
            Text("Detail")
        }
        """
        ),
        
        // MARK: 呈现
        // Sheet
            .init(
                category: .presentation,
                name: "Sheet",
                subtitle: "Sheet",
                description: "Presents a view from the bottom or as a modal window.",
                demo: .sheet,
                code: """
        @State private var showSheet = false
        
        Button("Show Sheet") {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            Text("Sheet Content")
        }
        """
            ),
        
        //  Alert
        .init(
            category: .presentation,
            name: "Alert",
            subtitle: "Alert",
            description: "Shows an important message that needs attention.",
            demo: .alert,
            code: """
        @State private var showAlert = false
        
        Button("Delete Item") {
            showAlert = true
        }
        .alert("Delete Item?", isPresented: $showAlert) {
            Button("Cancel", role: .cancel) { }
            Button("Delete", role: .destructive) { }
        } message: {
            Text("This action cannot be undone.")
        }
        """
        ),
        
        // FullScreenCover
        .init(
            category: .presentation,
            name: "FullScreenCover",
            subtitle: "Full Screen Modal",
            description: "Presents a modal view that covers the entire screen.",
            demo: .fullScreenCover,
            code: """
            @State private var showFullScreenCover = false
            
            Button("Show Full Screen") {
                showFullScreenCover = true
            }
            .fullScreenCover(isPresented: $showFullScreenCover) {
                NavigationStack {
                    VStack(spacing: 16) {
                        Text("Full Screen Cover")
                        Button("Close") {
                            showFullScreenCover = false
                        } 
                    }
                    .navigationTitle("Cover")
                }
            }
            """
        ),
        
        //  Popover
        .init(
            category: .presentation,
            name: "Popover",
            subtitle: "Popover",
            description: "Presents content in a floating popover.",
            demo: .popover,
            code: """
        @State private var showPopover = false
        
        Button("Show Popover") {
            showPopover = true
        }
        .popover(isPresented: $showPopover) {
            Text("Popover Content")
        }
        """
        ),
        
        //  ConfirmationDialog
        .init(
            category: .presentation,
            name: "ConfirmationDialog",
            subtitle: "Confirmation Dialog",
            description: "Shows a list of actions for users to confirm.",
            demo: .confirmationDialog,
            code: """
        @State private var showConfirmationDialog = false
        
        Button("Show Options") {
            showConfirmationDialog = true
        }
        .confirmationDialog(
            "Choose an action",
            isPresented: $showConfirmationDialog,
            titleVisibility: .visible
        ) {
            Button("Copy") { }
            Button("Delete", role: .destructive) { }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Select one operation to continue.")
        }
        """
        ),
        
        // MARK: - 媒体 / 系统能力
        
            .init(
                category: .media,
                name: "Map",
                subtitle: "Map",
                description: "Displays an interactive map with markers.",
                demo: .map,
                code: """
        import MapKit
        
        let coordinate = CLLocationCoordinate2D(
            latitude: 37.3349,
            longitude: -122.00902
        )
        
        Map(initialPosition: .region(
            MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(
                    latitudeDelta: 0.02,
                    longitudeDelta: 0.02
                )
            )
        )) {
            Marker("Apple Park", coordinate: coordinate)
        }
        .frame(height: 220)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        """
            ),
        
            .init(
                category: .media,
                name: "PhotosPicker",
                subtitle: "Photo Selection",
                description: "Presents the system photo picker.",
                demo: .photosPicker,
                code: """
        import PhotosUI
        
        @State private var pickerItem: PhotosPickerItem?
        @State private var selectedImage: Image?
        
        VStack(spacing: 12) {
            if let selectedImage {
                selectedImage
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            } else {
                Text("No photo selected")
            }

            PhotosPicker(selection: $pickerItem, matching: .images) {
                Label("Select Photo", systemImage: "photo.on.rectangle")
            }
        }
        .task(id: pickerItem) {
            selectedImage = try? await pickerItem?.loadTransferable(type: Image.self)
        }
        """
            ),
        
            .init(
                category: .media,
                name: "VideoPlayer",
                subtitle: "Video Playback",
                description: "Plays video content with system controls.",
                demo: .videoPlayer,
                code: """
        import AVKit
        
        if let url = Bundle.main.url(forResource: "demo", withExtension: "mp4") {
            VideoPlayer(player: AVPlayer(url: url))
                .frame(height: 220)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        """
            ),
        
        // MARK: - 绘图
        
            .init(
                category: .drawing,
                name: "Canvas",
                subtitle: "Canvas",
                description: "Draws custom 2D graphics.",
                demo: .canvas,
                code: """
        Canvas { context, size in
            let rect = CGRect(
                x: 20,
                y: 20,
                width: size.width - 40,
                height: size.height - 40
            )
            
            context.stroke(
                Path(ellipseIn: rect),
                with: .color(.blue),
                lineWidth: 4
            )
        }
        .frame(height: 160)
        """
            ),
        
        // MARK: 形状
        //  Circle
            .init(
                category: .shape,
                name: "Circle",
                subtitle: "Circle",
                description: "Draws a circular shape.",
                demo: .circle,
                code: """
        Circle()
            .fill(.blue)
            .frame(width: 80, height: 80)
        """
            ),
        
        //  Rectangle
        .init(
            category: .shape,
            name: "Rectangle",
            subtitle: "Rectangle",
            description: "Draws a rectangular shape.",
            demo: .rectangle,
            code: """
        Rectangle()
            .fill(.green)
            .frame(width: 120, height: 70)
        """
        ),
        
        //  RoundedRectangle
        .init(
            category: .shape,
            name: "RoundedRectangle",
            subtitle: "RoundedRectangle",
            description: "Draws a rectangle with rounded corners.",
            demo: .roundedRectangle,
            code: """
        RoundedRectangle(cornerRadius: 20)
            .fill(.purple)
            .frame(width: 120, height: 70)
        """
        ),
        
        //  Capsule
        .init(
            category: .shape,
            name: "Capsule",
            subtitle: "Pill Shape",
            description: "Draws a capsule-shaped view.",
            demo: .capsule,
            code: """
        Capsule()
            .fill(.orange)
            .frame(width: 140, height: 60)
        """
        ),
        
        //  Ellipse
        .init(
            category: .shape,
            name: "Ellipse",
            subtitle: "Oval Shape",
            description: "Draws an oval shape.",
            demo: .ellipse,
            code: """
        Ellipse()
            .fill(.pink)
            .frame(width: 130, height: 70)
        """
        ),
        
        //  UnevenRoundedRectangle
        .init(
            category: .shape,
            name: "UnevenRoundedRectangle",
            subtitle: "Custom Corners",
            description: "Draws a rectangle with different corner radii.",
            demo: .unevenRoundedRectangle,
            code: """
        UnevenRoundedRectangle(
            cornerRadii: .init(
                topLeading: 28,
                bottomLeading: 8,
                bottomTrailing: 28,
                topTrailing: 8
            )
        )
        .fill(.cyan)
        .frame(width: 120, height: 70)
        """
        ),
        
        //  ContainerRelativeShape
        .init(
            category: .shape,
            name: "ContainerRelativeShape",
            subtitle: "Relative Shape",
            description: "Creates a shape that follows its container.",
            demo: .containerRelativeShape,
            code: """
            ZStack {
                ContainerRelativeShape()
                    .fill(.blue.opacity(0.18))
            
                Text("Container")
            }
            .frame(width: 160, height: 100)
            .containerShape(RoundedRectangle(cornerRadius: 28))
            """
        ),
        
        //  Path
        .init(
            category: .shape,
            name: "Path",
            subtitle: "Custom Path",
            description: "Draws custom lines and shapes with points.",
            demo: .path,
            code: """
            Path { path in
                path.move(to: CGPoint(x: 20, y: 80))
                path.addLine(to: CGPoint(x: 70, y: 20))
                path.addLine(to: CGPoint(x: 120, y: 80))
                path.addLine(to: CGPoint(x: 20, y: 80))
            }
            .stroke(.blue, lineWidth: 5)
            .frame(width: 140, height: 100)
            """
        )
    ]
}
