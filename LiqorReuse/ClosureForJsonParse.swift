//
//  ClosureForJsonParse.swift
//  LiqorReuse
//
//  Created by Joe on 04/06/20.
//  Copyright © 2020 jess. All rights reserved.
//

import Foundation



struct MainData: Decodable {
    
    let data: data
}
struct  data: Decodable {
    let list:[catagory]
    
}
struct catagory: Decodable {
    let id:String
    let url:String
}
//func ParseDataFromApi (url: String) -> catagory
//{
//    var mainitem: [catagory] = []
//    print("Go the urr", url)
//
//    guard  let url = URL(string: url) else {return 1}
//    URLSession.shared.dataTask(with: url) { (datas, response, err) in
//        guard let datas = datas else {return  print("Failed no response")}
//        do{
//            let liqorListData = try JSONDecoder().decode(MainData.self, from: datas)
//            mainitem = liqorListData.data.list
//                return mainitem
//
//        } catch _{
//            print("Failed")
//        }
//        }.resume()
//}
