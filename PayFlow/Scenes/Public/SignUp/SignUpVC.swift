
import UIKit

class SignUpVC: UIViewController {
    
    private var signUpView: SignUpView
    private let viewModel: SignUpVM
    
    //MARK: - Setup
    
    init() {
        self.signUpView = SignUpView()
        self.viewModel = SignUpVM()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        view = signUpView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buttonCall()
    }
    
    //MARK: - Main
    
    private func validateFields() -> Bool? {
        
        if signUpView.firstNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            signUpView.lastNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            signUpView.emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            signUpView.passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return false
        }
        return nil
    }
    
    
    private func goToLogin(){
        let LoginScene = LoginVC()
        LoginScene.modalPresentationStyle = .fullScreen
        present(LoginScene,animated: true)
    }
    
    
    // MARK: - button action
    
    private func buttonCall(){
        signUpView.backButton.addTarget(self, action: #selector(tapButtonGoToLogin), for: .touchUpInside)
        signUpView.confirmButton.addTarget(self, action: #selector(tapButtonSubmit), for: .touchUpInside)
    }
    
    
    @objc func tapButtonGoToLogin(){
        goToLogin()
    }
    
    
    @objc func tapButtonSubmit(){
        
        let error = validateFields()
        if error != nil {
            present(Utilities.Alert(Title: "Campo não preenchido", messageAlert: "Todos os campos precisar está preenchidos"), animated: true)
        }
        
        let newUser = Register(id: "",
                               firstName: (signUpView.firstNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines))!,
                                lastName: (signUpView.lastNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines))!,
                                email: (signUpView.emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines))!,
                                password: (signUpView.passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines))!)
        
            
        viewModel.createUser(datas: newUser) { [self] success in
            if success != true {
                self.present(Utilities.Alert(Title: "Erro!", messageAlert: "Ocorreu um erro ao criar o usuario, tente novamente."), animated: true)
            } else {
                present(Utilities.Alert(Title: "Sucesso!", messageAlert: "Usuário criado com Sucesso"), animated: true)
                goToLogin()
            }
        }
    }
}
