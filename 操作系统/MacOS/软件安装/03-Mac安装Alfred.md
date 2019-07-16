# 安装 Alfred4

## 安装软件

1.  Alfred安装

    a. 安装破解文件

    b. 执行命令
        
    ```命令
    codesign --sign - --force --deep  /Applications/Alfred\ 4.app
    codesign --sign - --force --deep  /Applications/Alfred\ 4.app/Contents/Preferences/Alfred\ Preferences.app
    ```

2.  workflow推荐
    
    * Colors:
    * Dash:
    * Encode/Decode:
    * Mail.app Search:
    * SnippetsLab:

3.  配置
    1.  终端使用iTerm 
        
    > Preferences -> Features -> Terminal -> Application选择Custom
    
    [链接](https://github.com/stuartcryan/custom-iterm-applescripts-for-alfred)

    ```shell
    -- This is v0.7 of the custom script for AlfredApp for iTerm 3.1.1+
    -- created by Sinan Eldem www.sinaneldem.com.tr

    on alfred_script(q)
    	if application "iTerm2" is running or application "iTerm" is running then
    		run script "
    			on run {q}
    				tell application \"iTerm\"
    					activate
    					try
    						select first window
    						set onlywindow to true
    					on error
    						create window with default profile
    						select first window
    						set onlywindow to true
    					end try
    					tell the first window
    						if onlywindow is false then
    							create tab with default profile
    						end if
    						tell current session to write text q
    					end tell
    				end tell
    			end run
    		" with parameters {q}
    	else
    		run script "
    			on run {q}
    				tell application \"iTerm\"
    					activate
    					try
    						select first window
    					on error
    						create window with default profile
    						select first window
    					end try
    					tell the first window
    						tell current session to write text q
    					end tell
    				end tell
    			end run
    		" with parameters {q}
    	end if
    end alfred_script
    ```