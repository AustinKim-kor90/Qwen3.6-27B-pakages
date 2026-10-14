#!/usr/bin/env bash
# 폐쇄망 서버에서 조각을 합쳐 vllm-offline/ 폴더를 복원한다.
set -e
cd "$(dirname "$0")"
echo "[1/2] 무결성 확인"
actual=$(cat parts/vllm-offline.tar.part* | sha256sum | cut -d' ' -f1)
[ "$actual" = "$(cat parts/SHA256)" ] || { echo "[중단] 체크섬 불일치 - 조각이 빠졌거나 손상됐습니다 (git pull 다시 확인)"; exit 1; }
echo "  OK"
echo "[2/2] 압축 해제 → ./vllm-offline/"
cat parts/vllm-offline.tar.part* | tar xf -
echo "완료. 다음: cd vllm-offline && bash install.sh"
