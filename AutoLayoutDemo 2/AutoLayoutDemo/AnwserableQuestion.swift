//
//  AnwserableQuestion.swift
//  AutoLayoutDemo
//
//  Created by Jason Chen on 7/18/19.
//  Copyright © 2019 Jason Chen. All rights reserved.
//

import Foundation

class AnwserableQuestion: Hashable, Equatable {
    
    var question: String
    var answer: Set<Int>
    var correctAnswer: Int

    init () {
        question = ""
        answer = []
        let num1 = Int.random(in: 5...20)
        let num2 = Int.random(in: 5...20)
        correctAnswer = num1 * num2
        question = String(num1) + " * " + String(num2) + " = "
        answer.insert(num1 * num2)
        while answer.count < 4 {
            answer.insert(Int.random(in: (num1*num2-5)...(num1*num2+5)))
        }
    }
    static func == (lhs: AnwserableQuestion, rhs: AnwserableQuestion) -> Bool {
        return lhs.question == rhs.question
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(question)
    }
}
