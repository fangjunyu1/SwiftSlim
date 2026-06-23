//
//  MapsToolView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/6/13.
//

import SwiftUI
import MapKit

struct MapsToolView: View {
    @EnvironmentObject var appStorage: AppStorageManager
    
    // 地图初始化坐标 - Apple Park
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.334900, longitude: -122.009020),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    // 用户选择的坐标点
    @State private var selectedCoordinate: CLLocationCoordinate2D? = CLLocationCoordinate2D(
        latitude: 37.334900,
        longitude: -122.009020
    )
    
    // 地图类型
    @State private var mapType: MKMapType = .standard
    
    // 复制代码
    @State private var didCopy = false
    
    // 地理名称
    @State private var addressText = "Apple Park"
    // 地理编码
    @State private var isGeocoding = false

    private let geocoder = CLGeocoder()
    
    var body: some View {
        ZStack {
            // MKMapView 地图
            TappableMapView(region: $region, selectedCoordinate: $selectedCoordinate, mapType: mapType)
                .ignoresSafeArea()
            
            // 文本内容
            VStack(spacing: 30) {
                // 地图顶部
                ToolHeaderView(tool: .Maps)
                    .padding(.horizontal, 20)
                    .background(Color("WhiteAndBlack").opacity(0.8))
                    .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                Spacer()
                // 地图选项
                mapOptions
            }
            .padding(20)
        }
        .navigationTitle("Maps")
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear {
            print("关闭课程")
            print("检测是否满足打开评分窗口")
            AppRating.checkReviewIfNeeded(appStorage: appStorage)
        }
    }
    
    // 底部图标
    var mapOptions: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            // 地图类型
            mapTypeButtons
            
            Divider()
            
            // 坐标
            if let selectedCoordinate {
                VStack {
                    HStack(alignment: .top) {
                        // 选择定位的参数
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Selected Coordinate")
                                .font(.headline)
                            
                            Text(LocalizedStringKey(addressText))
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                    .lineLimit(2)
                            
                            Text(verbatim: "Latitude: \(format(selectedCoordinate.latitude))")
                                    .font(.caption)

                            Text(verbatim: "Longitude: \(format(selectedCoordinate.longitude))")
                                    .font(.caption)

                            Text(verbatim: "Span: \(format(region.span.latitudeDelta)), \(format(region.span.longitudeDelta))")
                                    .font(.caption)
                        }
                        Spacer()
                        // 复制按钮
                        Button(action: {
                            copyCode(selectedCoordinate)
                        }, label: {
                            Text(didCopy ? "Copied" : "Copy")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.blue)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(Color.blue.opacity(0.12))
                                .clipShape(Capsule())
                        })
                    }
                }
            }
        }
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        .onChange(of: selectedCoordinate?.latitude) { _ in
            if let selectedCoordinate {
                reverseGeocode(selectedCoordinate)
            }
        }
        .onChange(of: selectedCoordinate?.longitude) { _ in
            if let selectedCoordinate {
                reverseGeocode(selectedCoordinate)
            }
        }
    }
    
    private func reverseGeocode(_ coordinate: CLLocationCoordinate2D) {
        isGeocoding = true
        addressText = "Loading address..."

        let location = CLLocation(
            latitude: coordinate.latitude,
            longitude: coordinate.longitude
        )

        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            isGeocoding = false

            if let error {
                addressText = "Address unavailable"
                print("Reverse geocode failed: \(error.localizedDescription)")
                return
            }

            guard let placemark = placemarks?.first else {
                addressText = "Address unavailable"
                return
            }

            let parts = [
                placemark.name,
                placemark.locality,
                placemark.administrativeArea,
                placemark.country
            ]
            .compactMap { $0 }
            .filter { !$0.isEmpty }

            addressText = parts.joined(separator: ", ")
        }
    }
    
    // 地图类型
    private var mapTypeButtons: some View {
        HStack(spacing: 8) {
            mapTypeButton("Standard", type: .standard, systemImage: "map")
            mapTypeButton("Satellite", type: .satellite, systemImage: "globe.americas")
            mapTypeButton("Hybrid", type: .hybrid, systemImage: "map.fill")
        }
    }
    
    // 数值格式化
    private func format(_ value: CLLocationDegrees) -> String {
        String(format: "%.6f", value)
    }

    // 地图类型按钮
    private func mapTypeButton(
        _ title: String,
        type: MKMapType,
        systemImage: String
    ) -> some View {
        Button {
            HapticManager.shared.selectionChanged()

            withAnimation(.easeInOut(duration: 0.2)) {
                mapType = type
            }
        } label: {
            Label {
                Text(LocalizedStringKey(title))
                    .font(.caption)
                    .fontWeight(.semibold)
            } icon: {
                Image(systemName: systemImage)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 9)
            .background(
                mapType == type
                ? Color.blue.opacity(0.18)
                : Color.clear
            )
            .foregroundStyle(mapType == type ? .blue : .primary)
            .clipShape(Capsule())
        }
        .buttonStyle(.plain)
    }
    
    // 复制代码
    private func copyCode(_ selectedCoordinate: CLLocationCoordinate2D) {
        // 触发振动
        HapticManager.shared.selectionChanged()
        
        let text = """
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: \(format(selectedCoordinate.latitude)),
                longitude: \(format(selectedCoordinate.longitude))
            ),
            span: MKCoordinateSpan(
                latitudeDelta: \(format(region.span.latitudeDelta)),
                longitudeDelta: \(format(region.span.longitudeDelta))
            )
        )
        """
        
        // 复制文本
        UIPasteboard.general.string = text
        
        withAnimation(.easeInOut(duration: 0.2)) {
            didCopy = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            withAnimation(.easeInOut(duration: 0.2)) {
                didCopy = false
            }
        }
    }
}

#Preview {
    NavigationView {
        MapsToolView()
            .environmentObject(AppStorageManager.shared)
    }
}
