//
//  ViewController.swift
//  FoodDeliveryApp
//
//  Created by Max on 30.07.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.text = "Poshel Nahui"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 20)
        
        ])
        
        
        label.font = .Roboto.black.size(of: 40)
        view.backgroundColor = .red
        
        // Do any additional setup after loading the view.
    }


}

