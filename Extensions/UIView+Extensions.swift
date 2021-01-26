//
//  UIView+Extensions.swift
//  Created by mario2r on 26/01/2021.
//

extension UIView {
    

    /// Add circle ripple effect to a view from a given point with an interval
    func ripple(origin: CGPoint, color: UIColor, duration: TimeInterval, radius: CGFloat, fadeAfter: TimeInterval) {
        let originX = self.bounds.width
        let originY = self.bounds.height
        let full = CGFloat(2 * Double.pi)
        
        let corners = [
            NSValue(cgPoint: CGPoint(x: 0, y: 0)),
            NSValue(cgPoint: CGPoint(x: 0, y: originY)),
            NSValue(cgPoint: CGPoint(x: originX, y: 0)),
            NSValue(cgPoint: CGPoint(x: originX, y: originY))
        ]
        
        // Calculate the corner closest to the origin and the one farther from it.
        // We might not need these values, but calculate them anyway so that the code
        // is clearer.
        var minDistance = CGFloat.greatestFiniteMagnitude
        var maxDistance: CGFloat = -1

        for cornerValue in corners {
            let corner = cornerValue.cgPointValue
            let distance = distanceBetween(origin, corner)
            if distance < minDistance {
                minDistance = distance
            }

            if distance > maxDistance {
                maxDistance = distance
            }
        }
        
        // Calculate the start and end radius of our ripple effect.
        // If the ripple starts inside the view then the start radis is 0, if it
        // starts outside the view then make the radius the distance to the nearest corner.
        let originInside = origin.x > 0 && origin.x < originX && origin.y > 0 && origin.y < originY
        // Note that if 0 is used as a default value then the circle may look misshapen.
        let startRadius: CGFloat = originInside ? 0.1 : minDistance

        // If we set a radius use it, if not then use the distance to the farthest corner.
        let endRadius = radius > 0 ? radius : minDistance

        // Create paths for out start and end circles.
        let startPath = UIBezierPath(arcCenter: origin,
            radius: startRadius,
            startAngle: 0,
            endAngle: full,
            clockwise: true)
        let endPath = UIBezierPath(
            arcCenter: origin,
            radius: endRadius,
            startAngle: 0,
            endAngle: full,
            clockwise: true)
        
        // Make sure the ripple effect doesn't "leave" the view.
        layer.masksToBounds = true
        
        // Create a new layer to draw the ripple on.
        let rippleLayer = CAShapeLayer()
        rippleLayer.name = "RippleLayer"
        rippleLayer.fillColor = color.cgColor
        
        // Create the animation
        let rippleAnimation = CABasicAnimation(keyPath: "path")
        rippleAnimation.fillMode = .both
        rippleAnimation.duration = duration
        rippleAnimation.fromValue = startPath.cgPath
        rippleAnimation.toValue = endPath.cgPath
        rippleAnimation.isRemovedOnCompletion = false
        rippleAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        
        // Set the ripple layer to be just above the bg.
        layer.insertSublayer(rippleLayer, at: 0)
        // Give the ripple layer the animation.
        rippleLayer.add(rippleAnimation, forKey: nil)
        
        // Enqueue blocks to handle animation ends.
        // We can use a delegate for this, but it complicates the code as handling
        // animation states is needed as well as @propertys to pass data around.
        // This may not be perfectly times but it is good enough.
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() +
                                        Double(fadeAfter * Double(NSEC_PER_SEC)) / Double(NSEC_PER_SEC), execute: {
            // Add a fade out animation.
            let fadeAnimation = CABasicAnimation(keyPath: "opacity")
            fadeAnimation.fillMode = .both
            fadeAnimation.duration = duration - fadeAfter
            fadeAnimation.fromValue = NSNumber(value: 1.0)
            fadeAnimation.toValue = NSNumber(value: 0.0)
            fadeAnimation.isRemovedOnCompletion = false

            rippleLayer.add(fadeAnimation, forKey: nil)
        })
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() +
                                        Double(duration * Double(NSEC_PER_SEC)) / Double(NSEC_PER_SEC), execute: {
            // All animations are done, so remove the layer.
            rippleLayer.removeAllAnimations()
            rippleLayer.removeFromSuperlayer()
        })
    }
    
    /// Returns the distance between two points
    private func distanceBetween(_ source: CGPoint, _ target: CGPoint) -> CGFloat {
        return CGFloat(sqrt(pow(abs(Float(source.x - target.x)), 2) + pow(abs(Float(source.y - target.y)), 2)))
    }
    
    /// Rounds corner of a given view with some value
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
        
}