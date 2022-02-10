
import UIKit

class LoginView: UIView {
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 24.0, height: 24.0)
        button.layer.masksToBounds = true
        button.setImage(UIImage(systemName: "arrow.backward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .medium)), for: .normal)
        button.tintColor = UIColor(red: 0.696, green: 0.691, blue: 0.72, alpha: 1.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var logo: UIImageView = {
        let logo = UIImageView(image: UIImage(named: "logofull"))
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()

    lazy var emailField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Digite o seu email"
        textField.textColor = .black
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.orange.cgColor
        textField.layer.cornerRadius = 10
        textField.layer.masksToBounds = true
        textField.leftViewMode = .always
        textField.leftView = UIImageView(image: UIImage(systemName: "envelope.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .medium)))
        textField.tintColor = .orange
        return textField
    }()
    
    lazy var  passwordField: UITextField = {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.placeholder = "Digite sua senha"
        textField.textColor = .black
        textField.keyboardType = .default
        textField.autocapitalizationType = .none
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.orange.cgColor
        textField.layer.cornerRadius = 10
        textField.leftViewMode = .always
        textField.leftView = UIImageView(image: UIImage(systemName: "key", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .medium)))
        textField.tintColor = .orange
        return textField
    }()
    
    lazy var confirmButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Confirmar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.backgroundColor = UIColor(red: 1.0, green: 0.58, blue: 0.1, alpha: 1.0).cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var createUserButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Não tem uma conta ? Cadastre-se", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private lazy var formStackView: UIStackView = {
        let StackView = UIStackView(arrangedSubviews: [emailField,passwordField])
        StackView.alignment = .leading
        StackView.distribution = .fillEqually
        StackView.axis = .vertical
        StackView.spacing = 7
        StackView.translatesAutoresizingMaskIntoConstraints = false
        return StackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubviews()
        root()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView {
    
    private func addSubviews(){
        addSubview(backButton)
        addSubview(logo)
        addSubview(formStackView)
        addSubview(confirmButton)
        addSubview(createUserButton)
        
        setupLayout()
    }
    
    private func setupLayout(){
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: topAnchor, constant: 70),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            logo.centerXAnchor.constraint(equalTo: centerXAnchor),
            logo.topAnchor.constraint(equalTo: topAnchor, constant: 112),
            logo.widthAnchor.constraint(equalToConstant: 160),
            logo.heightAnchor.constraint(equalToConstant: 140),
            
            emailField.widthAnchor.constraint(equalToConstant: 327),
            passwordField.widthAnchor.constraint(equalToConstant: 327),
            
            formStackView.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 100),
            formStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            formStackView.widthAnchor.constraint(equalToConstant: 327),
            formStackView.heightAnchor.constraint(equalToConstant: 120),
            
            confirmButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            confirmButton.topAnchor.constraint(equalTo: formStackView.bottomAnchor, constant: 10),
            confirmButton.widthAnchor.constraint(equalToConstant: 327),
            confirmButton.heightAnchor.constraint(equalToConstant: 48),
            
            createUserButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            createUserButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30)
        ])
    }
    
    private func root(){
        backgroundColor = .white
    }
}
