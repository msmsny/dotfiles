# hostname
hostname=`hostname`
# 踏み台サーバ(未設定)
servers=()
pts=$HOME/git/scripts/getTmuxPts.sh

for server in "${servers[@]}"; do
  if [ "$hostname" = "$server" ]; then
    # kill ssh-agent if process exists
    # 端末でtmuxが起動していないときのみ
    if [ -f "$pts" -a -z "`$pts`" ]; then
      if [ `ps auxww | awk -v user="$USER" '$1 == user && $11 == "ssh-agent" {print 1}' | wc -l` -ne 0 ]; then
        # 自分で作ったagentのときは実行結果=0, そうでないときは実行結果=1
        eval "`ssh-agent -k > /dev/null 2>&1`"
      fi
    fi
  fi
done

# backup history
type backupHistory > /dev/null 2>&1 && backupHistory
