
import UIKit

class ProfileView: UIView {
    
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = (UIFont.boldSystemFont(ofSize: 20))
        label.textColor = .white
        return label
    }()
    
   private lazy var SubLogoText: UILabel = {
        let label = UILabel()
        label.text = "Manhatenha suas contas em dia"
        label.textAlignment = .left
        label.font = (UIFont.boldSystemFont(ofSize: 13))
        label.textColor = .white
        return label
    }()
    
    lazy var photoProfile: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "beard")
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    private lazy var StackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [welcomeLabel,SubLogoText])
        stack.alignment = .leading
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 415.0, height: 184.0))
        
        layer.backgroundColor = UIColor(red: 1.0, green: 0.58, blue: 0.1, alpha: 1.0).cgColor

        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfileView {
    
    private func addSubviews(){
        addSubview(StackView)
        addSubview(photoProfile)
        setupLayout()
    }
    
    private func setupLayout(){
        NSLayoutConstraint.activate([
            StackView.topAnchor.constraint(equalTo: topAnchor,constant: 64.0),
            StackView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 24.0),

            photoProfile.topAnchor.constraint(equalTo: topAnchor,constant: 64.0),
            photoProfile.heightAnchor.constraint(equalToConstant: 50.0),
            photoProfile.widthAnchor.constraint(equalToConstant: 50.0),
            photoProfile.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -24.0),
            
        ])
    }
}
