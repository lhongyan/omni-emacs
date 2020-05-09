(defun open-config-dir()
    (interactive)
    (find-file "D:\\Users\\unixman\\Documents\\omni-emacs")
)

(defun open-hadoop-outline()
    (interactive)
    (find-file "D:\\Users\\unixman\\坚果云\\学习项目\\HADOOP学习提纲.org")
)

;; 加载GTD文件
(defun open-gtd-files()
    (interactive)
    (progn 
        (find-file "D:\\Users\\unixman\\坚果云\\日程管理\\01收集.org")
        (find-file "D:\\Users\\unixman\\坚果云\\日程管理\\02生活.org")
        (find-file "D:\\Users\\unixman\\坚果云\\日程管理\\03家庭.org")
        (find-file "D:\\Users\\unixman\\坚果云\\日程管理\\04健康.org")
        (find-file "D:\\Users\\unixman\\坚果云\\日程管理\\05工作.org")
        (find-file "D:\\Users\\unixman\\坚果云\\日程管理\\06学习.org")
        (find-file "D:\\Users\\unixman\\坚果云\\日程管理\\07理财.org")
        (find-file "D:\\Users\\unixman\\坚果云\\日程管理\\08人际.org")
        (find-file "D:\\Users\\unixman\\坚果云\\日程管理\\09其他.org")

        (switch-to-buffer "*scratch*")
    )
)

;; 加载个人事务文件
(defun open-domain-files()
    (interactive)
    (progn
        (find-file "D:\\Users\\unixman\\坚果云\\事务管理\\年度规划.org")
        (find-file "D:\\Users\\unixman\\坚果云\\事务管理\\引子清单.org")
        (find-file "D:\\Users\\unixman\\坚果云\\事务管理\\晨间日记.org")
        (find-file "D:\\Users\\unixman\\坚果云\\事务管理\\生活感悟.org")
        (find-file "D:\\Users\\unixman\\坚果云\\事务管理\\财务管理.org")
        (find-file "D:\\Users\\unixman\\坚果云\\事务管理\\软件管理.org")
        (find-file "D:\\Users\\unixman\\坚果云\\事务管理\\坚持的事.org")
        (find-file "D:\\Users\\unixman\\坚果云\\事务管理\\项目管理.org")
        (find-file "D:\\Users\\unixman\\坚果云\\事务管理\\书签管理.org")

        (switch-to-buffer "*scratch*")
    )
)

(provide 'init-minimal)