//
//  ActivityIndicatorView.swift
//  WeatherAppSimple
//
//  Created by Elexoft on 20/03/2025.
//

import SwiftUI
import NVActivityIndicatorView

struct ActivityIndicatorView: UIViewRepresentable {
    var isAnimating: Bool
    var type: NVActivityIndicatorType
    var color: UIColor
    var size: CGFloat

    func makeUIView(context: Context) -> NVActivityIndicatorView {
        let activityIndicator = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: size, height: size), type: type, color: color)
        return activityIndicator
    }

    func updateUIView(_ uiView: NVActivityIndicatorView, context: Context) {
        if isAnimating {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }
}

