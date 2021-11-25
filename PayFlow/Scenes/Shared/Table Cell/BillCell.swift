
import UIKit

class BillCell: UITableViewCell {
    
    static let identifier = "BillCell"
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.tintColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var date: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var value: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var StackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [title,date])
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 1
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureTitleView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(title: String,date: String,value: Double){
        self.title.text = title
        self.date.text = date
        self.value.text = "R$ \(String(value))"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
        date.text = nil
        value.text = nil
    }
}

extension BillCell{
    
   private func configureTitleView(){
        contentView.addSubview(StackView)
        contentView.addSubview(value)
        setupLayout()
    }
    
    private func setupLayout(){
        NSLayoutConstraint.activate([
            StackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            StackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),

            value.centerYAnchor.constraint(equalTo: centerYAnchor),
            value.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
        ])
    }
}
