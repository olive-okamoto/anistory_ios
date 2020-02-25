//
//  CircleThumbnailImage.swift
//  anistory
//
//  Created by RyoOkamto on 2020/02/25.
//  Copyright © 2020 oliveapps. All rights reserved.
//

import SwiftUI

struct CircleThumbnailImage: View {
    var body: some View {
        Image("img_default_thumbnail")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 128, height: 128, alignment: .center)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.gray, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct CircleThumbnailImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleThumbnailImage()
    }
}
