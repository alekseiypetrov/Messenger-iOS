import UIKit

final class PasswordRequirementsView: UIView {
    
    // MARK: - Constants
    
    private enum Constants {
        static let cornerRadius: CGFloat = 14.0
        static let cellTitles = [
            "Минимум 8 символов",
            "Пароли совпадают",
        ]
    }
    
    // MARK: - UI-elements
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.text = "Требования к паролю:"
        label.font = .plainText2
        label.textAlignment = .left
        label.textColor = .mText
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.rowHeight = 24.0
        table.allowsSelection = false
        table.isScrollEnabled = false
        table.separatorStyle = .none
        table.dataSource = self
        table.register(PasswordReqirementCell.self, forCellReuseIdentifier: PasswordReqirementCell.identifier)
        return table
    }()
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        setupView()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - Private methods
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        layer.cornerRadius = Constants.cornerRadius
        clipsToBounds = true
        addSubviews([title, tableView])
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            
            // Title Label Constraints
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
            title.topAnchor.constraint(equalTo: topAnchor, constant: 16.0),
            title.heightAnchor.constraint(equalToConstant: 20.0),
            
            // TableView Constrains
            tableView.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: title.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8.0),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16.0),
        ])
    }
}

extension PasswordRequirementsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Constants.cellTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PasswordReqirementCell.identifier) as? PasswordReqirementCell
        else { return UITableViewCell() }
        cell.text = Constants.cellTitles[indexPath.row]
        return cell
    }
    
    func updateCell(at row: Int, isCompleted: Bool) {
        let indexPath = IndexPath(row: row, section: 0)
        guard let cell = tableView.cellForRow(at: indexPath) as? PasswordReqirementCell else { return }
        cell.image = isCompleted ? .successCircleIcon : .filledCircleIcon
    }
}
