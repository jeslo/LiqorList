//
//  StructureForLiqorBrand.swift
//  LiqorReuse
//
//  Created by Joe on 05/06/20.
//  Copyright © 2020 jess. All rights reserved.
//

import Foundation
struct BrandDataStruct: Decodable {
    var success : Bool
    var data: data
}
struct data : Decodable {
    var list: [String]
}
