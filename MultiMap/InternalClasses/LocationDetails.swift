//
//  LocationDetails.swift
//  MultiMap
//
//  Created by Jason on 4/19/22.
//

import Foundation
import SwiftUI
import GooglePlaces

struct MapsAPIResult: Codable {
    var code: String
    var waypoints: [Waypoint]
}

struct Waypoint: Codable {
    var distance: String
    var location: [Double]
}


class LocationDetails: ObservableObject {
    @Published var newCoords: [CLLocationCoordinate2D] = [];
    @Published var totalDist = 0.0;
    var coordinateString: String = "";
    
    //@Published var types = [String]
    
    private var accessToken = "AIzaSyD-i2qs6Qo3idzByA8GbyQGOE9_rnFvA7M"
    
    func findCoordString(_ locArray: [CLLocationCoordinate2D]){
        for coord in locArray{
            coordinateString += "\(coord.latitude),\(coord.longitude);";
        }
    }
    
    func find() {
        let googleSearchURL = "https://api.mapbox.com/optimized-trips/v1/mapbox/driving/\(coordinateString)&key=\(accessToken)"
        
        /* addingPercentEncoding is a String method that returns a new string created by replacing all characters in the string not in the specified set (CharacterSet.urlQueryAllowed) with percent encoded characters. URLs cannot contain spaces and other special characters so they are replaced with percent encoded characters such as %20 indicating a space.
         
            URL is a structure that tries to convert a String into a URL object.
         */
        if let urlString1 = googleSearchURL.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed),
           let url = URL(string: urlString1) {
                // Creates a task that retrieves the contents of the specified URL, then calls a handler upon completion.
            print("Inside percent encoding")
                let task = URLSession.shared.dataTask(with: url) {
                    data, response, error in
                    // Run the code asynchronously so the UI can be updated while we wait for a reply from the server and decode the JSON.
                    DispatchQueue.main.async {
                        print("inside main async")
                        let jsonDecoder = JSONDecoder()
                        // Decode the JSON and store in result
                        if let validData = data, let result = try? jsonDecoder.decode(MapsAPIResult.self, from: validData) {
                            if result.code == "Ok" {
                                print("ISSUE: \(result.code)")
                                //self.photoRef = result.results[0].photos[0].photoReference
                                var total = 0.0;
                                for obj in result.waypoints{
                                    let temp = CLLocationCoordinate2D(latitude: obj.location[0], longitude: obj.location[1])
                                    self.newCoords.append(temp)
                                    
                                    if let num = Double(obj.distance){
                                        total += num;
                                    }
                                    else {
                                        total += 0;
                                    }
                                }
                                self.totalDist = total;
                                
                            } else {
                                self.totalDist = -1
                               
                            }
                        } else {
                            self.totalDist = -2
                        }
                    }
                }
                // Runs the task (open the URL)
                task.resume()
        }
    }
    
    func getDistance() -> Double{
        return self.totalDist
    }
    func getCoordinates() -> [CLLocationCoordinate2D]{
        return self.newCoords
    }

}
