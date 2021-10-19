//
//  ViewModel.swift
//  DesafioPremierSoft
//
//  Created by Leonardo Cunha on 19/10/21.
//

import Foundation

class ViewModel {
    
    
    func getData(){
        if let url = URL(string: "https://raw.githubusercontent.com/premiersoft/AppAcademyChallenge2/main/AppAcademy_Candidates.csv") {
            do {
                let contents = try String(contentsOf: url)
                var separatedCandidates: [[String.SubSequence]]  = []
                let candidates = contents.split(whereSeparator: \.isNewline)
                for candidate in candidates {
                    separatedCandidates.append(candidate.split(separator: ";"))
                }
                print(separatedCandidates)
            } catch {
                // contents could not be loaded
            }
        } else {
            // the URL was bad!
        }
    }
    
    
}
