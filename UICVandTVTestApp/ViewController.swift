import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        return view
    }()
   
    private lazy var textField: UITextField = {
        let view = UITextField()
        view.placeholder = "Enter"
        return view
    }()
    
    private lazy var button1: UIButton = {
        let view = UIButton()
        view.backgroundColor = .systemGray
        view.setTitle("Click", for: .normal)
        view.setTitleColor(.red, for: .normal)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupSubviews()
    }

    
    private var names = ["Айка","Айсулуу","Акинай","Альбина","Алия","Айнура","Амина","Алина","Антонина","Анжелла"]

    private func setupSubviews(){
        view.addSubview(button1)
        button1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.right.equalToSuperview()
            make.height.equalTo(60)
            make.width.equalToSuperview().dividedBy(3)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(button1.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalTo(button1)
            make.height.equalTo(60)
            make.width.equalToSuperview().multipliedBy(0.6)
            
        }
    }
    
    private func setupViews(){
        button1.addTarget(nil, action: #selector(clickButton(view:)), for: .touchUpInside)
    }
    
    @objc func clickButton(view: UIButton) {
        var itemToDelete = textField.text!
        
        for item in names {
            if item == itemToDelete {
                names.remove(at: names.firstIndex(of: itemToDelete)!)
            }
            }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let index = indexPath.row
        
        let cell = NamesCell()
        
        cell.namesTitle.text = names[index]
        cell.namesDescriptions.text = "\(index + 1)"
        cell.backgroundColor = .gray
        
        return cell
    }
    
    
}

