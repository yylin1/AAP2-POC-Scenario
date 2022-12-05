# 在 Ansible Automation Job 之間傳遞變量

## 環境說明

- 本篇使用 Ansible Automation Platform 2.2 (Ansible automation controller 4.2.0) 為例進行說明

### Job A

- 接受密碼以 {字串} 作為變數使用
- 設置管理對象的密碼
- 使密碼字串在下一個 Job Template 可以使用

```
---
- hosts: all
  gather_facts: false

  vars:
    service_account: ansible

  tasks:
  - name: store a password for further use
    set_stats:
      data:
        service_account_password: "{{ password_string }}"
      aggregate: false

  - name: change a password for a service account
    user:
      name: "{{ service_account }}"
      state: present
      password: "{{ password_string | password_hash('sha512', 65534 | random(seed=inventory_hostname) | string) }}"
    become: true

```

set_stats: では aggregate: false を指定しました。これを指定しない場合はデフォルトの true となり、呼び出した数だけ文字列が連結されてしまいます。

set_stats: 還有一個 aggregate 的參數，預設值是 yes，主要指定是否要和已經存在的值整合。


## Job B

- 從 Job A 接收密碼{字串}變數
- 將參數傳遞於目標節點並執行

```
--- 
hosts: all 
  gather_facts: false 

  vars: 
    ansible_user: 
    ansible ansible_password: "{{ service_account_password }}"

  任務：
    - name: run something 
      command: hostname 
      register: result 

    - name: debug 
      debug: 
        var: result
```

## Workflow 

定義 Question 已接受輸入 {參數} 


![](https://cdn-ak.f.st-hatena.com/images/fotolife/s/sugitk/20220603/20220603160514.png)

## 執行結果
當您執行 Workflow 作業時，系統會提示您輸入，因次請留意輸入的 {參數} 


![](https://cdn-ak.f.st-hatena.com/images/fotolife/s/sugitk/20220603/20220603160532.png)

## 執行成功

![](https://cdn-ak.f.st-hatena.com/images/fotolife/s/sugitk/20220603/20220603160543.png)

這時候查看每個 Job Template 的結果，可以看到第一個 Job Template 中用 `set_stats` 儲存{變數}的值 `service_account_password` 被保存為 `Artifacts`，在第二個 Job Template 中作為外部 {變數} 傳遞增加。

- 原始狀態資訊
![](https://cdn-ak.f.st-hatena.com/images/fotolife/s/sugitk/20220603/20220603160615.png)

- 運行 Workflow 後數入參數 `Artifacts` 變化
![](https://cdn-ak.f.st-hatena.com/images/fotolife/s/sugitk/20220603/20220603160602.png)

此情境可能會思考想隱藏輸入的{參數}修正密碼。
這裡展示 set_stats 

我想在這裡展示 set_stats 模組將它們保存為工作值將它們傳遞給外部變量。

## set_fact 

- TBD



### Job A

- 隨機生成密碼字符串
- 設置管理對象的密碼
- 使密碼字符串在下一個作業模板中可用

```
---
- hosts: all
  gather_facts: false

  vars:
    service_account: ansible

  tasks:
  - name: generate a password
    set_fact:
      service_account_password: "{{ lookup('password', '/dev/null', seed=inventory_hostname) }}"
      cacheable: true

  - name: change a password for a service account
    user:
      name: "{{ service_account }}"
      state: present
      password: "{{ service_account_password | password_hash('sha512', 65534 | random(seed=inventory_hostname) | string) }}"
    become: true
```

`cacheable: true` 請指定set_fact:然後。通過在作業模板中啟用該選項Enable Fact Storage，您將能夠從劇本中讀取和寫入事實數據。


## 總結

本篇介紹讓大家暸解如何在多個 Job 之間傳遞 Ansible {參數}。

當你想將它們全部作為一個外部變量傳遞時可以使用 `set_stats`，當你想為每個主機設置和使用不同的參數時可以使用 `set_fact`。

事實數據還存儲在劇本開頭編寫時 `gather_facts: true` 通過執行設置模塊收集的信息的結果，以及從動態清單中的雲服務的 API 獲取的信息。雖然使用方法和設置有些地方有點複雜，但我認為您可以通過在自動化控制器上使用它來方便地使用它


## Reference
- https://rheb.hatenablog.com/entry/aap_variables_between_jobs
- https://rheb.hatenablog.com/entry/ansible_adcanced_variables
- https://rheb.hatenablog.com/entry/ansible_variables