//
//  ViewController.swift
//  AccMathApp
//
//  Created by p.dhalpe on 14/12/22.
//

import UIKit
import AVFoundation

var player: AVAudioPlayer?

class ViewController: UIViewController {

    @IBOutlet weak var lblDigitA: UILabel!
    @IBOutlet weak var lblDigitB: UILabel!

    var randomOperator  = 0
    var randomNumberOne = 0
    var randomNumberTwo = 0
    var answer:String = "Total"

    @IBOutlet weak var lblOperator: UILabel!
    @IBOutlet weak var lblAnswer: UILabel!
    var operations = ["+", "-", "x", "÷"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.randomOperator = Int.random(in: 0..<4)
        self.randomNumberOne = Int.random(in: 1...99)
        self.randomNumberTwo = Int.random(in: 1...99)
        self.playSound()

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
            answer = String(firstDigit + secondDigit)
        case 1 :
            if firstDigit >= secondDigit{
                answer = String(firstDigit - secondDigit)
            } else {
                self.alertController(firstNum: firstDigit, secondNum: secondDigit)
                answer = String(firstDigit - secondDigit)
                displaySoundsAlert()
            }

        case 2 :
            answer = String(firstDigit * secondDigit)
        case 3 :
            answer = String(firstDigit / secondDigit)
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

    func alertController(firstNum:Int,secondNum:Int) {
        let deleteAlert = UIAlertController(title: "Oops", message: "\(firstNum) cannot be subtracted by \(secondNum), Because \(firstNum) is greater that \(secondNum) ", preferredStyle: UIAlertController.Style.actionSheet)

//            let unfollowAction = UIAlertAction(title: "Unfollow", style: .destructive) { (action: UIAlertAction) in
//                // Code to unfollow
//            }

            let cancelAction = UIAlertAction(title: "Ok!", style: .cancel, handler: nil)

           // deleteAlert.addAction(unfollowAction)
            deleteAlert.addAction(cancelAction)
            self.present(deleteAlert, animated: true, completion: nil)
    }

    func displaySoundsAlert() {
        let alert = UIAlertController(title: "Play Sound", message: nil, preferredStyle: UIAlertController.Style.alert)
        for i in 1000...1010 {
            alert.addAction(UIAlertAction(title: "\(i)", style: .default, handler: {_ in
                AudioServicesPlayAlertSound(UInt32(i))
                self.displaySoundsAlert()
            }))
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    func playSound() {
        guard let url = Bundle.main.url(forResource: "JingleBells", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}

