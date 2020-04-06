//
//  Houses.swift
//  GoT-Houses
//
//  Created by Heesu Yun on 4/6/20.
//  Copyright © 2020 Heesu Yun. All rights reserved.
//

import Foundation

class Houses {
    
//    private struct Returned: Codable {
//        var url: String
//        var name: String
//        var region: String
//        var coatOfAmrs: String
//    }
    var houseArray: [HouseInfo] = []
    var url = "https://www.anapioficeandfire.com/api/houses?page=1&pageSize=50"
    var pageNumber = 1
    
    func getData(completed: @escaping () -> ()) { //escaping closure to get data until you've gotten the data
           let urlString = url // 바꿀껀, url 이랑 do 아래 있는애들
           print("🕸 We are accessing the url \(urlString)")
           //Create a URL
           guard let url = URL(string: urlString) else{
               print("😡 ERROR: could not create URL from \(urlString)")
               completed()
               return
           }
           //Create Session
           let session = URLSession.shared
           
           //Get data with .dataTask method
           let task = session.dataTask(with: url) { (data, response, error) in
               if let error = error {
                   print("😡 ERROR: \(error.localizedDescription)")
               }
               
               do {
                self.houseArray = try JSONDecoder().decode([HouseInfo].self, from: data!) //using [] is an array & use this method is items are not below the any charts
                print("This is what we returned from getData: \(self.houseArray)")
               } catch {
                   print("😡 JSON ERROR: \(error.localizedDescription)")
               }
               completed()
           }
           task.resume()
       }
}
