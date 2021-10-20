//
//  ViewModel.swift
//  DesafioPremierSoft
//
//  Created by Leonardo Cunha on 19/10/21.
//

import Foundation

class ViewModel {
    
    var separatedCandidates: [[String.SubSequence]]  = []
    var arrayCandidates: [[String]] = []
    
    var apiCount: Int = 0
    var iosCount: Int = 0
    var qaCount: Int = 0
    
    var apiSumAge: Int = 0
    var apiYoungerCandidate: String = " "
    var apiYougerAge: Int = 100
    
    func getData(){
        if let url = URL(string: "https://raw.githubusercontent.com/premiersoft/AppAcademyChallenge2/main/AppAcademy_Candidates.csv") {
            do {
                let contents = try String(contentsOf: url)
                let candidates = contents.split(whereSeparator: \.isNewline)
                for candidate in candidates {
                    let atribute = candidate.split(separator: ";")
                    separatedCandidates.append(atribute)
                }
                var i: Int = 0
                for candidate in separatedCandidates {
                    arrayCandidates.append(["Candidato \(i)"])
                    for atribute in candidate {
                        arrayCandidates[i].append(String(atribute))
                    }
                    i = i + 1
                }
                print(arrayCandidates)
            } catch {
                // contents could not be loaded
            }
        } else {
            // the URL was bad!
        }
    }
    
    func getCandidatesPercentage () {
        apiCount = 0
        iosCount = 0
        qaCount = 0
        
        apiSumAge = 0
        apiYougerAge = 100
        
        for candidate in arrayCandidates  {
            
            
            if candidate[2] == "API .NET" {
                apiCount += 1
                apiSumAge = apiSumAge + makeFirstWordAnInteger(candidate[3])
                if apiYougerAge > makeFirstWordAnInteger(candidate[3]) {
                    apiYoungerCandidate = candidate[1]
                }
            }
            else if candidate[2] == "iOS" {
                iosCount += 1
            }
            else if candidate[2] == "QA" {
                qaCount += 1
            }
            else {
                print("Trilha Nao Identificada")
            }
            print("qa = \(qaCount), ios = \(iosCount), api = \(apiCount)")
        }
     
    }
    
    func makeFirstWordAnInteger(_ myString: String) -> Int {
        
            if let firstWord = myString.components(separatedBy: " ").first {
                let myAge = Int(firstWord)
                return myAge ?? 0
            }
        return 0
    }
}
 
