
import UIKit

class HomeView: UIView {
    
    private lazy var cardInfo: UIView = {
       let card = UIView()
       card.layer.backgroundColor = UIColor(red: 0.345, green: 0.337, blue: 0.4, alpha: 1.0).cgColor
       card.layer.cornerRadius = 5
       card.addSubview(self.profileStackView)
       card.translatesAutoresizingMaskIntoConstraints = false
       return card
   }()
   
   private lazy var imageCodeBar: UIImageView = {
       let image = UIImageView(image: UIImage(named: "logomini"))
       image.translatesAutoresizingMaskIntoConstraints = false
       return image
   }()
   
   lazy var RegistrationAmountt: UILabel = {
       let label = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: 140.0, height: 40.0))
       label.textAlignment = .center
       label.font = (UIFont.boldSystemFont(ofSize: 13))
       label.textColor = .white
       label.numberOfLines = 0
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
   
   
   private lazy var profileStackView: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [imageCodeBar,RegistrationAmountt])
       stack.alignment = .center
       stack.axis = .horizontal
       stack.distribution = .equalSpacing
       stack.spacing = 1
       stack.translatesAutoresizingMaskIntoConstraints = false
       return stack
   }()
   
   
   private lazy var titleTable: UILabel = {
       let label = UILabel()
       label.text = "Meus boletos "
       label.textAlignment = .left
       label.font = (UIFont.boldSystemFont(ofSize: 25))
       label.textColor = UIColor(red: 0.347, green: 0.336, blue: 0.4, alpha: 1.0)
       label.numberOfLines = 0
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
   
   
   lazy var QtBoleto: UILabel = {
       let label = UILabel()
       label.textAlignment = .right
       label.font = (UIFont.boldSystemFont(ofSize: 13))
       label.textColor = UIColor(red: 0.44, green: 0.432, blue: 0.48, alpha: 1.0)
       label.numberOfLines = 0
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
   
   
   private lazy var StackView: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [titleTable,QtBoleto])
       stack.alignment = .center
       stack.axis = .horizontal
       stack.distribution = .equalSpacing
       stack.spacing = 1
       stack.translatesAutoresizingMaskIntoConstraints = false
       return stack
   }()
   
   
   lazy var buttonAdd: UIButton = {
       let button = UIButton(type: .system)
       button.layer.masksToBounds = true
       button.setImage(UIImage(systemName: "plus.app", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .medium)), for: .normal)
       button.tintColor = UIColor(red: 0.696, green: 0.691, blue: 0.72, alpha: 1.0)
       button.translatesAutoresizingMaskIntoConstraints = false
       return button
   }()
   
   
   lazy var table: UITableView = {
       let tableView = UITableView()
       tableView.register(BillCell.self, forCellReuseIdentifier: "BillCell")
       tableView.rowHeight = 60
       tableView.translatesAutoresizingMaskIntoConstraints = false
       return tableView
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
extension HomeView {
    
    private func addSubview(){
        addSubview(cardInfo)
        addSubview(StackView)
        addSubview(buttonAdd)
        addSubview(table)
        
        setupLayout()
    }
    
    private func setupLayout(){
        NSLayoutConstraint.activate([
            cardInfo.topAnchor.constraint(equalTo: topAnchor, constant: 144.0),
            cardInfo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24.0),
            cardInfo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24.0),
            cardInfo.heightAnchor.constraint(equalToConstant: 80.0),
            
            profileStackView.topAnchor.constraint(equalTo: cardInfo.topAnchor, constant: 20.0),
            profileStackView.leadingAnchor.constraint(equalTo: cardInfo.leadingAnchor, constant: 40.0),
            profileStackView.trailingAnchor.constraint(equalTo: cardInfo.trailingAnchor, constant: -20.0),

            StackView.topAnchor.constraint(equalTo: cardInfo.bottomAnchor, constant: 32.0),
            StackView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 24.0),
            StackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -24.0),
            StackView.heightAnchor.constraint(equalToConstant: 50.0),
            
            buttonAdd.topAnchor.constraint(equalTo: StackView.bottomAnchor, constant: 10.0),
            buttonAdd.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -24.0),
            
            table.topAnchor.constraint(equalTo: StackView.bottomAnchor, constant: 40.0),
            table.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24.0),
            table.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24.0),
            table.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
        
    }
    
    
    private func root(){
        backgroundColor = .white
    }
}
