//
//  LocationFetcher.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/6/24.
//

import CoreLocation

final class LocationFetcher: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()

    @Published var coordinate: CLLocationCoordinate2D?
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined
    @Published var errorMessage: String?

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyHundredMeters  // 地图精度为百米
    }

    // 请求定位服务
    func requestLocation() {
        
        // 检测授权状态
        switch manager.authorizationStatus {
            
        // 未确定时，请求授权
        case .notDetermined:
            manager.requestWhenInUseAuthorization()

        // 授权访问时，请求位置
        case .authorizedWhenInUse, .authorizedAlways:
            manager.requestLocation()

        // 授权访问被禁止
        case .denied, .restricted:
            errorMessage = "Location permission denied."

        // 其他授权场景
        @unknown default:
            errorMessage = "Unknown location authorization status."
        }
    }

    // 停止定位服务
    func stop() {
        manager.stopUpdatingLocation()
    }

    // 授权发现变更时
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus

        switch manager.authorizationStatus {
        
        case .authorizedWhenInUse, .authorizedAlways:
            manager.requestLocation()

        case .denied, .restricted:
            errorMessage = "Location permission denied."

        case .notDetermined:
            break

        @unknown default:
            break
        }
    }

    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        coordinate = locations.last?.coordinate
    }

    func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error
    ) {
        errorMessage = error.localizedDescription
    }
}
