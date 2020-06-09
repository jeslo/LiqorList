//
//  ViewController.swift
//  LiqorReuse
//
//  Created by Joe on 04/06/20.
//  Copyright © 2020 jess. All rights reserved.
//

import UIKit

let firstJsonUrl = "http://www.mocky.io/v2/5ed7e5123200003def274d22"
class ViewController: UIViewController,LiqorSelectDelegate, UITableViewDelegate,
UITableViewDataSource {
    let networkCaller = LiqorSelectionViewController()
    var liqor: [List] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.networkCaller.liqorDelegate = self
        self.liqorListTableView.delegate = self
        self.liqorListTableView.dataSource = self
        self.networkCaller.requestApiResponse(url: firstJsonUrl, DataStruct: BevQ.selectType)
    }
    @IBOutlet weak var liqorListTableView: UITableView!
    func responseFromApi(responseData: Any) {
        do {
//            let responseData = try JSONDecoder().decode(MainDataStruct.self, from: responseData as! Data)
            let resp = responseData as! MainDataStruct
            print("response data \(resp.data.list)")
            self.liqor = resp.data.list
            
            print("string data", self.liqor)
            DispatchQueue.main.async {
                self.liqorListTableView.reloadData()
            }
        } catch {
            print("paring error >>>>")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return liqor.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Liqorcelldata = self.liqorListTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LiqorViewCell
        Liqorcelldata.liqorLabel.text = liqor[indexPath.row].id
        return Liqorcelldata
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let newurl = self.liqor[indexPath.row].url
       let brandController =
            self.storyboard?.instantiateViewController(withIdentifier: "DetailsOfLiqorViewController")
                as! DetailsOfLiqorViewController
        brandController.urlreceiver = newurl
        self.navigationController?.pushViewController(brandController, animated: true)
        print(">>>>>>>>>>Haiiiiii")
                let rumview = storyboard?.instantiateViewController(withIdentifier: "DetailsOfLiqorViewController") as? DetailsOfLiqorViewController
        
        
    }
}


