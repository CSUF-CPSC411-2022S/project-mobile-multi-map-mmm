//
//  MapScreenViewModel.swift
//  MultiMap
//
//  Created by David Do on 3/19/22.
//
import Foundation
import MapKit
import SwiftUI
import UIKit


/*
enum MapDetails {
    
    static let startingLocation = CLLocationCoordinate2D(latitude: 33.879799, longitude: -117.885231)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
}

final class MapScreenViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    
    var locationManager: CLLocationManager?
    
    
   
    func updateRegion(startLocation: CLLocationCoordinate2D){
        region = MKCoordinateRegion(center: startLocation, span: MapDetails.defaultSpan)
    }
    
    func checkLocationServiceEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else {
            print("User must turn on location services.")
        }
    }
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("User Location is restricted.")
        case .denied:
            print("User Location has been denied, please allow user location permission.")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate,
                                        span: MapDetails.defaultSpan)
        @unknown default:
            break
        }

    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
*/

struct MapView: UIViewRepresentable {
    typealias UIViewType = UIView
    
    // var coordinate = CLLocationCoordinate2D()
    
    @EnvironmentObject var user: UserForm
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        
        let map = MKMapView()
        
        map.setRegion(MKCoordinateRegion(center: user.coordinate!, span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)), animated: true)
        
        view.addSubview(map)
        map.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            map.widthAnchor.constraint(equalTo: view.widthAnchor),
            map.heightAnchor.constraint(equalTo: view.heightAnchor),
            map.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            map.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        
        let pin = MKPointAnnotation()
        pin.coordinate = user.coordinate!
        map.addAnnotation(pin)
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        //Nothing
    }
}
