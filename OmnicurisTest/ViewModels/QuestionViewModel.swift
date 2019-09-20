//
//  QuestionViewModel.swift
//  OmnicurisTest
//
//  Created by Prasad Ch on 19/09/19.
//  Copyright © 2019 Prasad Ch. All rights reserved.
//

import UIKit

class QuestionViewModel {
    
    
    func fetchQuestionFromJsonFile() -> [Mcq] {
        
        if let path = Bundle.main.path(forResource: "mcqtest", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let testQuestions = try decoder.decode(Questions.self, from: data)
                print("\(testQuestions)")
                return testQuestions.mcq
                
            } catch {
                // handle error
                print(error)
            }
        }
        return []
    }
}

