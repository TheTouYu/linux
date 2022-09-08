# 使用git命令

1. ## 注册github/gitee(国内加速) > 创建一个仓库
   
   gitee
   
   ![](assets/"image_test"/2022-09-08-11-31-21-image.png)
   
   github
   
   ![](assets/"image_test"/2022-09-08-11-13-29-image.png)

2. ## 添加一个ssh钥匙(可选)   github需要使用ssh加密
   
   - ```bash
      ssh-keygen  #生成钥匙
     ```
   
   - ```bash
     cat ~/.ssh/id_rsa.pub #查看公匙
     ```
     
     ![](assets/"image_test"/2022-09-08-11-00-55-image.png)
   
   - 复制刚刚查看到的公匙 > 打开github/gitee设置 > 将ssh公匙粘贴进去
     
     标题随意
     
     ![](assets/"image_test"/2022-09-08-11-25-11-image.png)
     
     ![](assets/"image_test"/2022-09-08-11-24-25-image.png)
     
     ```bash
     ssh -T git@github.com #验证一下是否ok
     ```

3. ## 配置 > 上传至仓库
   
   ```bash
   mkdir my_workdirectory && cd my_workdirectory  #选择你的工作目录
   ```
   
   - 设置你的用户名和邮箱 (github)
     
     #### 这里需要注意，这个是全局设置，那么以后默认都是使用github
     
     ```bash
     git config --global user.name "your name"
     git config --global user.email "your_email@youremail.com"
     ```
     
     有时候github网络不好，我们可能想使用国内的gitee,我们可以为每个仓库单独设置
     
     ```bash
     git config --local user.name "your name"
     git config --local user.email "your_email@youremail.com"
     ```
- 选择ssh > 复制快速设置代码  
  
  格式很好记  
  
  - git@github.com:你的名字/你仓库名字.git
  
  - git@gitee:你的名字/你仓库名字.git
  
  gitee
  
  ![](assets/"image_test"/2022-09-08-11-36-10-image.png)
  
  github
  
  ![](assets/"image_test"/2022-09-08-11-14-47-image.png)
  
     ![](assets/"image_test"/2022-09-08-11-18-58-image.png)
  
  ```bash
  echo "# test" >> README.md  
  #这个是默认的展示文件，使用的就是markdown语法
  git init   
  git add README.md
  git commit -m "first commit"
  git branch -M main
  git remote add origin git@github.com:TheTouYu/test.git
  git push -u origin main
  ```
  
  ### 好啦，你的第一个仓库就完成了！
  
     ![](assets/"image_test"/2022-09-08-11-20-37-image.png)
4. ## 日常使用实例  (将本文git配置过程上传之服务器)
   
   - 现在仓库什么都没有，我们先保存markdown文件，以.md结尾 
     ![](assets/"image_test"/2022-09-08-12-25-06-image.png)
   
   - 我们添加新的文件 
     
     ```bash
     git add s使用git命令.md  
     ```
   
   - 为这一次知识库的版本变化做一个评注,并提交所以的修改
     
     ```bash
     git commit -m "我添加了一个新的文件，修改"
     ```
   
   - 让我们把数据同步到服务器
     
     ```bash
     git push origin master
     ```
   
   - 好了，现在可以访问你的主页了。格式**gitee.com/**你的用户名/你的仓库
     
     比如我的主页： <https://gitee.com/TheTouYu/test>
     
     

          
