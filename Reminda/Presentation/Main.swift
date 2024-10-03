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
        VStack(spacing: 0) {
            NavBar()
            NavigationStack(path: $router.navigationPath) {
                Home()
                    .navigationDestination(for: Routes.self) { screen in
                        Group {
                            switch screen {
                            case .Detail:
                                Home()
                            case .Profile:
                                Home()
                            case .Setting:
                                Home()
                            case .none:
                                EmptyView()
                            }
                        }
                        .navigationBarBackButtonHidden()
                    }
            }
        }
    }
}

#Preview {
    Main()
        .previewSupporter()
}
