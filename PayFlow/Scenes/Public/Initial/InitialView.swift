
import UIKit

class InitialView: UIView {

    private lazy var top: UIView = {
        let top = UIView()
        top.translatesAutoresizingMaskIntoConstraints = false
        top.layer.backgroundColor = UIColor(red: 1.0, green: 0.58, blue: 0.1, alpha: 1.0).cgColor
        return top
    }()
    
    private lazy var imagePerson: UIImageView = {
        let image = UIImageView(image: UIImage(named: "person"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
        
    private lazy var imageCode: UIImageView = {
        let image = UIImageView(image: UIImage(named: "logomini"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
        
    private lazy var textInfo: UILabel = {
        let label = UILabel()
        label.text = "Organize seus boletos em um só lugar"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = UIColor(red: 0.35, green: 0.34, blue: 0.4, alpha: 1.0)
        label.autoresizingMask = .flexibleHeight
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.masksToBounds = true
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor(red: 0.35, green: 0.34, blue: 0.4, alpha: 1.0), for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.89, green: 0.89, blue: 0.9, alpha: 1.0).cgColor
        button.layer.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.99, alpha: 1.0).cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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

extension InitialView {
    
    private func addSubviews(){
        addSubview(top)
        addSubview(imagePerson)
        addSubview(imageCode)
        addSubview(textInfo)
        addSubview(loginButton)
        
        setupLayout()
    }
    
    private func setupLayout(){
        NSLayoutConstraint.activate([
            top.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            top.leadingAnchor.constraint(equalTo: leadingAnchor),
            top.trailingAnchor.constraint(equalTo: trailingAnchor),
            top.heightAnchor.constraint(equalToConstant: 316),
            
            imagePerson.centerXAnchor.constraint(equalTo: centerXAnchor),
            imagePerson.topAnchor.constraint(equalTo: topAnchor, constant: 67),

            imageCode.topAnchor.constraint(equalTo: imagePerson.bottomAnchor, constant: 24),
            imageCode.centerXAnchor.constraint(equalTo: centerXAnchor),

            textInfo.topAnchor.constraint(equalTo: imageCode.bottomAnchor, constant: 24),
            textInfo.centerXAnchor.constraint(equalTo: centerXAnchor),
            textInfo.widthAnchor.constraint(equalToConstant: 236),

            loginButton.topAnchor.constraint(equalTo: textInfo.bottomAnchor, constant: 40),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 295),
            loginButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    private func root(){
        backgroundColor = .white
    }
}
