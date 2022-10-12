//
//  ColorWheel.swift
//  simple-ui-nanoleaf
//
//  Created by Bob Squad Intern on 05/09/22.
//

import SwiftUI
struct ColorWheel: View {
    var body: some View {
        let colorWell : UIColorWell = {
            let colorWell = UIColorWell()
            colorWell.supportsAlpha = true
            colorWell.selectedColor = .systemBlue
            colorWell.title = "Color Well"
            return colorWell
        }()
        
        override func viewDidLoad() {
            viewDidLoad()
            body.backgroundColor = .systemGray
            colorWell.backgroundColor = .systemBlue
            body.addSubview(colorWell)
            
            colorWell.addTarget(self, action: #selector(colorChanged), for: .valueChanged)
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            colorWell.frame = CGRect(
                x: 20,
                y: body.safeAreaInsets.top,
                width: body.frame.size.width-40,
                height: 50
            )
        }
        
        @objc func colorChanged() {
            body.backgroundColor = colorWell.selectedColor
            lightSatApi()
            lightHueApi()
        }
    }
}

struct ColorWheel_Previews: PreviewProvider {
    static var previews: some View {
        ColorWheel()
    }
}
