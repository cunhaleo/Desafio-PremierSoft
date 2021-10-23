//
//  ViewController.swift
//  DesafioPremierSoft
//
//  Created by Leonardo Cunha on 19/10/21.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var labeliOSpercentage: UILabel!
    @IBOutlet weak var labelAPIpercetage: UILabel!
    @IBOutlet weak var labelQApercentage: UILabel!
    
    
    @IBOutlet weak var labelAPIsumAge: UILabel!
    @IBOutlet weak var labelYoungerAPI: UILabel!
    @IBOutlet weak var labelOlderIos: UILabel!
    @IBOutlet weak var labelQAAvgAge: UILabel!
    @IBOutlet weak var labelNumStates: UILabel!
    @IBOutlet weak var labelIosInstructor: UILabel!
    @IBOutlet weak var labelApiInstructor: UILabel!
    
    let viewModel = ViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        navigationController?.delegate = self
        scrollView.delegate = self

        viewModel.getData()
        viewModel.getCandidatesPercentage()
        viewModel.sortByAlphabeticalOrder()
        viewModel.getInstructors()
        
        labeliOSpercentage.text = viewModel.iosPercentage
        labelAPIpercetage.text = viewModel.apiPercentage
        labelQApercentage.text = viewModel.qaPercentage
        labelAPIsumAge.text = "Soma de idade API .NET: \(viewModel.apiSumAge)"
        labelYoungerAPI.text = "Candidato API .NET mais novo: \(viewModel.apiYoungerCandidate)"
        labelOlderIos.text = "Candidato iOS mais velho: \(viewModel.iosOlderCandidate)"
        labelQAAvgAge.text = "Idade média candidatos QA: \(viewModel.qaAvgAge)"
        labelNumStates.text = "Número de estados diferentes: \(viewModel.numStates)"
        labelIosInstructor.text = "Instrutor de iOS: \(viewModel.iosInstructor.Nome)"
        labelApiInstructor.text = "Instrutor de API .NET: \(viewModel.apiInstructor.Nome)"
        
        
    }
    
    @IBAction func buttonVerCandidatos(_ sender: Any) {
        let verCandidatos = ListTableViewController()
        navigationController?.pushViewController(verCandidatos, animated: true)
    }
    

}
