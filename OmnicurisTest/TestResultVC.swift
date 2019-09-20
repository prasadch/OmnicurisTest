//
//  TestResultVC.swift
//  OmnicurisTest
//
//  Created by Prasada Rao Chokkapu on 19/09/19.
//  Copyright © 2019 Prasad Ch. All rights reserved.
//

import UIKit

class TestResultVC: UIViewController {

    @IBOutlet weak var resultTableView: UITableView!
    var testResultArray:[Mcq] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "ResultCell", bundle: nil)
        resultTableView.register(nib, forCellReuseIdentifier: "ResultCellID")
        resultTableView.rowHeight = UITableView.automaticDimension
        resultTableView.estimatedRowHeight = 100
    }

}
extension TestResultVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testResultArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celldentifier = "ResultCellID"
        
        guard let optionCell = tableView.dequeueReusableCell(withIdentifier: celldentifier, for: indexPath) as? ResultCell else {
            return UITableViewCell()
        }
        optionCell.lblQuestion.text = testResultArray[indexPath.row].question
        optionCell.actualAnswer.text = testResultArray[indexPath.row].answer
        optionCell.yourAnswer.text = testResultArray[indexPath.row].selectedOption.count > 0 ? testResultArray[indexPath.row].selectedOption : " "
        let listedOptionsArr = testResultArray[indexPath.row].options
        optionCell.lblOption1.text = listedOptionsArr[0]
        optionCell.lblOption2.text = listedOptionsArr[1]
        optionCell.lblOption3.text = listedOptionsArr[2]
        optionCell.lblOption4.text = listedOptionsArr[3]
        return optionCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
