//
//  LiqorSelectionViewController.swift
//  LiqorReuse
//
//  Created by Joe on 04/06/20.
//  Copyright © 2020 jess. All rights reserved.
//

import UIKit

protocol LiqorSelectDelegate {
    func responseFromApi(responseData: Any)
}

class LiqorSelectionViewController: UIViewController {
    var liqorDelegate: LiqorSelectDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        }
    func requestApiResponse(url: String)
    {
    guard let apiurl = URL(string: url) else {return print(">>>> api failed")}
    URLSession.shared.dataTask(with: apiurl) { (datas, response, error) in
        guard let data = datas else {return}
        self.liqorDelegate.responseFromApi(responseData: data)
            }.resume()
    }
}
