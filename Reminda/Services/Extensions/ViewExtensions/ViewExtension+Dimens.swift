//
//  ViewExtension+Dimens.swift
//  JF_IOS
//
//  Created by Dung-pc on 03/10/2024.
//

import SwiftUI

// MARK: - Frame size
extension View {
    func fillDeviceScreen(alignment: Alignment = .center) -> some View {
        return self
            .frame(width: UIConstants.screenWidth, height: UIConstants.screenHeight, alignment: alignment)
    }
    
    func fillParentWidth(alignment: Alignment = .center) -> some View {
        return self
            .frame(maxWidth: UIScreen.main.bounds.width, alignment: alignment)
    }
    
    func fillParentHeight(alignment: Alignment = .center) -> some View {
        return self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
    
    func fillParentSize(alignment: Alignment = .center) -> some View {
        return self
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
    }
    
    func fillScreenWidth(alignment: Alignment = .center) -> some View {
        return self
            .frame(width: UIScreen.main.bounds.width, alignment: alignment)
    }
    
//    func fillListItemWidthInWhiteBox(alignment: Alignment = .center, additionPadding: CGFloat = 0.0) -> some View {
//        return self
//            .frame(width: UIScreen.main.bounds.width - UIConstants.fullWidthInWhiteBoxOffset - additionPadding, alignment: alignment)
//    }
//    
//    func fillListItemWidth(alignment: Alignment = .center) -> some View {
//        return self
//            .frame(width: UIScreen.main.bounds.width - UIConstants.fullWidthOffset, alignment: alignment)
//    }
}
