//
//  Acromine.swift
//  Acromine Project
//
//  Created by David on 11/5/21.
//

import Foundation


//MARK: - Acromine
struct Acromine: Codable {
    
    let sf: String
    let lfs: [LF]
}

// MARK: - LF
struct LF: Codable, Hashable {
   // let id: UUID
    let lf: String
    let freq, since: Int
    let vars: [LF]?
}
