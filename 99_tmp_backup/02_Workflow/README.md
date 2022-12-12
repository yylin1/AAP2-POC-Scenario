# Ansible Automation Platform Workflows


作業模板是自動化控制器用來運行 Ansible 劇本的。工作流是在邏輯流中鏈接在一起的作業模板。本章將詳細探討如何創建作業模板使用的項目、這些作業模板本身、如何創建工作流以及使用它們的基礎知識。

在本章中，我們將涵蓋以下主要主題：
- Creating projects
- Creating job templates
- Surveys for job templates and workflows, and how to use them
- Creating workflows
- Using job slicing to slice a job template into multiple jobs


## 創建 Job Templates and Workflows 展示 - Creating projects

Project 是我們用來向 Automation controller 讀取 Playbook 的。這可以是控制器文件系統上加載的文件或Git倉庫。控制器將在項目中搜索任何有效的遊戲手冊文件，這樣它們就可以被工作模板引用了。項目文件應遵循標準的遊戲手冊佈局。

對於項目和遊戲手冊，需要記住的一件事是不要試圖創建一個包羅萬象的項目，在一個項目中包含每一個遊戲手冊或任務文件。應該預先考慮和規劃如何最好地劃分遊戲手冊。如果所有的東西都進入一個項目庫，它最終會變得太大，即使作為一個團隊也無法管理。這可能會導致臃腫、未使用的代碼，並在試圖刪除一段代碼時造成問題，從而導致其他東西的損壞。

這也是為什麼集合和角色很重要。集合可以在一個有凝聚力的單元中包含模塊和角色組。將代碼從項目中分離出來，可以實現項目間代碼的可移植性。剛開始的時候，使用一個項目是可以接受的，但是隨著項目的發展，要記住這些想法，這樣它的規模才不會失控。


Project options on the Automation controller and creating projects in the GUI
The different options will be broken up into unique groups. GUI fields will be represented with NameBolded fields. If the module and role fields are anything other than lowercase, they will be represented with (namefield).

Projects can be created in the GUI using the following steps:

1. Navigate to Projects on the left-hand sidebar.
2. Click Add and fill in the following fields:

![01](https://static.packt-cdn.com/products/9781803244884/graphics/image/B18633_10_002.jpg)

Figure 10.2 – A project creation form


Note

If the module or role option is not the same as the field, it will be noted in a code-style format.

We have filled in the following data:

```
- Name: A unique inventory name within the organization it belongs to.
- Description: The description of the project.
- Organization: The organization that the project belongs to. Job templates will inherit their project’s organization.
- Execution Environment: We will set it to default_enviroment, which sets the execution environment for jobs of this project to default.
- Source Control Credential Type: We will set this to scm_type, indicating what type of source control this project uses. These will be covered in more detail as follows.
    - Manual: The Automation controller will, by default, look in /var/lib/awx/projects for project folders. All controller nodes should have their projects copied there to use this option.
    - Git: This clones a Git branch to use as a project directory.
    - Subversion (svn): clones a subversion revision as a project directory.
    - Red Hat Insights (insights): is used by playbooks to connect to and use Red Hat Insights.
    - Remote Archive (archive): is used to access a remote archive such as a GitHub release or Artifactory archive. For example, see the following: https://github.com/sean-m-sullivan/test-playbooks/archive/refs/tags/v1.0.0.tar.gz.
```
3. Choose the additional settings outlined in instructions for each project type detailed next.
4. Click Save.


### 如何創建 Job Templates


## Reference
- https://aap2.demoredhat.com/exercises/ansible_rhel/2.6-workflows/
- https://www.youtube.com/watch?v=EKOWyc1F1AE&t=388s&ab_channel=AlexDworjan


