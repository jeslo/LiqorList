//
//  DetailsOfLiqorViewController.swift
//  LiqorReuse
//
//  Created by Joe on 04/06/20.
//  Copyright © 2020 jess. All rights reserved.
//

import UIKit

class DetailsOfLiqorViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,LiqorSelectDelegate {
    
        
    var urlreceiver: String = ""
    var brands: [String] = []
    func responseFromApi(responseData: Any) {
        do {
            let retrn = responseData as! BrandDataStruct
            self.brands = retrn.data.list
           
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
        
        self.detailscaller.requestApiResponse(url:urlreceiver, DataStruct:  BevQ.selectBrand)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return brands.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let brandcelldetaildata = self.DetailedLiqorTableView.dequeueReusableCell(withIdentifier: "cellDetail", for: indexPath) as! DetailedLiqorTableViewCell
        brandcelldetaildata.DetailedLiqorLabel.text = brands[indexPath.row]
        return brandcelldetaildata
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

}
