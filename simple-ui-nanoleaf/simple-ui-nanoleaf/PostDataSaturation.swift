//
//  PostDataSaturation.swift
//  simple-ui-nanoleaf
//
//  Created by Bob Squad Intern on 05/09/22.
//

import Foundation

func lightSatApi() {
    let baseURL = URL(string: "http://192.168.2.30:16021/api/v1/q39Yundd3cIpzmNZpkbtnHaTLWQcEYN9/state")!
    let fullURL = baseURL.appendingPathComponent("/sat")

    var request = URLRequest(url: fullURL)
    request.httpMethod = "PUT"
    request.allHTTPHeaderFields = [
        "Content-Type": "application/json",
    ]
    let jsonDictionary: [String: [String:Int]] = [
        "sat": [
            "value": 10
        ]
    ]
    let data = try! JSONSerialization.data(withJSONObject: jsonDictionary, options: .prettyPrinted)
    URLSession.shared.uploadTask(with: request, from: data) { (responseData, response, error) in
            if let error = error {
                print("Error making PUT request: \(error.localizedDescription)")
                return
            }
            if let responseCode = (response as? HTTPURLResponse)?.statusCode, let responseData = responseData {
                guard responseCode == 200 else {
                print("Invalid response code: \(responseCode)")
                return
            }
                                                                 
            if let responseJSONData = try? JSONSerialization.jsonObject(with: responseData, options: .allowFragments) {
                print("Response JSON data = \(responseJSONData)")
            }
            }
    }
   .resume()
}

