//
//  ViewController.swift
//  OmnicurisTest
//
//  Created by Prasad Ch on 18/09/19.
//  Copyright © 2019 Prasad Ch. All rights reserved.
//

import UIKit

class TestVC: UIViewController {
    
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var tableViewTest: UITableView!
    @IBOutlet var tblViewOptions:UITableView!
    var testQuestions:[Mcq] = []
    var answerdQuestions:[Mcq] = []
    var questionViwModel = QuestionViewModel()
    var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Register Cell Nib
        let nib = UINib(nibName: "OptionCell", bundle: nil)
        tblViewOptions.register(nib, forCellReuseIdentifier: "OptionCellID")
        tblViewOptions.rowHeight = UITableView.automaticDimension
        tblViewOptions.estimatedRowHeight = 100
        testQuestions = questionViwModel.fetchQuestionFromJsonFile()
        previousBtn.isHidden = true
        previousBtn.addTarget(self, action: #selector(backToPreviousQuestion), for: .touchUpInside)
        nextBtn.addTarget(self, action: #selector(movingToNextQuestion), for: .touchUpInside)
        print(testQuestions)
        
        if testQuestions.count > 0 {
            answerdQuestions = testQuestions
            lblQuestion.text = answerdQuestions[questionIndex].question
            tblViewOptions.reloadData()
        }
    }
    
    override func viewDidLayoutSubviews(){
        
        tableViewTest.frame = CGRect(x: tableViewTest.frame.origin.x, y: tableViewTest.frame.origin.y, width: tableViewTest.frame.size.width, height: tableViewTest.contentSize.height)
        tableViewTest.reloadData()
    }
    
    // MARK: - Custom methods
    @objc func backToPreviousQuestion(){
        
        if questionIndex > 0 {
            nextBtn.setTitle("Next", for: .normal)
            questionIndex -= 1
            lblQuestion.text = answerdQuestions[questionIndex].question
            tableViewTest.frame = CGRect(x: tableViewTest.frame.origin.x, y: tableViewTest.frame.origin.y, width: tableViewTest.frame.size.width, height: tableViewTest.contentSize.height)
            tableViewTest.reloadData()
            if questionIndex == 0{
                previousBtn.isHidden = true
            }
        }
        
    }
    
    @objc func movingToNextQuestion(){
        if questionIndex < answerdQuestions.count - 1 {
            questionIndex += 1
            lblQuestion.text = answerdQuestions[questionIndex].question
            tableViewTest.frame = CGRect(x: tableViewTest.frame.origin.x, y: tableViewTest.frame.origin.y, width: tableViewTest.frame.size.width, height: tableViewTest.contentSize.height)
            tableViewTest.reloadData()
            previousBtn.isHidden = false
            if questionIndex == answerdQuestions.count - 1 {
                nextBtn.setTitle("Submit", for: .normal)
            }
        }else{
            let objViewController = self.storyboard?.instantiateViewController(withIdentifier: "TestResultVC") as! TestResultVC
            objViewController.testResultArray = answerdQuestions
            self.navigationController?.pushViewController(objViewController, animated: true)
        }
    }
    
    func updateQuestionWithGivenAnswer(selectedIdx:IndexPath){
        var mcq:Mcq = testQuestions[questionIndex]
        mcq.selectedOption = mcq.options[selectedIdx.row]
        answerdQuestions[questionIndex] = mcq
        DispatchQueue.main.async {
            self.tableViewTest.reloadData()
        }
    }
}

extension TestVC: UITableViewDataSource, UITableViewDelegate {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celldentifier = "OptionCellID"
        
        guard let optionCell = tableView.dequeueReusableCell(withIdentifier: celldentifier, for: indexPath) as? OptionCell else {
            return UITableViewCell()
        }
        optionCell.optionLbl.text = answerdQuestions[questionIndex].options[indexPath.row]
        optionCell.radioBtn.layer.cornerRadius = optionCell.radioBtn.frame.size.width / 2
        if answerdQuestions[questionIndex].options[indexPath.row] == answerdQuestions[questionIndex].selectedOption {
            optionCell.radioBtn.setImage(UIImage(named: "radioBtnActive"), for: .normal)
        }
        else{
            optionCell.radioBtn.setImage(UIImage(named: "radioBtn"), for: .normal)
        }

        return optionCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        updateQuestionWithGivenAnswer(selectedIdx: indexPath)
    }
    
}
