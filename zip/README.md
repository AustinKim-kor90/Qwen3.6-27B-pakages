# 분할 압축본 (백업용)

`parts/` + `join.sh` 방식과 **같은 내용**을 일반 zip 2개로 묶고, GitHub 파일 크기 제한(100MB) 때문에 95MB씩 잘라 둔 것입니다.

| 압축 파일 | 분할 파일 | 원본 크기 |
|---|---|---|
| `vllm-offline-part1.zip` | `vllm-offline-part1.zip.001` ~ `.020` | 약 1.9GB (wheel 절반 + 스크립트) |
| `vllm-offline-part2.zip` | `vllm-offline-part2.zip.001` ~ `.020` | 약 1.9GB (wheel 나머지 절반) |

**두 zip을 같은 폴더에 모두 풀면** `vllm-offline/` 폴더(wheel 200개 + 스크립트)가 완성됩니다.

## Windows (반디집 / 7-Zip)

1. `vllm-offline-part1.zip.001` 을 반디집 또는 7-Zip으로 열어 **여기에 풀기** (나머지 .002~ 는 자동으로 이어 읽음)
2. `vllm-offline-part2.zip.001` 도 **같은 위치에** 풀기
3. 생긴 `vllm-offline/` 폴더를 서버로 옮김

## Linux

```bash
cd zip
cat vllm-offline-part1.zip.0* > vllm-offline-part1.zip
cat vllm-offline-part2.zip.0* > vllm-offline-part2.zip
sha256sum -c SHA256SUMS.txt          # 둘 다 OK 확인
unzip -o vllm-offline-part1.zip
unzip -o vllm-offline-part2.zip      # → ./vllm-offline/
```

Windows에서 체크섬 확인: `certutil -hashfile vllm-offline-part1.zip SHA256` (합친 zip이 있을 때)

설치는 상위 폴더의 [INSTALL_GUIDE.md](../INSTALL_GUIDE.md) 3번부터 진행하세요.
