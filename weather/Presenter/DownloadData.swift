//
//  DownloadData.swift
//  weather
//
//  Created by Vasyl Hrynchuk on 11/6/17.
//  Copyright © 2017 andriy. All rights reserved.
//

import UIKit

struct City1: Codable {
    let query: Query
    
    struct Query: Codable {
        let results: Result
        
        struct Result: Codable {
            let channel: Channel
            
            struct Channel: Codable {
                let location: Location
                
                struct Location: Codable {
                    let city: String
                    let country: String
                }
                
                let item: Item
                
                struct Item: Codable {
                    let condition: Condition
                    let forecast: [Forecast]
                    
                    struct Forecast: Codable {
                        let date: String
                        let day: String
                        let high: String
                        let low: String
                        let text: String
                    }
                    
                    struct Condition: Codable {
                        let temp: Int
                        let text: String
                        let date: String
                    }
                    
                }
            }
        }
    }
}

class DownloadData {
    
    func getUrl(city: String) -> String {
//        let url = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22nome%2C%20ak%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"
//
        return ""
    }
    
    func downloadData() {
        let url = URL(string: "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22nome%2C%20ak%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")!
        
//        let jsonData = try! Data(contentsOf: url)
//
//        let jsonDecoder = JSONDecoder()
//        let cityForecast = try? jsonDecoder.decode(City1.self, from: jsonData)
//
//        print(cityForecast!.query.results.channel.location.city)
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let decodedData = try? JSONDecoder().decode(City1.self, from: data)
                DispatchQueue.main.async {
                    let city = City(title: decodedData!.query.results.channel.location.city,
                                    country: decodedData!.query.results.channel.location.country,
                                    lastUpdateTime: decodedData!.query.results.channel.item.condition.date,
                                    temperature: decodedData!.query.results.channel.item.condition.temp,
                                    forecast: [])
//                                    forecast(date: decodedData!.query.results.channel.item.forecast.date,
                    
                    
                }
            }
        }
        task.resume()
        
    }

}
