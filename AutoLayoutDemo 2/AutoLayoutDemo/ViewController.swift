//
//  ViewController.swift
//  AutoLayoutDemo
//
//  Created by Jason Chen on 7/11/19.
//  Copyright © 2019 Jason Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var questionBoard: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.questionBoard.delegate = self
        self.questionBoard.dataSource = self
        let nib = UINib.init(nibName: "SectionHeader", bundle: Bundle.main)
        self.questionBoard.register(nib, forHeaderFooterViewReuseIdentifier: "SectionHeader")
        // Do any additional setup after loading the view.
    }
    
    var questions = Array(QuestionBank().questionBank)
    var questionToPass: String!
    var rowToPass: Array<Int> = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?  {
        let view = self.questionBoard.dequeueReusableHeaderFooterView(withIdentifier: "SectionHeader") as! SectionHeader
        
        return view

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "question")!
        let ques = questions[indexPath.row]
        cell.textLabel?.text = ques.question
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        questionToPass = currentCell.textLabel?.text
        rowToPass = Array(questions[indexPath.row].answer)
        performSegue(withIdentifier: "showQuestion", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showQuestion") {
            if let vc = segue.destination as? Question {
                vc.receivedQuestion = questionToPass
                vc.receivedRow = rowToPass
                vc.receivedBank = questions
            }
        }
    }
    
    

}

