//
//  LiqorSelectionViewController.swift
//  LiqorReuse
//
//  Created by Joe on 04/06/20.
//  Copyright © 2020 jess. All rights reserved.
//
import UIKit

enum BevQ {
    case selectType
    case selectBrand
}

protocol LiqorSelectDelegate {
    func responseFromApi(responseData: Any)
}


class LiqorSelectionViewController: UIViewController {
    var liqorDelegate: LiqorSelectDelegate!
    var StruForMain: MainDataStruct!
    var StruForBrand: BrandDataStruct!
    
    func requestApiResponse(url: String, DataStruct: BevQ )
    {
    guard let apiurl = URL(string: url) else {return print(">>>> api failed")}
        URLSession.shared.dataTask(with: apiurl) { (data, response, error) in
            if let detaileddata = data {
        do
        {
            switch DataStruct{
            case  BevQ.selectType:
                let parsedData = try JSONDecoder().decode(MainDataStruct.self, from: detaileddata )
                print(">>>>>>>>>>", parsedData)
                
                self.liqorDelegate.responseFromApi(responseData: parsedData)
            case BevQ.selectBrand:
                 let parsedData = try JSONDecoder().decode(BrandDataStruct.self, from: detaileddata )
                 print(">>>>>>>>>>", parsedData)
                 
                 self.liqorDelegate.responseFromApi(responseData: parsedData)
            }
            
           
        }
        catch let error{
            print("Failed")
        }
            }
            }.resume()
    }
}
