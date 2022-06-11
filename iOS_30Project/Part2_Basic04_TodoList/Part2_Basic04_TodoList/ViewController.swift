//
//  ViewController.swift
//  Part2_Basic04_TodoList
//
//  Created by Seong A Oh on 2022/06/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var tasks = [Task]() {
        didSet {
            self.saveTasks() // 할일이 추가될 때마다, UserDefaults에 저장
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.loadTasks()
    }

    @IBAction func tapEditButton(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func tapAddButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "할 일 등록", message: nil, preferredStyle: .alert)
        let registerButton = UIAlertAction(title: "등록", style: .default) { [weak self] _ in
            // 클로저와 클래스 인스턴스 사이의 강한 순환 참조(메모리 누수)를 없애기 위해
            // 클로저의 선언부에 [weak self]를 사용
//            debugPrint("\(alert.textFields?[0].text)") // 콘솔 창에 출력
            guard let title = alert.textFields?[0].text else { return }
            // 등록버튼을 눌렀을 시, 텍스트 필드의 내용을 가지고 올 수 있음
            // 텍스트필드를 1개만 넣었으므로, [0]으로 가져온다
            let task = Task(title: title, done: false)
            self?.tasks.append(task) // task가 추가될때마다 reload
            self?.tableView.reloadData()
            
        }
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(cancelButton)
        alert.addAction(registerButton)
        alert.addTextField { textField in
            textField.placeholder = "할 일을 입력해주세요"
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    func saveTasks() {
        let data = self.tasks.map {
            [
                "title": $0.title,
                "done": $0.done
            ]
        }
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "tasks") // UserDefaults에 저장
    }
    
    func loadTasks() {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "tasks") as? [[String: Any]] else { return } // 저장된 tasks 로드 + 타입변환
        self.tasks = data.compactMap { // tasks 배열에 저장
            // key에 해당하는 값 타입변환
            guard let title = $0["title"] as? String else { return nil }
            guard let done = $0["done"] as? Bool else { return nil }
            return Task(title: title, done: done) // Task 타입으로 정의
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let task = self.tasks[indexPath.row]
        cell.textLabel?.text = task.title
        if task.done { // bool 값에 따라 선택
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var task = self.tasks[indexPath.row]
        task.done = !task.done // 선택된 행의 task.done을 반대로 변경
        self.tasks[indexPath.row] = task //변경된 done 값을 저장
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
        // at: [배열]. 지금은 현재 선택한 행만 업데이트
        // with: 애니메이션. 행이 업데이트될 때 애니메이션 적용
        // .automatic: 시스템이 적절한 애니메이션 선택
    }
}
