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
        NavigationStack(path: $router.navigationPath) {
            Home()
                .navigationDestination(for: Routes.self) { screen in
                    Group {
                        switch screen {
                        case .AddingMemo:
                            AddingMemo()
                        case .Profile:
                            Home()
                        case .Setting:
                            Home()
                        case .none:
                            EmptyView()
                        case .Home:
                            Home()
                        }
                    }
//                    .navigationBarBackButtonHidden()
                }
        }
    }
}

#Preview {
    Main()
        .previewSupporter()
}
