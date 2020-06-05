//
//  DetailsOfLiqorViewController.swift
//  LiqorReuse
//
//  Created by Joe on 04/06/20.
//  Copyright © 2020 jess. All rights reserved.
//

import UIKit

struct DetailData: Decodable {
    let success : Bool
    let data: data
}
struct data : Decodable {
    let list:[String]
}
class DetailsOfLiqorViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,LiqorSelectDelegate {
    
        
    var urlreceiver: String = ""
    var brands: [String] = []
    func responseFromApi(responseData: Any) {
        do {
            let responseData = try JSONDecoder().decode(DetailData.self, from: responseData as! Data)
            
            //print("response data>>>> \(responseData)")
        self.brands = responseData.data.list
            print("parsed data >>>>, \(responseData)")
            DispatchQueue.main.async {
                self.DetailedLiqorTableView.reloadData()
            }
            
        } catch {
            print("paring error >>>>")
        }
    }
    @IBOutlet weak var DetailedLiqorTableView: UITableView!
    let detailscaller = LiqorSelectionViewController()
    var object = ViewController().liqor
    override func viewDidLoad() {
        self.detailscaller.liqorDelegate = self
        super.viewDidLoad()
        self.DetailedLiqorTableView.delegate = self
        self.DetailedLiqorTableView.dataSource = self
        
        self.detailscaller.requestApiResponse(url:urlreceiver)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return brands.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let brandcelldetaildata = self.DetailedLiqorTableView.dequeueReusableCell(withIdentifier: "cellDetail", for: indexPath) as! DetailedLiqorTableViewCell
        brandcelldetaildata.DetailedLiqorLabel.text = self.brands[indexPath.row]
        return brandcelldetaildata
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

}
