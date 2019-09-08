//
//  QuestionBank.swift
//  AutoLayoutDemo
//
//  Created by Jason Chen on 7/18/19.
//  Copyright © 2019 Jason Chen. All rights reserved.
//

import Foundation


class QuestionBank {
    var questionBank: Set<AnwserableQuestion>
    static let shared = QuestionBank()
    init() {
        questionBank = []
        while (questionBank.count < 15) {
            questionBank.insert(AnwserableQuestion())
        }
    }
}


