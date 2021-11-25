
import UIKit

class RegisterBillView: UIView {
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.masksToBounds = true
        button.setImage(UIImage(systemName: "arrow.backward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .medium)), for: .normal)
        button.tintColor = UIColor(red: 0.696, green: 0.691, blue: 0.72, alpha: 1.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var titlePage: UILabel = {
        let label = UILabel()
        label.text = "Preencha os dados do boleto"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor(red: 0.347, green: 0.336, blue: 0.4, alpha: 1.0)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var titleBillField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 350.0, height: 48.0))
        textField.placeholder = "Nome do boleto"
        textField.textAlignment = .center
        textField.bottomBorder()
        textField.leftViewMode = .always
        textField.leftView = UIImageView(image: UIImage(systemName: "doc.plaintext", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .medium)))
        textField.tintColor = .orange
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var dueDateFiel: UITextField = {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 350.0, height: 48.0))
        textField.placeholder = "Vencimento"
        textField.bottomBorder()
        textField.leftViewMode = .always
        textField.leftView = UIImageView(image: UIImage(systemName: "xmark.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .medium)))
        textField.tintColor = .orange
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var valueField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 350.0, height: 48.0))
        textField.placeholder = "Valor"
        textField.bottomBorder()
        textField.leftViewMode = .always
        textField.leftView = UIImageView(image: UIImage(systemName: "creditcard", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .medium)))
        textField.tintColor = .orange
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var barcodeField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 350.0, height: 48.0))
        textField.placeholder = "Código"
        textField.bottomBorder()
        textField.textAlignment = .center
        textField.leftViewMode = .always
        textField.leftView = UIImageView(image: UIImage(systemName: "barcode", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .medium)))
        textField.tintColor = .orange
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancelar", for: .normal)
        button.setTitleColor(UIColor(red: 0.44, green: 0.432, blue: 0.48, alpha: 1.0), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cadastrar", for: .normal)
        button.setTitleColor(UIColor(red: 1.0, green: 0.58, blue: 0.1, alpha: 1.0), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var formStackView: UIStackView = {
        let StackView = UIStackView(arrangedSubviews: [titleBillField,dueDateFiel,valueField,barcodeField])
        StackView.alignment = .leading
        StackView.distribution = .fillEqually
        StackView.axis = .vertical
        StackView.translatesAutoresizingMaskIntoConstraints = false
        return StackView
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let StackView = UIStackView(arrangedSubviews: [cancelButton,registerButton])
        StackView.alignment = .center
        StackView.distribution = .fillEqually
        StackView.axis = .horizontal
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

extension RegisterBillView {
    
    private func addSubview(){
        addSubview(backButton)
        addSubview(titlePage)
        addSubview(formStackView)
        addSubview(buttonStackView)
        
        setupLayout()

    }
    
    private func setupLayout(){
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: topAnchor, constant: 70),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            titlePage.topAnchor.constraint(equalTo: topAnchor, constant: 112),
            titlePage.centerXAnchor.constraint(equalTo: centerXAnchor),
            titlePage.heightAnchor.constraint(equalToConstant: 60),
            titlePage.widthAnchor.constraint(equalToConstant: 189),
            
            formStackView.topAnchor.constraint(equalTo: topAnchor, constant: 186),
            formStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            formStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            formStackView.heightAnchor.constraint(equalToConstant: 240),
        
            buttonStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonStackView.heightAnchor.constraint(equalToConstant: 73),
            buttonStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -34),
        ])
    }
    
    private func root(){
        backgroundColor = .white
    }
}
