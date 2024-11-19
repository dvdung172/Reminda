//
//  Main.swift
//  Reminda
//
//  Created by Dung-pc on 02/10/2024.
//

import SwiftUI

struct Main: View {
    @EnvironmentObject private var router: Router
    
    var body: some View {
            Home()
    }
}

#Preview {
    Main()
        .previewSupporter()
}
