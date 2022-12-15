//
//  ViewController.swift
//  AccMathApp
//
//  Created by p.dhalpe on 14/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblDigitA: UILabel!
    @IBOutlet weak var lblDigitB: UILabel!

    var randomOperator  = 0
    var randomNumberOne = 0
    var randomNumberTwo = 0
    var answer:Int = 0

    @IBOutlet weak var lblOperator: UILabel!
    @IBOutlet weak var lblAnswer: UILabel!
    var operations = ["+", "-", "x", "÷"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.randomOperator = Int.random(in: 0..<4)
        self.randomNumberOne = Int.random(in: 1...99)
        self.randomNumberTwo = Int.random(in: 1...99)

    }

    @IBAction func btnPress(_ sender: Any) {
        let a = randmNum1()
        let b = randmNum2()
        self.randomNumber(firstDigit: a, secondDigit: b)
    }

    func randmNum1()-> Int{
        self.randomNumberOne = Int.random(in: 1...99)
        return self.randomNumberOne
    }

    func randmNum2()-> Int{
        self.randomNumberTwo = Int.random(in: 1...99)
        return self.randomNumberTwo
    }


    func randomNumber(firstDigit:Int, secondDigit:Int){
        self.randomOperator = Int.random(in: 0..<4)
        self.lblOperator.text = operations[self.randomOperator]
        self.lblDigitA.text = String(firstDigit)
        self.lblDigitB.text = String(secondDigit)


        switch randomOperator {
        case 0 :
            answer = firstDigit + secondDigit
        case 1 :
            if firstDigit >= secondDigit{
                answer = firstDigit - secondDigit
            } else {
                self.alertController()
            }

        case 2 :
            answer = firstDigit * secondDigit
        case 3 :
            answer = firstDigit / secondDigit
        default:
            print()
        }

        print(answer)
        self.lblAnswer.text = String(answer)
    }

    func alertView(){
        // create the alert
        let alert = UIAlertController(title: "Error", message: "First number should be greater", preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
    }

    func alertController() {
        let deleteAlert = UIAlertController(title: "Unfollow", message: "", preferredStyle: UIAlertController.Style.actionSheet)

            let unfollowAction = UIAlertAction(title: "Unfollow", style: .destructive) { (action: UIAlertAction) in
                // Code to unfollow
            }

            //let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

            deleteAlert.addAction(unfollowAction)
            //deleteAlert.addAction(cancelAction)
            self.present(deleteAlert, animated: true, completion: nil)
    }

}

