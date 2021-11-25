
import UIKit


extension UIView {
    func bottomBorder(){
        
        let bottomLine = CALayer()
        bottomLine.backgroundColor = UIColor(red: 0.889, green: 0.889, blue: 0.9, alpha: 1.0).cgColor
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height-2, width: self.frame.size.width, height: 2)
        self.layer.addSublayer(bottomLine)
    }
}


extension UIViewController {
    
    func addHeaderTo(vc: UIViewController) {
        
        let Header = ProfileVC().view
        vc.view.addSubview(Header!)
        vc.view.sendSubviewToBack(Header!)
        vc.addChild(ProfileVC())
    }
}
