//
//  PreviewItemView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/22.
//

import SwiftUI

struct PreviewItemView: View {
    let item: PreviewComponent
    
    @State private var didCopy = false
    
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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            headerView
            Divider()
            descriptionView
            previewCard
            codeCard
        }
        .padding(20)
        .background(Color("WhiteAndBlack"))
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .shadow(color: .black.opacity(0.04), radius: 10, x: 0, y: 4)
    }
    
    // 组件头部
    private var headerView: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text(item.name)
                    .font(.system(size: 22, weight: .bold))
                
                Text(LocalizedStringKey(item.subtitle))
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            // 复制按钮
            Button(action: copyCode) {
                Text(didCopy ? "Copied" : "Copy")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.blue)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(Color.blue.opacity(0.12))
                    .clipShape(Capsule())
            }
        }
    }
    
    // 组件描述
    private var descriptionView: some View {
        Text(LocalizedStringKey(item.description))
            .font(.system(size: 14))
            .foregroundColor(.secondary)
    }
    
    // 预览卡片
    private var previewCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            demoView
        }
        .padding(18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
    
    // 代码卡片
    private var codeCard: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Text(item.code)
                .font(.system(size: 13, design: .monospaced))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(16)
        }
        .background(Color.black.opacity(0.04))
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
    
    @ViewBuilder
    private var demoView: some View {
        switch item.demo {
        case .text:
            Text(verbatim: "Hello, SwiftUI")
                .font(.system(size: 24, weight: .semibold))
            
        case .image:
            HStack(spacing: 20) {
                Image(systemName: "swift")
                    .font(.system(size: 40))
                    .foregroundColor(.orange)
                
                Image(systemName: "heart.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.pink)
            }
            .frame(maxWidth: .infinity)
            
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
            
        case .divider:
            VStack(spacing: 12) {
                Text(verbatim: "Top Content")
                Divider()
                Text(verbatim: "Bottom Content")
            }
            .frame(maxWidth: .infinity)
            
        case .progressView:
            VStack(alignment: .leading, spacing: 12) {
                ProgressView(value: 0.30)
                Text(verbatim: "30% Completed")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
            }
            
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
            .frame(maxWidth: .infinity)
            
        case .link:
            Link(destination: URL(string: "https://developer.Apple.com")!) {
                Text(verbatim: "Open Apple Developer")
                    .font(.system(size: 16, weight: .semibold))
            }
            
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
            
        case .toggle:
            Toggle(isOn: $toggleValue) {
                Text(verbatim: "Dark Mode")
            }
            
        case .slider:
            VStack(spacing: 12) {
                Slider(value: $sliderValue, in: 0...100, step: 1)
                Text(verbatim: "Value: \(Int(sliderValue))")
                    .font(.system(size: 16, weight: .medium, design: .monospaced))
                    .foregroundColor(.secondary)
            }
            
        case .stepper:
            Stepper(value: $stepperValue, in: 1...10) {
                Text(verbatim: "Num: \(stepperValue)")
            }
            
        case .pickerSegmented:
            Picker(selection: $segmentedSelection) {
                Text(verbatim: "First").tag(0)
                Text(verbatim: "Second").tag(1)
                Text(verbatim: "Third").tag(2)
            } label: {
                EmptyView()
            }
            .pickerStyle(.segmented)
            
        case .pickerMenu:
            Picker(selection: $menuSelection) {
                Text(verbatim: "Light").tag("Light")
                Text(verbatim: "Dark").tag("Dark")
                Text(verbatim: "System").tag("System")
            } label: {
                EmptyView()
            }
            .pickerStyle(MenuPickerStyle())
            
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
            
        case .colorPicker:
            VStack(alignment: .leading, spacing: 10) {
                ColorPicker(selection: $selectedColor, label: {
                    Text(verbatim: "Accent Color")
                })
                
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(selectedColor)
                    .frame(height: 44)
            }
            
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
            
        case .list:
            List {
                Text(verbatim: "Apple")
                Text(verbatim: "Banana")
                Text(verbatim: "Orange")
            }
            .frame(height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            
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
            
        case .tabView:
            TabView(selection: $tabSelection) {
                demoPage(title: "Home", icon: "house.fill", color: .blue).tag(0)
                demoPage(title: "Courses", icon: "book.fill", color: .green).tag(1)
                demoPage(title: "Tools", icon: "square.grid.2x2.fill", color: .orange).tag(2)
            }
            .frame(height: 180)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        }
    }
    
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
    
    // 复制代码
    private func copyCode() {
        UIPasteboard.general.string = item.code
        
        withAnimation(.easeInOut(duration: 0.2)) {
            didCopy = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            withAnimation(.easeInOut(duration: 0.2)) {
                didCopy = false
            }
        }
    }
    
    // 日期格式
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }
}
