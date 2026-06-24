//
//  TappableMapView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/6/19.
//

import SwiftUI
import MapKit

struct TappableMapView: UIViewRepresentable {
    @Binding var region: MKCoordinateRegion
    @Binding var selectedCoordinate: CLLocationCoordinate2D?
    
    var mapType: MKMapType = .standard
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = context.coordinator
        mapView.mapType = mapType
        mapView.setRegion(region, animated: false)
        
        let tapGesture = UITapGestureRecognizer(
            target: context.coordinator,
            action: #selector(Coordinator.handleTap(_:))
        )
        
        mapView.addGestureRecognizer(tapGesture)
        
        return mapView
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        mapView.mapType = mapType
        
        if !mapView.region.isSimilar(to: region) {
            mapView.setRegion(region, animated: true)
        }
        
        mapView.removeAnnotations(mapView.annotations)
        
        if let selectedCoordinate {
            let annotation = MKPointAnnotation()
//            annotation.title = "Selected"
            annotation.coordinate = selectedCoordinate
            mapView.addAnnotation(annotation)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject, MKMapViewDelegate {
        var parent: TappableMapView
        
        init(_ parent: TappableMapView) {
            self.parent = parent
        }
        
        @objc func handleTap(_ gesture: UITapGestureRecognizer) {
            guard let mapView = gesture.view as? MKMapView else { return }
            
            let point = gesture.location(in: mapView)
            let coordinate = mapView.convert(point, toCoordinateFrom: mapView)
            
            parent.selectedCoordinate = coordinate
            parent.region.center = coordinate
        }
        
        func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
            parent.region = mapView.region
        }
    }
}

private extension MKCoordinateRegion {
    func isSimilar(to other: MKCoordinateRegion) -> Bool {
        abs(center.latitude - other.center.latitude) < 0.000001 &&
        abs(center.longitude - other.center.longitude) < 0.000001 &&
        abs(span.latitudeDelta - other.span.latitudeDelta) < 0.000001 &&
        abs(span.longitudeDelta - other.span.longitudeDelta) < 0.000001
    }
}
