
import UIKit

class LoginVC: UIViewController {
    
    private var loginView: LoginView
    private let viewModel: LoginVM
    
    
    //MARK: - Setup
    
    init() {
        self.loginView = LoginView()
        self.viewModel = LoginVM()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        callButton()
    }
    
    // MARK: -- Button action
    
    func callButton() {
        loginView.backButton.addTarget(self, action: #selector(tapButtonGoToInitial), for: .touchUpInside)
        loginView.confirmButton.addTarget(self, action: #selector(tapCheckCredentials), for: .touchUpInside)
        loginView.createUserButton.addTarget(self, action: #selector(tapButtonGoToCreateUser), for: .touchUpInside)
    }
    
    
    @objc func tapButtonGoToInitial(){
        let initialScene = InitialVC()
        initialScene.modalPresentationStyle = .fullScreen
        present(initialScene, animated: true)
    }
    
    
    @objc func tapCheckCredentials(){
        viewModel.loginUser(with: loginView.emailField.text!, password: loginView.passwordField.text!) { success in
            if success != true {
                self.present(Utilities.Alert(Title: "Erro!", messageAlert: "Email ou senha incorretos"), animated: true)
            } else {
                let homeScene = TabBarVC()
                homeScene.modalPresentationStyle = .fullScreen
                self.present(homeScene, animated: false)
            }
        }
    }
    
    
    @objc func tapButtonGoToCreateUser(){
        let SignUpScene = SignUpVC()
        present(SignUpScene, animated: true)
    }
}
