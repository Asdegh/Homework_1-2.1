//
//  ViewController.swift
//  Homework_1-2
//
//  Created by Asdegh on 13.10.2020.
//

import UIKit

enum TrafficLight {
    case off, stop, wait, go
}

class ViewController: UIViewController {

    @IBOutlet weak var stopLight: UIView!
    
    @IBOutlet weak var waitLight: UIView!
    
    @IBOutlet weak var goLight: UIView!
    
    let startButton = UIButton()
    
    private var trafficLight = TrafficLight.off
    
    private let switchOn: CGFloat = 1
    private let switchOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 8
        setupStartButton()
        
        stopLight.layer.cornerRadius = stopLight.bounds.size.width / 2
        waitLight.layer.cornerRadius = stopLight.bounds.size.width / 2
        goLight.layer.cornerRadius = stopLight.bounds.size.width / 2
        
        stopLight.alpha = switchOff
        waitLight.alpha = switchOff
        goLight.alpha = switchOff
    }
    // Button settings
    func setupStartButton() {
        startButton.backgroundColor = .blue
        startButton.setTitleColor(.white, for: .normal)
        startButton.setTitle("Start", for: .normal)
        startButton.layer.cornerRadius = 8
        
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        
        view.addSubview(startButton)
        setStartButtonConstraints()
    }
    // Button's constraints settings
    func setStartButtonConstraints() {
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 115).isActive = true
        startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -115).isActive = true
        startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
    }
    
    @objc func startButtonTapped() {
        startButton.setTitle("Next", for: .normal)
        
        
        switch trafficLight {
        
        case .off:
            stopLight.alpha = switchOn
            trafficLight = .stop
            
        case .stop:
            stopLight.alpha = switchOff
            waitLight.alpha = switchOn
            trafficLight = .wait
            
        case .wait:
            waitLight.alpha = switchOff
            goLight.alpha = switchOn
            trafficLight = .go
            
        case .go:
            stopLight.alpha = switchOn
            goLight.alpha = switchOff
            trafficLight = .stop
        }
    }
    
}

