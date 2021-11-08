//
//  DetailAcronim.swift
//  Acromine Project
//
//  Created by David on 11/5/21.
//

import SwiftUI

struct ItemAcronim: View {
    var  lfsItem: LF
    var body: some View {
        VStack(alignment:.leading, spacing: 10){
            Text(lfsItem.lf)
                .font(.title)
            HStack{
                Text("Freq:\(lfsItem.freq)")
                    .font(.caption)
                
                Text("Since: \(lfsItem.since)")
                    .font(.caption)
            }
        }
    }
}

struct ItemAcronim_Previews: PreviewProvider {
    static var previews: some View {
        ItemAcronim(lfsItem: LF(lf: "ATP-binding cassette", freq: 1230, since: 1990, vars: []))
    }
}
