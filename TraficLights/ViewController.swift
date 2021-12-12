//
//  ViewController.swift
//  TraficLights
//
//  Created by imatchyn on 12.12.2021.
//

import UIKit

enum TrafficLights {
    case red, yellow, green
}

class ViewController: UIViewController {

    @IBOutlet weak var redTrafficView: UIView!
    @IBOutlet weak var yellowTrafficView: UIView!
    @IBOutlet weak var greenTrafficView: UIView!
    
    @IBOutlet weak var button: UIButton!
    
    private var activeTrafficColor = TrafficLights.red
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = 15

    }
    
    override func viewWillLayoutSubviews() {
        redTrafficView.layer.cornerRadius = redTrafficView.frame.width / 2
        yellowTrafficView.layer.cornerRadius = redTrafficView.frame.width / 2
        greenTrafficView.layer.cornerRadius = redTrafficView.frame.width / 2
    }

    @IBAction func buttonHandler(_ sender: Any) {
        button.setTitle("Next", for: .normal)
    
        setTrafficActive()
    }
    
    private func setTrafficActive() -> Void {
        switch activeTrafficColor {
        case .red:
            redTrafficView.alpha = lightIsOn
            yellowTrafficView.alpha = lightIsOff
            greenTrafficView.alpha = lightIsOff
            activeTrafficColor = TrafficLights.yellow
        case .yellow:
            activeTrafficColor = TrafficLights.green
            redTrafficView.alpha = lightIsOff
            yellowTrafficView.alpha = lightIsOn
            greenTrafficView.alpha = lightIsOff
        case .green:
            activeTrafficColor = TrafficLights.red
            redTrafficView.alpha = lightIsOff
            yellowTrafficView.alpha = lightIsOff
            greenTrafficView.alpha = lightIsOn
        }
        
    }
    
}

