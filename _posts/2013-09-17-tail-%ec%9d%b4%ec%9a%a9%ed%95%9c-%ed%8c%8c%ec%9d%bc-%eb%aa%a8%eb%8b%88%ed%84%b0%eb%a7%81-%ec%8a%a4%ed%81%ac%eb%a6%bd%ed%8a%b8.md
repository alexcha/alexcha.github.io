---
title: tail을 이용한 파일 모니터링 스크립트
author: netggio
layout: post
permalink: /archives/2167
categories:
  - 일~일~일/Script 모음
tags:
  - bash
  - screen
  - script
  - tail
  - 모니터링
---
tail과 screen을 이용한 파일 모니터링 하는 간단한 스크립트임..

tail을 이용하여 /var/log/secure 파일의 로그가 변경될경우 svc@netggio.pe.kr로 메일을 발송 하게됨..  
screen을 이용하여 스크립트를 뛰우는 방식이므로.. 상시.. 모니터링이 가능함

screen을 사용하게 되므로.. rpm으로 설치 되어 있어야 할거고&#8230; 로컬 smtp를 이용하여 메일을 발송하므로 로컬에 샌드메일 떠 있어야함

./스크립트명 start/stop/restart 으로 스크립트를 컨트럴 하면 되는것임 ㅋㅋ

끝~

<pre class="brush:bash">#!/bin/sh

# 2013.09.17  by netggio
# http://netggio.pe.kr

DAEMON="alex"
IDENT="alex"
CACHEDIR="/var/spool/${DAEMON}/"
RUNFILE="/var/run/alex.run"

Email="svc@netggio.pe.kr"
Check_File="/var/log/secure"

SCREENPATH=`which screen`
if [ ! -x "$SCREENPATH" ]; then
        echo "install screen package "
        exit 1
fi

start() {
        [ -e ${RUNFILE} ] && stop
        touch $RUNFILE
        echo -n "starting $DAEMON"

        screen -d -m -S ${IDENT} `tail -f -n 0 $Check_File | { (while read; do echo "$REPLY" | mailx -s "testmail" "$Email"  ; done ) }`  &
        echo ""
}

stop() {
        echo "stopping $DAEMON"
        screen -list | grep \.${IDENT} | cut -d\. -f1 | xargs -r kill -9 screen -wipe &gt; /dev/null 2&gt;&1
        rm -f ${RUNFILE} 2&gt;/dev/null
}

case "$1" in
        start)  start
                ;;
        stop)   stop
                ;;
        status) screen -list | grep \.${IDENT} || echo "not running"
                ;;
        restart)stop
                start
                ;;
        *)      echo -n "usage:\n\t$0 (start|stop|status|restart)\n"
                exit 1
                ;;
esac
exit 0</pre>

&nbsp;