import UIKit
import SnapKit

class NamesCell: UITableViewCell {
    
    var namesTitle = UILabel()
    var namesDescriptions = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(namesTitle)
        backgroundColor = UIColor.systemGray5
        namesTitle.snp.makeConstraints {make in
            make.left.top.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
        }
        addSubview(namesDescriptions)
        namesDescriptions.snp.makeConstraints{make in
            make.width.equalToSuperview().dividedBy(2)
            make.top.right.equalToSuperview()
        }
        configureNamesTitle()
        configureNamesDescriptions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureNamesTitle() {
        namesTitle.numberOfLines = 1
        namesTitle.adjustsFontSizeToFitWidth = true
        namesTitle.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    }
    func configureNamesDescriptions() {
        namesDescriptions.numberOfLines = 1
        namesDescriptions.adjustsFontSizeToFitWidth = true
        namesDescriptions.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    }
    }


