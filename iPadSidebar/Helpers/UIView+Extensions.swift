//
//  UIView+Extensions.swift
//  iPadSidebar
//
//  Created by James Rochabrun on 6/28/20.
//

import UIKit

extension UIView {
    
    func circle(_ frame: CGRect? = nil) {
    self.layer.cornerRadius = (frame ?? self.frame).width / 2
    self.layer.masksToBounds = false
    self.clipsToBounds = true
  }
}

struct Instagram {
    
    static let gradientColors: [UIColor] = [#colorLiteral(red: 0.9607843137, green: 0.5215686275, blue: 0.1607843137, alpha: 1),#colorLiteral(red: 0.8666666667, green: 0.1647058824, blue: 0.4823529412, alpha: 1)]//[#colorLiteral(red: 0.9607843137, green: 0.5215686275, blue: 0.1607843137, alpha: 1), #colorLiteral(red: 0.9960784314, green: 0.8549019608, blue: 0.4666666667, alpha: 1), #colorLiteral(red: 0.8666666667, green: 0.1647058824, blue: 0.4823529412, alpha: 1), #colorLiteral(red: 0.5058823529, green: 0.2039215686, blue: 0.6862745098, alpha: 1), #colorLiteral(red: 0.3176470588, green: 0.3568627451, blue: 0.831372549, alpha: 1)]
}

enum StrokeGradientDirection {
    
    case vertical
    case horizontal
}

extension UIView {
    
    func setupGradient(cornerRadius: CGFloat, colors: [UIColor] = Instagram.gradientColors, lineWidth: CGFloat = 5, direction: StrokeGradientDirection = .horizontal, frame: CGRect? = nil) {
        
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        let gradient = CAGradientLayer()
        let frame = frame ?? self.frame
        gradient.frame = CGRect(origin: CGPoint.zero, size: frame.size)
        gradient.colors = colors.map({ (color) -> CGColor in
            color.cgColor
        })
        
        switch direction {
        case .horizontal:
            gradient.startPoint = CGPoint(x: 0, y: 1)
            gradient.endPoint = CGPoint(x: 1, y: 1)
        case .vertical:
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 0, y: 1)
        }
        
        let shape = CAShapeLayer()
        shape.lineWidth = lineWidth
        shape.path = UIBezierPath(roundedRect: self.bounds.insetBy(dx: lineWidth / 2.0,
                                                                   dy: lineWidth / 2.0), cornerRadius: cornerRadius).cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape
        
        self.layer.addSublayer(gradient)
    }
}

extension UIViewController {
    static var defaultStoryboardName: String {
        return String(describing: self)
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: defaultStoryboardName, bundle: nil)
    }
}

extension UIStoryboard {

    func instantiateViewControllerSubclass<T: UIViewController>() -> T {
        // Force casting as it would be programmer error to use this function and create a view controller from a storyboard whos initial view controller is not of this type.
        return instantiateViewController(withIdentifier: String(describing: T.self)) as! T
    }

    func instantiateInitialViewControllerSubclass<T: UIViewController>() -> T {
        // Force casting as it would be programmer error to use this function and create a view controller from a storyboard whos initial view controller is not of this type.
        return instantiateInitialViewController() as! T
    }
}

protocol Storyboardable: class {
    static var defaultStoryboardName: String { get }
}

extension Storyboardable where Self: UIViewController {

    static func storyboardInitialViewController() -> Self {
        // Force casting as it would be programmer error to use this function and create a view controller from a storyboard whos initial view controller is not of this type.
        return Self.storyboard.instantiateInitialViewControllerSubclass()
    }

    static func instantiate(from storyboard: UIStoryboard) -> Self {
        // Force casting as it would be programmer error to use this function and create a view controller from a storyboard whos initial view controller is not of this type.
        return storyboard.instantiateViewControllerSubclass()
    }
    
    /**
     Use the ViewController Class that you want to be returned as caller.
     Use the name of the Storyboard as parameter.
     This function should be used when the Storyboard name does not match the class name of it's Initial ViewController, Ideally they should.
     **/
    static func instantiate(from storyboardName: String) -> Self {
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateViewControllerSubclass()
    }
}

extension UIViewController: Storyboardable { }


extension UIColor {
    
    static var random: UIColor {
        return .init(hue: .random(in: 0...1),
                     saturation: 1,
                     brightness: 1,
                     alpha: 1)
    }
}
