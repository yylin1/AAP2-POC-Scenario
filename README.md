# Ansible Automation Platform PoC Scenario

![](https://github.com/ansible/workshops/raw/devel/images/rh-ansible-automation-platform.png)

基於常見需求項目彙整成以下幾個場景:

1. [AAP 2 結合 TWGCB 實現系統「自動化」合規檢查](https://github.com/yylin1/Ansible-POC-Scenario/blob/main/01_TWGCB/README.md)
2. [Workflow 功能](https://github.com/yylin1/Ansible-POC-Scenario/blob/main/02_Ｗorkflow/README.md)
3. [Automation Hub 介紹]()

| Demo Name | Description|
|-----------|------------|
| [01. Infrastructure Demos](01_Infrastructure/README.md) <br> 展示：服務及開發環境搭建  | 透過標準化的配置將遠程主機或虛擬機實現系統管理任務的自動化|
| [02. Compliance Demos](01_Infrastructure/README.md)<br> 展示：自動化資安稽核需求 | 透過自動化進行 TWGCB 臺灣政府組態標準合規之邏輯檢查，並產出對應需求報表 |
| [03. Operation Demos](01_Infrastructure/README.md)<br> 展示：維運團隊管理者日常應用 | 將維運團隊日常系統狀態檢查自動化，包含節點狀態、Agent 服務檢查、使用者檔案權限檢查、多設備憑證到期前提醒，配置排程及日常報表|
| [04. Network Demos](01_Infrastructure/README.md)<br> 展示：自動化網路開通請求 | 透過自動化開發者與網路團隊之間溝通，將開發者對於連接埠(Port)新增至 Linux 防火牆的例外清單相關需求申請審核並配置運行展演 |
| [05-Security Demos](01_Infrastructure/README.md)| TBD|
| [06-Developer Demos](01_Infrastructure/README.md)| TBD|


## Set up env
基於 RHPDS 的 `AAP2 Linux Automation Workshop` 環境。

## Scenario


This is a centralized location for all Ansible Product Demos going forward. 

| Demo Name                                                        | Description                                                                                 |
|------------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| [AAP on CodeReady](aap-on-crc/README.md)                         | Repository and video of how to install Ansible Automation Platform on Code Ready Containers |
| [Infrastructure Demos](old-demo-repository#infrastructure-demos) | Azure, AWS, Chocolatey, Linux and Windows Demos                                             |
| [Network Demos](old-demo-repository#network-demos)               | Cisco IOS and F5 Demos                                                                      |
| [Security Demos](old-demo-repository#security-demos)             | OSCAP and hardening demos                                                                   |
| [Developer Demos](old-demo-repository#developer-demos)           | Create Reports with Ansible                                                                 |

情境 <1> IT 伺服器管理團隊 - 資安稽核 
```
VM Temp -> 運行 TWGCB 邏輯檢查 -> 修復 -> 重新進行 TWGCB 邏輯檢查
```
情境 <2> IT 日常 Daily Check(帳號巡檢)

```
AAP2 執行 Daily Check Playbook -> 系統異常：無法連線主機 / 系統正常 -> 報表 + Webhook（mail通知）
```

情境 <3> 客製化 VM 開發環境

```
使用者可以自行輸入資源(CPU/Memory)需求 -> 產出對應 VM 開發環境
```

/補充/填單申請自動化佈屬  

```
> 環境部署 VM 右鍵設定 VM -> 人工設定 > 作 Approve / 
```

## To Use


---


- [ ] 展示 - AAP2 參數傳遞展示([Link](https://rheb.hatenablog.com/entry/aap_variables_between_jobs))
    - [ ] 透過隨機參數設定主機
    - [ ] 大量部署配置節點

情境 <3> 網路資安

```
1. Network Automation - Backup and Restore
2. Network Automation -Infrastructure Awareness
```




---
## 環境介紹



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


---

# Usage

To run the playbook without committing changes:

```
ansible-playbook -i network.hosts configure_network.yml -e "commit_changes=0"
```

To run the playbook committing the changes:

```
ansible-playbook -i network.hosts configure_network.yml -e "commit_changes=1"
```
    
# Disclaimer

This is just a demo. The final configuration is not meant to be production ready. The playbook and the code displayed here is distributed as it is just for informational purposes. Use it at your own risk.

# Author
Frank Lin <frank.lin@redhat.com>

## Reference
