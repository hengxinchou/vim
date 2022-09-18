# 设置oh-my-shell的安装路径
export ZSH="/Users/zhouhengxin/.oh-my-zsh"
# 设置zsh的主题
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"
# 隐藏agnoster的主机名和用户名
DEFAULT_USER=$USER

#
# 不启动自动更新oh-my-zsh
DISABLE_AUTO_UPDATE="true"
# 启动git插件
plugins=(git)

source $ZSH/oh-my-zsh.sh

# 替换Mac自带的ctags，启动HomeBrew 安装的ctags
#if [[ -n "$(which ctags)" ]];then
#  alias ctags="`brew --prefix`/bin/ctags"
#fi

# 使用vim自带的manpager，阅读man文档
export MANPAGER="vim -M +MANPAGER -"

#fzf 可以利用 ripgrep 来自动过滤掉被 Git 忽略的文件、隐藏文件、二进制文件等程序员通常不关心的内容，并将结果以修改时间倒排，确保最新修改的文件在最下面，大大提高了迅速找到你需要的文件的概率
export FZF_DEFAULT_COMMAND='rg --files --sortr modified'
alias l.="ls -ad .*"
