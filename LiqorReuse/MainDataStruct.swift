//
//  StructureForLiqorType.swift
//  LiqorReuse
//
//  Created by Joe on 05/06/20.
//  Copyright © 2020 jess. All rights reserved.
//
//
//import Foundation
//
//struct MainDataStruct: Decodable {
//    let data: data
//}
//
//struct  data: Decodable {
//    let list:[catagory]
//}
//
//struct catagory: Decodable {
//    let id:String
//    let url:String
//}


import Foundation

// MARK: - Welcome
struct MainDataStruct: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let list: [List]
}

// MARK: - List
struct List: Codable {
    let id: String
    let url: String
}

