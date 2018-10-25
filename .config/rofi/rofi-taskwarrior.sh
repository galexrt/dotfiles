#!/usr/bin/env bash

constBacktolist="==> Back to Task List <=="
until false; do
    TASKLIST="$(task list)"
    TASK=$(echo "$TASKLIST" | tail -n +4 | head -n -2 | rofi -dmenu -p "task" -mesg "$(echo "$TASKLIST" | column -t | head -n1)")
    [ -z "$TASK" ] && break
    TASK_ID="$(echo "$TASK" | awk '{print $1}' | sed 's/[^0-9]//g')"
    ACTION=$((task "$TASK_ID" rc.verbose:nothing | head -n -1; echo -e "\n$constBacktolist" ) | rofi -dmenu -p "task $TASK_ID")
    [ "$ACTION" = "$constBacktolist" ] && continue
    break
done
