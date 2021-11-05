//
//  DetailAcronim.swift
//  Acromine Project
//
//  Created by David on 11/5/21.
//

import SwiftUI

struct DetailAcronim: View {
    var  lfsItem: LF
    
    var body: some View {
        
        List{
            ForEach(lfsItem.vars!, id:\.self){item in
                ItemAcronim(lfsItem: item)
            }
        }
        .navigationTitle(lfsItem.lf)
    }
}

struct DetailAcronim_Previews: PreviewProvider {
    static var previews: some View {
        DetailAcronim(lfsItem: LF(lf: "ATP-binding cassette", freq: 1230, since: 1990, vars: []))
    }
}
