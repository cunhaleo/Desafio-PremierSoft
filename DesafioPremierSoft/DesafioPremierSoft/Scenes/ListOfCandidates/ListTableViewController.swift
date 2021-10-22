//
//  ListTableViewController.swift
//  DesafioPremierSoft
//
//  Created by Leonardo Cunha on 22/10/21.
//

import UIKit

class ListTableViewController: UITableViewController {
        
    var viewModel = ViewModel()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Candidatos"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CandidatesTableViewCell", bundle: nil), forCellReuseIdentifier: "CandidatesTableViewCell")
        
        viewModel.getData()
        viewModel.getCandidatesPercentage()
        viewModel.sortByAlphabeticalOrder()
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.modelCandidates.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CandidatesTableViewCell") as? CandidatesTableViewCell {
            cell.setupcell(viewModel.modelCandidates[indexPath.row])
            return cell
        }
        else {
            return UITableViewCell()
        }
    }
}
