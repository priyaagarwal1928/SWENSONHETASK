
import UIKit
import  EZSwiftExtensions

typealias CompletionHandler = (_ success:Bool) -> Void


class CommonMethodsClass : NSObject {

    static let shared = CommonMethodsClass()
    let ind = MyIndicator(frame: CGRect(x:0 , y:0 , width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), image:UIImage.init(named: "refresh"))

    
    override init() // since it is overriding the NSObject init
    {
        
    }
    
    
    func loader()  {
        
        DispatchQueue.main.async {
            ez.topMostVC?.view.addSubview(self.ind)
            self.ind.startAnimating()
        }
    }
    
    func removeLoader()
    {
        DispatchQueue.main.async {
            self.ind.stopAnimating()
        }
    }
   
    
    class func showAlertViewWithActionOnWindow(titleStr: String, messageStr: String, okBtnTitleStr:String, cncelBtnTitleStr: String, completion: @escaping CompletionHandler)
    {
        let alert = UIAlertController(title: titleStr, message: messageStr, preferredStyle: UIAlertController.Style.alert)
        
        let alertAction = UIAlertAction.init(title: okBtnTitleStr, style: .default) { (UIAlertAction) in
            
            completion(true)
        }
        
        alert.addAction(alertAction)
        alert.addAction(UIAlertAction(title: cncelBtnTitleStr, style: UIAlertAction.Style.default, handler: nil))
        alert.view.tintColor =  UIColor.black
        ez.topMostVC?.present(alert, animated: true, completion: nil)

    }
    class func showAlertViewOnWindow(titleStr: String, messageStr: String, okBtnTitleStr:String)
    {
        let alert = UIAlertController(title: titleStr, message: messageStr, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: okBtnTitleStr, style: UIAlertAction.Style.default, handler: nil))
        alert.view.tintColor = UIColor.black
        ez.topMostVC?.present(alert, animated: true, completion: nil)
    }

   
   
}
