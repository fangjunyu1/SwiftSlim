//
//  MapFallbackDemo.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/6/21.
//

import SwiftUI
import MapKit

struct MapFallbackDemo: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.3349, longitude: -122.00902),
        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
    )   // Map
    
    private let marker = MarkerItem(
        coordinate: CLLocationCoordinate2D(latitude: 37.3349, longitude: -122.00902)
    )
    
    var body: some View {
        if #available(iOS 17.0, *) {
            Map(initialPosition: .region(region)) {
                Marker(coordinate: region.center) {
                    Text(verbatim: "Apple Park")
                }
            }
            .frame(height: 220)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        } else {
            Map(coordinateRegion: $region, annotationItems: [marker]) { regin in
                MapAnnotation(
                    coordinate: regin.coordinate
                ) {
                    MarkerLikeAnnotation(title: "Apple Park")
                }
            }
            .frame(height: 220)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}

#Preview {
    MapFallbackDemo()
}

// 地图标识
struct MarkerLikeAnnotation: View {
    @Environment(\.colorScheme) var colorScheme
    let title: String
    
    var body: some View {
        VStack(spacing: 4) {
            VStack(spacing: 0) {
                Image(systemName: "mappin.circle.fill")
                    .foregroundStyle (
                        LinearGradient(
                          colors: [Color(hex: "eb74a3"), .red],
                          startPoint: .top,
                          endPoint: .bottom
                        )
                    )
                    .font(.system(size: 26))
                    .background(colorScheme == .light ? .white : .black)
                    .clipShape(Circle())
                if colorScheme == .light {
                    Triangle()
                        .fill(.white)
                        .frame(width: 5, height: 5)
                }
            }
            .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 2)
            OutlinedText(title)
                .font(.system(size: 10).bold())
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}

struct OutlinedText: View {
    @Environment(\.colorScheme) var colorScheme
    let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var fontColor: Color {
        colorScheme == .light ? Color.black : Color.white
    }
    
    var whiteColor: Color {
        colorScheme == .light ? Color.white.opacity(0.8) : Color.black.opacity(0.8)
    }
    
    var blurValue: Double = 1
    
    var body: some View {
        ZStack {
            Text(verbatim: text)
                .foregroundStyle(whiteColor)
                .offset(x: -1, y: 0)
                .blur(radius: blurValue)
            
            Text(verbatim: text)
                .foregroundStyle(whiteColor)
                .offset(x: 1, y: 0)
                .blur(radius: blurValue)
            
            Text(verbatim: text)
                .foregroundStyle(whiteColor)
                .offset(x: 0, y: -1)
                .blur(radius: blurValue)
            
            Text(verbatim: text)
                .foregroundStyle(whiteColor)
                .offset(x: 0, y: 1)
                .blur(radius: blurValue)
            
            Text(verbatim: text)
                .foregroundStyle(whiteColor)
                .offset(x: -1, y: -1)
                .blur(radius: blurValue)
            
            Text(verbatim: text)
                .foregroundStyle(whiteColor)
                .offset(x: 1, y: -1)
                .blur(radius: blurValue)
            
            Text(verbatim: text)
                .foregroundStyle(whiteColor)
                .offset(x: -1, y: 1)
                .blur(radius: blurValue)
            
            Text(verbatim: text)
                .foregroundStyle(whiteColor)
                .offset(x: 1, y: 1)
                .blur(radius: blurValue)
            
            Text(verbatim: text)
                .foregroundStyle(fontColor)
        }
    }
}
