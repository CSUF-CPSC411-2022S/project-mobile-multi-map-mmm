//
//  LocationDetails.swift
//  MultiMap
//
//  Created by Jason on 4/19/22.
//

import Foundation
import SwiftUI
import GooglePlaces

struct PlaceSearchAPIResult: Codable {
    var results: [Place]
    var status: String

}

struct Place: Codable {
    var photos: [Photo]
    var name: String
    var rating: Double
}

struct Photo: Codable {
    var photoReference: String
}


class LocationDetails: ObservableObject {
    @Published var photoRef = ""
    @Published var rating = 0.0
    //@Published var types = [String]
    
    private var accessToken = "AIzaSyD-i2qs6Qo3idzByA8GbyQGOE9_rnFvA7M"

    func find(_ searchString: String) {
        guard searchString != "" else {
            return
        }
        
        let googleSearchURL = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=\(searchString)&key=\(accessToken)"
        
        /* addingPercentEncoding is a String method that returns a new string created by replacing all characters in the string not in the specified set (CharacterSet.urlQueryAllowed) with percent encoded characters. URLs cannot contain spaces and other special characters so they are replaced with percent encoded characters such as %20 indicating a space.
         
            URL is a structure that tries to convert a String into a URL object.
         */
        if let urlString1 = googleSearchURL.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed),
           let url = URL(string: urlString1) {
                // Creates a task that retrieves the contents of the specified URL, then calls a handler upon completion.
                let task = URLSession.shared.dataTask(with: url) {
                    data, response, error in
                    // Run the code asynchronously so the UI can be updated while we wait for a reply from the server and decode the JSON.
                    DispatchQueue.main.async {
                        let jsonDecoder = JSONDecoder()
                        // Decode the JSON and store in result
                        if let validData = data, let result = try? jsonDecoder.decode(PlaceSearchAPIResult.self, from: validData) {
                            if result.status == "OK" {
                                print("ISSUE: \(result.status)")
                                //self.photoRef = result.results[0].photos[0].photoReference
                                self.rating = result.results[0].rating
                                
                            } else {
                                print("ISSUE: RYAN")
                                self.photoRef = "No results found"
                            }
                        } else {
                            print("ISSUE: REMY")
                            self.photoRef = "No results found"
                        }
                    }
                }
                // Runs the task (open the URL)
                task.resume()
        }
        //print("PHOTO REFERENCE: \(self.photoRef)")
        print("RATING: \(self.rating)")
    }
    
//    func loadMapImage(long: Double, lat: Double) {
//        let zoom = 15
//        let rotation = 0
//        let mapboxImageURL = "https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/\(long),\(lat),\(zoom),\(rotation)/300x200?access_token=\(accessToken)"
//       
//        if let url = URL(string: mapboxImageURL) {
//            let task = URLSession.shared.dataTask(with: url) {
//                data, respnse, error in
//                
//                DispatchQueue.main.async {
//                    if let validData = data, let result = UIImage(data: validData) {
//                        self.image = result
//                    } else {
//                        self.firstFoundName = "No results found"
//                    }
//                }
//        }
//        task.resume()
//        }
//    }
}
