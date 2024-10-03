//
//  ViewExtension+Preview.swift
//  Reminda
//
//  Created by Dung-pc on 03/10/2024.
//

import SwiftUI

extension View {
    func previewSupporter() -> some View {
        return self.modifier(PreviewModifier())
    }
}
