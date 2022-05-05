//
//  MapScreenViewModel.swift
//  MultiMap
//
//  Created by David Do on 3/19/22.
//
import Foundation
import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    typealias UIViewType = MKMapView
    
    // var coordinate = CLLocationCoordinate2D()
    
    @EnvironmentObject var user: UserForm
    
    func makeCoordinator() ->MapViewCoordinator {
        return MapViewCoordinator()
    }
    
    func makeUIView(context: Context) -> MKMapView {
        // Initialize Map View Instance
        let mapView = MKMapView()
        
        mapView.delegate = context.coordinator
        
        if user.coordinate == nil {
            user.coordinate = CLLocationCoordinate2D(latitude: 33.87, longitude: -117.88)
        }
        // Have screen center at user-inputed location
        //let region = MKCoordinateRegion(center: user.coordinate!, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 33.8723, longitude: -117.8851), span: MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0))
        mapView.setRegion(region, animated: true)
        
        //let p1 = MKPlacemark(coordinate: user.coordinate!)
        
        let start = MKPlacemark(coordinate: user.coordinate!)
        var arr: [MKPlacemark] = [];
        arr.append(start);
        
        if(!user.coordinateArray.isEmpty){
            for i in 0...user.coordinateArray.count - 1{
                arr.append(MKPlacemark(coordinate: user.coordinateArray[i]))
            }
        
        }
       
    
        mapView.addAnnotations(arr)
        
        if arr.count > 1 {
            for i in 0...arr.count-2{
                var request = MKDirections.Request()
                request.source = MKMapItem(placemark: arr[i])
                request.destination = MKMapItem(placemark: arr[i+1])
                request.transportType = .automobile
                
                var directions = MKDirections(request: request)
                directions.calculate { response, error in
                    guard var route = response?.routes.first else { return }
                    mapView.addOverlay((route.polyline))
                    mapView.setVisibleMapRect(route.polyline.boundingMapRect, edgePadding: UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30), animated: true)
                }
                
            }
        }
        
       
        
        return mapView
    }
     
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        //Nothing
    }
    class MapViewCoordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = .blue
            renderer.lineWidth = 5
            return renderer
        }
    }
}
