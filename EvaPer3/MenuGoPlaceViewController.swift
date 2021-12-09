//
//  MenuGoPlaceViewController.swift
//  EvaPer3
//
//  Created by Santa Cruz on 12/8/21.
//  Copyright © 2021 Juan Santa Cruz. All rights reserved.
//

import UIKit
import FirebaseAuth

class MenuGoPlaceViewController: UIViewController {

    @IBOutlet weak var solicitarButton: UIButton!
    
    @IBOutlet weak var pendientesButton: UIButton!
    
    @IBOutlet weak var aprobadosButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        solicitarButton.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        solicitarButton.layer.cornerRadius = 25.0
        solicitarButton.tintColor = UIColor.white
        
        pendientesButton.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        pendientesButton.layer.cornerRadius = 25.0
        pendientesButton.tintColor = UIColor.white
        
        aprobadosButton.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        aprobadosButton.layer.cornerRadius = 25.0
        aprobadosButton.tintColor = UIColor.white
        
    }
}
