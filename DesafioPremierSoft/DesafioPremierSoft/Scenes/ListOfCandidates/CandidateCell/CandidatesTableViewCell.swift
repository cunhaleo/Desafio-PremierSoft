//
//  CandidatesTableViewCell.swift
//  DesafioPremierSoft
//
//  Created by Leonardo Cunha on 22/10/21.
//

import UIKit

class CandidatesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var labelVaga: UILabel!
    @IBOutlet weak var labelState: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupcell(_ model: Candidate) {
        labelName.text = model.Nome
        labelAge.text = model.Idade
        labelVaga.text = model.Vaga
        labelState.text = model.Estado
    }
    
}
