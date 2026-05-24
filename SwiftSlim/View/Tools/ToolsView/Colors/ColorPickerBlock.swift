//
//  Untitled.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/5/24.
//

import SwiftUI

struct ColorPickerBlock: View {
    @State private var selectedColor: Color = .blue
    @State private var copiedText: String?
    
    private var colorInfo: ColorInfo? {
        ColorInfo(color: selectedColor)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack(spacing: 16) {
                Circle()
                    .fill(selectedColor)
                    .frame(width: 58, height: 58)
                    .overlay {
                        Circle()
                            .stroke(.secondary.opacity(0.25), lineWidth: 1)
                    }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Color Picker")
                        .font(.headline)
                    
                    ColorPicker("Select Color", selection: $selectedColor, supportsOpacity: false)
                        .labelsHidden()
                }
                
                Spacer()
            }
            
            if let colorInfo {
                VStack(spacing: 10) {
                    CopyableColorRow(
                        title: "HEX",
                        value: colorInfo.hex
                    )
                    
                    CopyableColorRow(
                        title: "RGB",
                        value: colorInfo.rgbText
                    )
                    
                    CopyableColorRow(
                        title: "SwiftUI",
                        value: colorInfo.swiftUICode
                    )
                }
                
                if copiedText != nil {
                    Text("Copied")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            } else {
                Text("Unable to read color values.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(20)
        .background(Color("WhiteAndBlack"))
        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
        .shadow(radius: 0.5)
    }
}

struct CopyableColorRow: View {
    @State private var copied = false
    let title: String
    let value: String
    
    var body: some View {
        HStack(spacing: 12) {
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
                .frame(width: 55, alignment: .leading)
            
            Text(value)
                .font(.system(.callout, design: .monospaced))
                .lineLimit(1)
                .truncationMode(.middle)
                .textSelection(.enabled)
            
            Spacer()
            
            Button(action: copyToClipboard) {
                Image(copied ? "checkmark" : "copy")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 15)
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(.secondary.opacity(0.08))
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
    
    private func copyToClipboard() { UIPasteboard.general.string = value
        withAnimation(.spring(response: 0.3)) {
            copied = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.spring(response: 0.3)) {
                copied = false
            }
        }
    }
}

struct ColorInfo {
    let red: Int
    let green: Int
    let blue: Int
    let alpha: Int
    
    var hex: String {
        if alpha < 255 {
            return String(format: "#%02X%02X%02X%02X", red, green, blue, alpha)
        } else {
            return String(format: "#%02X%02X%02X", red, green, blue)
        }
    }
    
    var rgbText: String {
        "rgb(\(red), \(green), \(blue))"
    }
    
    var rgbaText: String {
        let opacity = Double(alpha) / 255.0
        return String(format: "rgba(%d, %d, %d, %.2f)", red, green, blue, opacity)
    }
    
    var swiftUICode: String {
        let r = Double(red) / 255.0
        let g = Double(green) / 255.0
        let b = Double(blue) / 255.0
        let a = Double(alpha) / 255.0
        
        if alpha < 255 {
            return String(
                format: "Color(red: %.3f, green: %.3f, blue: %.3f, opacity: %.2f)",
                r, g, b, a
            )
        } else {
            return String(
                format: "Color(red: %.3f, green: %.3f, blue: %.3f)",
                r, g, b
            )
        }
    }
    
    init?(color: Color) {
        #if canImport(UIKit)
        let uiColor = UIColor(color)
        
        var redValue: CGFloat = 0
        var greenValue: CGFloat = 0
        var blueValue: CGFloat = 0
        var alphaValue: CGFloat = 0
        
        guard uiColor.getRed(&redValue, green: &greenValue, blue: &blueValue, alpha: &alphaValue) else {
            return nil
        }
        
        self.red = Int(redValue * 255)
        self.green = Int(greenValue * 255)
        self.blue = Int(blueValue * 255)
        self.alpha = Int(alphaValue * 255)
        
        #elseif canImport(AppKit)
        let nsColor = NSColor(color)
        
        guard let srgbColor = nsColor.usingColorSpace(.sRGB) else {
            return nil
        }
        
        self.red = Int(srgbColor.redComponent * 255)
        self.green = Int(srgbColor.greenComponent * 255)
        self.blue = Int(srgbColor.blueComponent * 255)
        self.alpha = Int(srgbColor.alphaComponent * 255)
        #endif
    }
}

#Preview {
    ColorsView()
}

