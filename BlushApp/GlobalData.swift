//
//  GlobalData.swift
//  BlushApp
//
//  Created by Dorothy Fu on 2018-07-20.
//  Copyright © 2018 Dorothy. All rights reserved.
//

import UIKit

class allLabels: UILabel {
    override func awakeFromNib() {
        let labelFont = "SanFrancisco"
        self.font = UIFont(name: labelFont, size: 16)
        self.textColor = .white
    }
}

class whiteLabelLarge: UILabel {
    override func awakeFromNib() {
        let labelFont = "SanFranciscoBold"
        self.font = UIFont(name: labelFont, size: 25)
        self.textColor = .white
    }
}

class homeLabel: UILabel {
    override func awakeFromNib() {
        self.textColor = .gray
        self.font = UIFont.systemFont(ofSize: 25)
    }
}

class allNavBars: UINavigationBar {
    override func awakeFromNib() {
        let color = UIColor(red: 242.0/255.0, green: 211.0/255.0, blue: 197.0/255.0, alpha: 1)
        self.titleTextAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16.0) ]
        self.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.isTranslucent = true
        self.shadowImage = UIImage()
        self.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    }
}

class gradientNavBars: UINavigationBar {
    override func awakeFromNib() {
        let color = UIColor(red: 242.0/255.0, green: 211.0/255.0, blue: 197.0/255.0, alpha: 1)
        self.titleTextAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16.0) ]
        self.titleTextAttributes = [NSAttributedStringKey.foregroundColor: color]
        self.isTranslucent = true
        self.shadowImage = UIImage()
        self.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    }
}

class CardView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 10
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 3
    @IBInspectable var shadowColor: UIColor? = UIColor.gray
    @IBInspectable var shadowOpacity: Float = 0.5
    
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
    }
    
}

class OnBoardingButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let btnFont = "SanFrancisco"
        let btnWidth = 200
        let btnHeight = 40
        
        //self.backgroundColor = UIColor(red: 242.0/255.0, green: 211.0/255.0, blue: 197.0/255.0, alpha: 1)
        self.backgroundColor = UIColor(red: 240.0/255.0, green: 178.0/255.0, blue: 173.0/255.0, alpha: 1)
        self.tintColor = .white
        self.titleLabel?.font = UIFont(name: btnFont, size: 16)
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.frame.size = CGSize(width: btnWidth, height: btnHeight)
        self.frame.origin = CGPoint(x: (((superview?.frame.width)! / 2) - (self.frame.width / 2)), y: self.frame.origin.y)
    }
}

class GradientView: UIView {
    override open class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }
    
    required init?(coder aDecoder: NSCoder) {
        let darkColor = UIColor(red: 240.0/255.0, green: 178.0/255.0, blue: 173.0/255.0, alpha: 1)
        let lightColor = UIColor(red: 244.0/255.0, green: 228.0/255.0, blue: 208.0/255.0, alpha: 1)
        super.init(coder: aDecoder)
        let gradientLayer = layer as! CAGradientLayer
        gradientLayer.colors = [darkColor.cgColor, lightColor.cgColor]
    }
}

struct GlobalUIVariables {
    static var settingsBackgroundColorPink = UIColor(red: 240.0/255.0, green: 178.0/255.0, blue: 173.0/255.0, alpha: 1)
    static var homePink = UIColor(red: 242.0/255.0, green: 211.0/255.0, blue: 197.0/255.0, alpha: 1)
}
