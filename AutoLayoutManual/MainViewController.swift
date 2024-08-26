//
//  MainViewController.swift
//  AutoLayoutManual
//
//  Created by Chí Thành on 23/8/24.
//

import UIKit

class MainViewController: UIViewController {
    
    let myView = UIView()
    let myViewTwo = UIView()
    
    let circleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .orange
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Parent
        view.backgroundColor = UIColor.yellow
        
        // 1.Muon them doi tuong: parent add child as subview
        self.view.addSubview(myView)
        self.view.addSubview(myViewTwo)
        self.view.addSubview(circleView)
        
        // Function to custom view
        setupView1()
        setupView2()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        circleView.layer.cornerRadius = circleView.bounds.width / 2
    }
    
    func setupView1() {
        myView.backgroundColor = UIColor.red
        myView.center = view.center
        myViewTwo.backgroundColor = UIColor.blue
        
        // 2.Add autolayout, disable frame coordinate
        // myView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        myView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        myView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        myView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        myViewTwo.translatesAutoresizingMaskIntoConstraints = false
        myViewTwo.topAnchor.constraint(equalTo: myView.bottomAnchor, constant: 20).isActive = true
        myView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        myViewTwo.widthAnchor.constraint(equalToConstant: 200).isActive = true
        myViewTwo.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setupView2() {
        circleView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        circleView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        circleView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        circleView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
    }

}
