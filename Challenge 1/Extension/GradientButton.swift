//
//  GradientButton.swift
//  Challenge 1
//
//  Created by Zacky Ilahi Azmi on 11/04/22.
//

import UIKit

//@IBDesignable
//class GradientButton: UIButton {
//
//    @IBInspectable var FirstColor: UIColor = UIColor.clear {
//        didSet {
//            updateView()
//        }
//    }
//
//    @IBInspectable var SecondColor: UIColor = UIColor.clear {
//        didSet {
//            updateView()
//        }
//    }
//
//    override class var layerClass: AnyClass {
//        get {
//            return CAGradientLayer.self
//        }
//    }
//
//    func updateView() {
//        let layer = self.layer as! CAGradientLayer
//        layer.colors = [FirstColor.cgColor, SecondColor.cgColor]
//    }
//}
@IBDesignable
public class GradientButton: UIButton {
    public override class var layerClass: AnyClass         { CAGradientLayer.self }
    private var gradientLayer: CAGradientLayer             { layer as! CAGradientLayer }

    @IBInspectable public var startColor: UIColor = .white { didSet { updateColors() } }
    @IBInspectable public var endColor: UIColor = .red     { didSet { updateColors() } }

    // expose startPoint and endPoint to IB

    @IBInspectable public var startPoint: CGPoint {
        get { gradientLayer.startPoint }
        set { gradientLayer.startPoint = newValue }
    }

    @IBInspectable public var endPoint: CGPoint {
        get { gradientLayer.endPoint }
        set { gradientLayer.endPoint = newValue }
    }

    // while we're at it, let's expose a few more layer properties so we can easily adjust them in IB
    @IBInspectable public var borderWidth: CGFloat {
        get { layer.borderWidth }
        set { layer.borderWidth = newValue }
    }

    @IBInspectable public var borderColor: UIColor? {
        get { layer.borderColor.flatMap { UIColor(cgColor: $0) } }
        set { layer.borderColor = newValue?.cgColor }
    }

    // init methods

    public override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        updateColors()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateColors()
    }
}

private extension GradientButton {
    func updateColors() {
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    }
}
