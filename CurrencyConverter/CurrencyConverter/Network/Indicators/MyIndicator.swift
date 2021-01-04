
import UIKit

class MyIndicator: UIView,CAAnimationDelegate {
    
    let imageView = UIImageView()
    
    init(frame: CGRect, image: UIImage?) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.init(r: 0, g: 0, b: 0, a: 0.7)
        imageView.frame = CGRect(x: (self.frame.width - 50)/2, y: (self.frame.height - 50)/2, width: 50, height: 50)
        imageView.image = UIImage.init(named: "refresh")
        imageView.contentMode = .scaleAspectFit
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let label = UILabel(frame: CGRect(x: (self.frame.width - 200)/2, y: imageView.frame.y + 42, width: 200, height: 60))
        label.textAlignment = NSTextAlignment.center
        label.text = "Loading..."
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.font =  UIFont.init(name: "Poppins-Regular", size: 14.0)
        self.addSubview(label)
        addSubview(imageView)
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
     func startAnimating() {
        isHidden = false
        rotate()
    }
    
     func stopAnimating() {
        isHidden = true
        removeRotation()
    }
    
    private func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 0.8
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.imageView.layer.add(rotation, forKey: "rotationAnimation")
    }
    
    
    
    private func removeRotation() {
        self.imageView.layer.removeAnimation(forKey: "rotationAnimation")
    }
    
    
    private func rippleEffect()
    {
        let animation = CATransition()
        animation.delegate = self
        animation.duration = 2
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType(rawValue: "rippleEffect")
        self.imageView.layer.add(animation, forKey: nil)
    }
    
    private func removeRippleEffect() {
          self.imageView.layer.removeAnimation(forKey: "rippleEffect")
      }
}
