# libraryManagementSystem
基于vue2+Mysql+nodejs+express+element-ui的前后端分离图书管理系统
使用步骤:  
本地运行方法  
&ensp;1.新建一个名为books_manage_system的数据库  
&ensp;2.将node目录下books_manage_system.sql文件导入到该数据库中，   
&ensp;3.在node/sql/booksystem.js文件内根据自己的数据库情况进行修改    
&ensp;4.运行后台    
&ensp;5.运行前台  
&ensp;6.打开提示的网址既可运行  
&ensp;7.如需通过ip地址访问，请在vue.config.js文件中修改配置  
打包运行，及线上运行方法：  
&ensp;1.将根目录下books_manage_system.sql文件导入到数据库中    
&ensp;2.在node/sql/booksystem.js文件内根据自己的数据库情况进行修改    
&ensp;3.在books文件夹和node文件夹下分别执行npm install安装插件  
&ensp;4.注释掉books/src/network/request.js文件中的第4行代码  
&ensp;5.在books文件夹下执行npm run build打包前端文件，打包完成后将该目录新增的dist文件夹复制到node文件夹中  
&ensp;6.打包完成后将dist文件夹复制到node文件夹下  
&ensp;7.将node文件夹下baseURL.js文件中的ip地址，修改为自己电脑的IP，否则线上运行时，会导致部分图片无法访问    
&ensp;8.在node文件夹下执行node index.js    
&ensp;9.之后在处于同一网络中的设备下，输入ip及端口号即可访问页面
