
import UIKit

class SignUpView: UIView {
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        button.layer.masksToBounds = true
        button.setImage(UIImage(systemName: "arrow.backward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .medium)), for: .normal)
        button.tintColor = UIColor(red: 0.696, green: 0.691, blue: 0.72, alpha: 1.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var titlePage: UILabel = {
        let label = UILabel()
        label.text = "Preecha seus dados pessoais"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var firstNameField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Nome"
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
    
    lazy var lastNameField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Sobrenome"
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
        let button = UIButton()
        button.setTitle("Confirmar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.layer.backgroundColor = UIColor(red: 1.0, green: 0.58, blue: 0.1, alpha: 1.0).cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    private lazy var formStackView: UIStackView = {
        let StackView = UIStackView(arrangedSubviews: [firstNameField,lastNameField,emailField,passwordField])
        StackView.alignment = .leading
        StackView.distribution = .fillEqually
        StackView.axis = .vertical
        StackView.spacing = 15
        StackView.translatesAutoresizingMaskIntoConstraints = false
        return StackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubview()
        root()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SignUpView {
    
    private func addSubview(){
        addSubview(backButton)
        addSubview(titlePage)
        addSubview(formStackView)
        addSubview(confirmButton)
        
        setupLayout()
    }
    
    private func setupLayout(){
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: topAnchor, constant: 70),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            titlePage.centerXAnchor.constraint(equalTo: centerXAnchor),
            titlePage.topAnchor.constraint(equalTo: topAnchor, constant: 112),
            
            firstNameField.widthAnchor.constraint(equalToConstant: 327),
            lastNameField.widthAnchor.constraint(equalToConstant: 327),
            emailField.widthAnchor.constraint(equalToConstant: 327),
            passwordField.widthAnchor.constraint(equalToConstant: 327),

            formStackView.topAnchor.constraint(equalTo: titlePage.bottomAnchor, constant: 100),
            formStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            formStackView.widthAnchor.constraint(equalToConstant: 327),
            formStackView.heightAnchor.constraint(equalToConstant: 168),
        
            confirmButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            confirmButton.topAnchor.constraint(equalTo: formStackView.bottomAnchor, constant: 10),
            confirmButton.widthAnchor.constraint(equalToConstant: 327),
            confirmButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    private func root(){
        backgroundColor = .white
    }
}
