
import UIKit

class InitialViewController: UIViewController {

    private var initialView: InitialView
    
    //MARK: - Setup
    
    init() {
        self.initialView = InitialView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        view = initialView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        callButton()
    }
    
    // MARK: -- Button action
    
    func callButton() {
        initialView.loginButton.addTarget(self, action: #selector(tapButtonGoToLogin), for: .touchUpInside)
    }
    
    @objc func tapButtonGoToLogin(){
        let loginScene = LoginVC()
        loginScene.modalPresentationStyle = .fullScreen
        present(loginScene, animated: true)
    }
}
