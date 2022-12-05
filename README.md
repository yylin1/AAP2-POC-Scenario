# Ansible Automation Platform PoC Scenario

基於常見需求項目彙整成以下幾個場景:

1. [AAP 2 結合 TWGCB 實現系統「自動化」合規檢查](https://github.com/yylin1/Ansible-POC-Scenario/blob/main/01_TWGCB/README.md)
2. [Workflow 功能](https://github.com/yylin1/Ansible-POC-Scenario/blob/main/02_Ｗorkflow/README.md)
3. [Automation Hub 介紹]()



## 環境介紹
基於 RHPDS 的 `AAP2 Linux Automation Workshop` 環境。


## Done
- [x] 展示 TWGCB 運行報表 + 修復
- [x] RHPDS 原有 Workflow 範例 ([Link](https://aap2.demoredhat.com/exercises/ansible_rhel/2.6-workflows/))




## Ongoing
- [ ] 展示 - AAP2 參數傳遞展示([Link](https://rheb.hatenablog.com/entry/aap_variables_between_jobs))
    - [ ] 透過隨機參數設定主機
    - [ ] 大量部署配置節點

- [ ] 展示 - 基礎 Worflow 展示 ([參考: Demystifying Ansible Automation Platform](https://subscription.packtpub.com/book/cloud-and-networking/9781803244884/14#_ga=2.265211215.1548088141.1670164103-2125970887.1669945433))
    - [ ] Projects 介紹
    - [ ] Job Template 介紹
    - [ ] Workflow 介紹 (流程, 參數, Approve)
        - [x] 成功失敗執行說明
        - [x] 一對多 / 多對一 (結果 and, or 差異)
        - [x] 驗證
    - [ ] Notifications (Mail, Slack)

- [ ] 展示 - AAP2 保持計有 Localhost 將使用的 Ansible Controller EE 可使用外部磁區([Link1](https://www.ansible.com/blog/when-localhost-isnt-what-it-seems-in-red-hat-ansible-automation-platform-2), [Link2](https://rheb.hatenablog.com/entry/aap_store_files))

## TODO
- [ ] AAP2 運行創建 VM ([Link](https://michaelkotelnikov.medium.com/automating-workflow-in-red-hat-virtualization-using-ansible-6dfe5bd4ea1e))


