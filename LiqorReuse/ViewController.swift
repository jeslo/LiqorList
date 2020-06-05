//
//  ViewController.swift
//  LiqorReuse
//
//  Created by Joe on 04/06/20.
//  Copyright © 2020 jess. All rights reserved.
//

import UIKit

let firstJsonUrl = "http://www.mocky.io/v2/5ed7e5123200003def274d22"

class ViewController: UIViewController,LiqorSelectDelegate, UITableViewDelegate, UITableViewDataSource {
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
    var liqor: [catagory] = []
    @IBOutlet weak var liqorListTableView: UITableView!
    let networkCaller = LiqorSelectionViewController()
    func responseFromApi(responseData: Any) {
        do {
            let responseData = try JSONDecoder().decode(MainData.self, from: responseData as! Data)
            
            //print("response data>>>> \(responseData)")
            self.liqor = responseData.data.list
            DispatchQueue.main.async {
                self.liqorListTableView.reloadData()
            }
            
           
            print(">>>>>>>>", liqor)
        } catch {
            print("paring error >>>>")
        }
    }
    
    override func viewDidLoad() {
        self.networkCaller.liqorDelegate = self
        super.viewDidLoad()
        self.liqorListTableView.delegate = self
        self.liqorListTableView.dataSource = self
        self.networkCaller.requestApiResponse(url: firstJsonUrl)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return liqor.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Liqorcelldata = self.liqorListTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LiqorViewCell
        Liqorcelldata.liqorLabel.text = self.liqor[indexPath.row].id
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
        //print(">>>>>>>>>>Haiiiiii")
//        let rumview = storyboard?.instantiateViewController(withIdentifier: "LiqorViewCell") as? LiqorViewCell
        
        
    }
}


