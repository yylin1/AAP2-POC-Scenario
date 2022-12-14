# 3. Operation Demos - 維運團隊管理者日常應用

## 場景說明

透過自動化方式設置定時排程，將資料中心大量 RHEL Linux 主機每日固定產出巡檢報表並且自動郵寄給系統管理人員

## 預期結果

每日排程檢查系統，產生系統檢查結果報表並郵寄，供系統管理人員檢視


## 工作流程

```
- A. 伺服器主機狀態巡檢
- B. 帳號盤點 / 新進員工帳號註冊
- C. 作業系統版本及安裝套件版本清查，並做差異通報
- D. Linux 主機授控端軟體版本及套件更新
```
---

## 環境確認

- 請確認當前 Lab 主要基於 AAP2 Linux Automation Workshop 環境
    - 參考：[註冊服務](../00_Lab_Settings/README.md)
- 請確認創建 POC Project 來源於 AAP2 環境
    - 參考：[設定方式](../00_Lab_Settings/README.md)

### A. 伺服器主機狀態巡檢

預期結果：

- 常規主機狀態檢查，若服務終止異常進行重啟並寄信通知維運負責人

巡檢包含項目內容：

- 主機連線(服務)狀態
- CPU負載 (當下最新狀態)
- 記憶體用量 (當下最新狀態)
- 可用磁區空間 (當下最新狀態)
- 報表需設定排程，於每週 1~5 早上 7 點透過 Email 寄出



---

### B. 帳號盤點 / 新進員工帳號註冊

預計結果: 

- 列出每台授測設備所有帳號清單及最高權限群組內的帳號清單，並產出報表。


### C. 作業系統版本及安裝套件版本清查，並做差異通報

預期結果: 

- Linux 授控端作業系統軟體版本及套件檢測，並通報維運負責人排程或立即更新。

包含清查項目內容：
- 檢查授控端作業系統版本號碼、軟體及套件版本號碼(至少2(含)個套件以上)
- Email 通知責任人版本差異
- 於 Email 中提供 Ansible Hyperlink，供維運負責人員可以直接點選登入後執行更新作業
- 清查套件必須至少包含一隻 CVE 更新(更新觸發條件)

### 3.C.1 建立 Project 名稱

---

### D. Linux 主機授控端軟體版本及套件更新

預期結果：

- 授控端操作軟體版本及套件更新

包含清查項目內容：
- 透過表單輸入需要資訊欄位(e.g. 套件名稱、版本號碼)後，執行系統軟體或套件更新。(更新方式加入備排程功能)
- 可同時更新多種套件及版本(含 CVE )。
- 更新完成後執行服務基本測試。
- 將更新結果 Email 通知負責人及相關人員