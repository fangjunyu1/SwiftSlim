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
                    .background(Color.white.opacity(0.8))
                    .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                Spacer()
                // 地图选项
                MapOptions
            }
            .padding(.bottom, 40)
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
    
    var MapOptions: some View {
        VStack{
            
        }
    }
}

#Preview {
    NavigationView {
        MapsToolView()
            .environmentObject(AppStorageManager.shared)
    }
}
