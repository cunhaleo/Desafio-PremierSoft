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
        viewModel.getCandidatesPercentage()
        viewModel.sortByAlphabeticalOrder()
        
        print("Soma de idade API .NET: \(viewModel.apiSumAge)")
        print("Candidato API .NET mais novo: \(viewModel.apiYoungerCandidate)")
        print("Candidato iOS mais velho: \(viewModel.iosOlderCandidate)")
        print("Idade média candidatos QA: \(viewModel.qaAvgAge)")
        print("Número de estados diferentes: \(viewModel.numStates)")
        
        viewModel.getInstructors()
        
    }
    
    

}
