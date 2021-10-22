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
    var modelCandidates: [Candidate] = []
    var iosInstructor: Candidate = Candidate(Nome: "", Vaga: "", Idade: "", Estado: "")
    var apiInstructor: Candidate = Candidate(Nome: "", Vaga: "", Idade: "", Estado: "")
    
    var apiCount: Double = 0
    var iosCount: Double = 0
    var qaCount: Double = 0
    var total: Double = 0
    var iosPercentage: String = ""
    var apiPercentage: String = ""
    var qaPercentage: String = ""
    
    var apiSumAge: Int = 0
    var apiYoungerCandidate: String = " "
    var apiYougerAge: Int = 100
    
    var iosOlderCandidate: String = " "
    var iosOlderAge: Int = 0
    
    var qaSumAge: Double = 0
    var qaAvgAge: Double = 0
    
    var numStates: Int = 0
    
    func getData(){
        if let url = URL(string: "https://raw.githubusercontent.com/premiersoft/AppAcademyChallenge2/main/AppAcademy_Candidates.csv") {
            do {
                let contents = try String(contentsOf: url)
                let candidates = contents.split(whereSeparator: \.isNewline)
                for candidate in candidates {                       // Separando cada candidatos por linha
                    let atribute = candidate.split(separator: ";")  // Para cada candidato, separando seus atributos
                    separatedCandidates.append(atribute)
                }
                var i: Int = 0
                for candidate in separatedCandidates {              // Passando do tipo SubString para String
                    arrayCandidates.append(["Candidato \(i)"])
                    for atribute in candidate {
                        arrayCandidates[i].append(String(atribute))
                    }
                    i = i + 1
                }
                arrayCandidates.remove(at: 0)
                for candidate in arrayCandidates {                  // Finalmente, criando meu array com o modelo de dado
                    let name = candidate[1]
                    let vaga = candidate[2]
                    let idade = candidate[3]
                    let estado = candidate[4]
                    let model = Candidate(Nome: name, Vaga: vaga, Idade: idade, Estado: estado)
                    modelCandidates.append(model)
                }
            } catch {
                // contents could not be loaded
            }
        } else {
            // the URL was bad!
        }
    }
    
    func getCandidatesPercentage () {
        numStates = 0
        apiCount = 0
        iosCount = 0
        qaCount = 0
        // API .NET
        apiSumAge = 0
        apiYougerAge = 100
        // IOS
        iosOlderAge = 0
        // QA
        qaSumAge = 0
        qaAvgAge = 0
        
        var statesList = Set<String>()
        
        for candidate in modelCandidates  {
            
            if candidate.Vaga == "API .NET" {
                apiCount += 1
                apiSumAge = apiSumAge + makeFirstWordAnInteger(candidate.Idade)
                if apiYougerAge > makeFirstWordAnInteger(candidate.Idade) {
                    apiYougerAge = makeFirstWordAnInteger(candidate.Idade)
                    apiYoungerCandidate = candidate.Nome
                }
                statesList.insert(candidate.Estado)
            }
            else if candidate.Vaga == "iOS" {
                iosCount += 1
                if iosOlderAge < makeFirstWordAnInteger(candidate.Idade) {
                    iosOlderAge = makeFirstWordAnInteger(candidate.Idade)
                    iosOlderCandidate = candidate.Nome
                }
                statesList.insert(candidate.Estado)
            }
            else if candidate.Vaga == "QA" {
                qaCount += 1
                qaSumAge += Double(makeFirstWordAnInteger(candidate.Idade))
                statesList.insert(candidate.Estado)
            }
            else {
                print("Trilha Nao Identificada: \(candidate)")
            }
        }
        print(statesList)
        numStates = statesList.count
        qaAvgAge = qaSumAge/qaCount
        total = qaCount + iosCount + apiCount
        iosPercentage = String(format: "Candidatos iOS: %.2f%%", iosCount/total*100)
        apiPercentage = String(format: "Candidatos API .NET: %.2f%%", apiCount/total*100)
        qaPercentage = String(format: "Candidatos QA: %.2f%%", qaCount/total*100)
    }
    
    func makeFirstWordAnInteger(_ myString: String) -> Int {
        
            if let firstWord = myString.components(separatedBy: " ").first {
                let myAge = Int(firstWord)
                return myAge ?? 0
            }
        return 0
    }
    
    func sortByAlphabeticalOrder() {
        modelCandidates = modelCandidates.sorted { (channel1, channel2) -> Bool in
            let channelName1 = channel1.Nome
            let channelName2 = channel2.Nome
                    return (channelName1.localizedCaseInsensitiveCompare(channelName2) == .orderedAscending)
        }
    }
    
    func isPrime(_ number: Int) -> Bool {
        return number > 1 && !(2..<number).contains { number % $0 == 0 }
    }
    
    func getFirstName(_ myString: String) -> String {
        if let subString = myString.components(separatedBy: " ").first {
            let firstName = String(subString)
            return firstName
        }
        else{
            return myString
        }
    }
    
    func getLastName(_ myString: String) -> String {
        if let subString = myString.components(separatedBy: " ").last {
            let lastName = String(subString)
            return lastName
        }
        else{
            return myString
        }
    }
    
    

    func countVowels(input: String) -> Int {
        let vowels: [Character] = ["a", "e", "i", "o", "u"]
        var vowelCount: Int = 0
        
        for ch in input.lowercased() {
            if (vowels.contains(ch)) {
                vowelCount += 1
            }
        }
        return vowelCount
    }

    
    func getInstructors () {
        
        for candidate in modelCandidates {
            
            if candidate.Vaga != "iOS" {
                
                if candidate.Estado == "SC" {
                    
                    if makeFirstWordAnInteger(candidate.Idade) > 20 {
                        
                        if isPrime(makeFirstWordAnInteger(candidate.Idade)) {
                            
                            if getLastName(candidate.Nome).first == "V" {
                                
                                iosInstructor = candidate
                            }
                        }
                    }
                }
            }
        }
        print(iosInstructor)
        
        for candidate in modelCandidates {
            
                if candidate.Vaga != "API .NET" {
                    
                    if candidate.Estado == "SC" {
                        
                        if makeFirstWordAnInteger(candidate.Idade) < 31 && makeFirstWordAnInteger(candidate.Idade) > 21 { // Década de 1990
                            
                            if isPrime(makeFirstWordAnInteger(candidate.Idade)) {
                                
                               	 if getLastName(candidate.Nome).last == "k" {
                                     
                                     if countVowels(input: getFirstName(candidate.Nome)) == 3 {
                                    
                                    apiInstructor = candidate
                                
                                }
                            }
                        }
                    }
                }
            }
        }
        print(apiInstructor)
    }
    
}
 
