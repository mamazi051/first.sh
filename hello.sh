#!/usr/bin/env bash

services=("$@")

if ((${#services[@]} == 0)); then
  echo "Usage: bash hello.sh SERVICE [SERVICE...]" >&2
  exit 2
fi

if [[ "${1:-}" == "--help" ]]; then
	echo "Usage: bash hello.sh SERVICE [SERVICE...]"
	exit 0
fi
name=mamazi
echo "salam, $name"
check_service() {
  local service="$1"
  local status
  if systemctl is-active --quiet "$service"; then
    status=0
    echo "service $service is active"
  else
    status=$?
    echo "service $service is not active"
  fi
  echo "exit code: $status"
  return "$status"
}
failed=0
for service in "${services[@]}"; do
  if check_service "$service"; then
     :
  else
     failed=1
  fi
done
echo "failed=$failed"
exit "$failed"
