
import UIKit

class ExtractorView: UIView {
    
    private lazy var titleTable: UILabel = {
        let label = UILabel()
        label.text = "Meus extratos "
        label.textAlignment = .left
        label.font = (UIFont.boldSystemFont(ofSize: 25))
        label.textColor = UIColor(red: 0.347, green: 0.336, blue: 0.4, alpha: 1.0)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var QtBoleto: UILabel = {
        let label = UILabel()
        label.text = "3 pagos"
        label.textAlignment = .right
        label.font = (UIFont.boldSystemFont(ofSize: 13.0))
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
        stack.spacing = 1.0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
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

extension ExtractorView {
    
    private func addSubview(){
        addSubview(StackView)
        addSubview(table)
        
        setupLayout()
    }
    
    private func setupLayout(){
        NSLayoutConstraint.activate([
            StackView.topAnchor.constraint(equalTo: topAnchor, constant: 200),
            StackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant:  24),
            StackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -24),
            
            table.topAnchor.constraint(equalTo: StackView.topAnchor, constant: 60),
            table.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            table.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            table.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func root(){
        backgroundColor = .white
    }
}
