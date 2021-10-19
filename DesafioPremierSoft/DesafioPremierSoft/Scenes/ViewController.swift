//
//  ViewController.swift
//  DesafioPremierSoft
//
//  Created by Leonardo Cunha on 19/10/21.
//

import UIKit

class ViewController: UIViewController {
    let viewModel = ViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getData()
        
        
    }
    
    

}
