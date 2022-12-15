//
//  FirstVC.swift
//  AccMathApp
//
//  Created by p.dhalpe on 15/12/22.
//

import UIKit

class FirstVC: UIViewController {

    @IBOutlet weak var imageViewOperators: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageViewOperators.rotate()
        self.addSnowflakes()
     }

    func addSnowflakes() {
        let flakeEmitterCell = CAEmitterCell()
        flakeEmitterCell.contents = UIImage(named: "snowflake")?.cgImage
        flakeEmitterCell.scale = 0.05
        flakeEmitterCell.scaleRange = 0.1
        flakeEmitterCell.scaleRange = .pi
        flakeEmitterCell.lifetime = 20.0
        flakeEmitterCell.birthRate = 30
        flakeEmitterCell.velocity = -30
        flakeEmitterCell.velocityRange = -20
        flakeEmitterCell.yAcceleration = 10
        flakeEmitterCell.xAcceleration = 1
        flakeEmitterCell.spin = -0.1
        flakeEmitterCell.spinRange = 1.0

        let snowEmitterLayer = CAEmitterLayer()
        snowEmitterLayer.emitterPosition = CGPoint(x: view.bounds.width / 2, y: -50)
        snowEmitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 0)
        snowEmitterLayer.emitterShape = CAEmitterLayerEmitterShape.line
        snowEmitterLayer.beginTime = CACurrentMediaTime()
        snowEmitterLayer.timeOffset = 10
        snowEmitterLayer.emitterCells = [flakeEmitterCell]

        //add to layout
        view.layer.addSublayer(snowEmitterLayer)
    }

}

extension UIImageView{
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 2
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}

