//
//  ViewModel.swift
//  Acromine Project
//
//  Created by David on 11/5/21.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var acromine:[Acromine]? = []
    
    //MARK: - Function request json and parse
    func requestCode(abre: String, word: String) {
        let originalString = "http://www.nactem.ac.uk/software/acromine/dictionary.py?sf=\(abre)&lf=\(word)"
        let urlString = originalString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        let session = URLSession.shared
        let task = session.dataTask(with: request) {(data, response, error) in
            
            if let error = error{
                
                print(error.localizedDescription)
                return
            }
            
            guard let jsonData = data else {
                print("Data not found")
                return
            }
            do{
                let acromineElement = try JSONDecoder().decode([Acromine].self, from: jsonData)
                DispatchQueue.main.async {
                    self.acromine = acromineElement
                }
                
            }catch{
                
                print(error.localizedDescription)
            }
        }
        task.resume()
        
        
    }
}
