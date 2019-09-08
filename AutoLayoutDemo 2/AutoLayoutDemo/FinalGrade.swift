//
//  FinalGrade.swift
//  AutoLayoutDemo
//
//  Created by Zhang Qiuhao on 7/21/19.
//  Copyright © 2019 Jason Chen. All rights reserved.
//

import UIKit

class FinalGrade: UIViewController {
    @IBOutlet weak var restart: UIButton!
    @IBOutlet weak var finalGrade: UILabel!
    var receivedRight: Int = 0
    var receivedWrong: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        finalGrade.text = "Right: " + String(receivedRight) + " Wrong: " + String(receivedWrong)
    }
    
    @IBAction func restartButtonClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindToStart", sender: nil)
    }
}
