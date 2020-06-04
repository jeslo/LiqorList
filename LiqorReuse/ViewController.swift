//
//  ViewController.swift
//  LiqorReuse
//
//  Created by Joe on 04/06/20.
//  Copyright © 2020 jess. All rights reserved.
//

import UIKit
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
let firstJsonUrl = "http://www.mocky.io/v2/5ed7e5123200003def274d22"

class ViewController: UIViewController,LiqorSelectDelegate {
    
    let networkCaller = LiqorSelectionViewController()
    func responseFromApi(responseData: Any) {
        do {
            let responseData = try JSONDecoder().decode(MainData.self, from: responseData as! Data)
            print("response data>>>> \(responseData)")
        } catch {
            print("paring error >>>>")
        }
    }
    
//    weak var LiqorView: UITableView!
    override func viewDidLoad() {
        self.networkCaller.liqorDelegate = self
        super.viewDidLoad()
//        self.LiqorView.delegate = self
//        self.LiqorView.dataSource = self
                // Do any additional setup after loading the view.
        self.networkCaller.requestApiResponse(url: firstJsonUrl)
    }

//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let Liqorcelldata = self.LiqorView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LiqorViewCell
//        Liqorcelldata.liqorLabel.text = "RUM"
//        return Liqorcelldata
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 70
//    }
}


