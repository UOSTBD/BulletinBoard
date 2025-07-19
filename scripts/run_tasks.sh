#!/bin/bash
set -ex
BASE_DIR="$(dirname "$0")/.."

# 기본 설정
HOST="0.0.0.0"
PORT_BACK="8000"
PORT_FRONT="3000"
LOG_LEVEL="INFO"

# 백엔드 개발 모드 실행 함수
run_backend_dev() {
    echo "백엔드 서버 실행 - 개발 모드 시작..."
    (cd "$BASE_DIR/backend" &&
        LOG_LEVEL=$LOG_LEVEL
        
        uv run fastapi dev main.py
        --host $HOST
        --port $PORT_BACK &)
    echo "백엔드 서버 (개발 모드)가 백그라운드에서 실행중입니다."
}

# 백엔드 서버 실행 함수
run_backend_prod() {
    echo "백엔드 서버 실행 시작..."
    (cd "$BASE_DIR/backend" &&
        host=$HOST
        port=$PORT_BACK
        LOG_LEVEL=$LOG_LEVEL

        uv run uvicorn main:app
        --host $HOST
        --port $PORT_BACK &)
    echo "백엔드 서버가 백그라운드에서 실행중입니다."
}

# 프론트엔드 개발 모드 실행 함수
run_frontend_dev() {
    echo "프론트엔드 서버 실행 - 개발 모드 시작..."
    (cd "$BASE_DIR/frontend" && 
        npm run dev
        --host $HOST
        --port $PORT_FRONT &)
    echo "프론트엔드 서버 (개발 모드)가 백그라운드에서 실행 중입니다."
}

# 프론트엔드 빌드 함수
build_frontend() {
    echo "프론트엔드 빌드 시작..."
    (cd "$BASE_DIR/frontend" &&
        npm run build
        --host $HOST
        --port $PORT_FRONT)
    echo "프론트엔드 빌드 완료."
}

# 명령줄 인자로 함수 호출
# 스크립트가 인자 없이 실행되면 메뉴를 표시합니다.
if [ -z "$1" ]; then
    echo "인자가 제공되지 않았습니다. 메뉴를 표시합니다."
    # 메뉴 표시 및 선택
    display_menu() {
        echo ""
        echo "====================================="
        echo "           태스크 선택 메뉴          "
        echo "====================================="
        echo "1. 백엔드 서버 실행 - 개발 모드"
        echo "2. 백엔드 서버 실행 (프로덕션 모드)"
        echo "3. 프론트엔드 서버 실행 - 개발 모드"
        echo "4. 프론트엔드 빌드"
        echo "0. 종료"
        echo "====================================="
        echo -n "원하는 태스크 번호를 입력하세요: "
    }

    # 메인 루프
    while true; do
        display_menu
        read -r choice

        case $choice in
            1) run_backend_dev ;;
            2) run_backend_prod ;;
            3) run_frontend_dev ;;
            4) build_frontend ;;
            0)
                echo "스크립트를 종료합니다."
                exit 0
                ;;
            *)
                echo "잘못된 입력입니다. 다시 시도해주세요."
                ;;
        esac
        echo ""
    done
else
    echo "인자가 제공되었습니다: '$1'. 함수를 호출합니다."
    # 인자에 따라 해당 함수를 명시적으로 호출
    case "$1" in
        run_backend_dev) run_backend_dev ;;
        run_backend_prod) run_backend_prod ;;
        run_frontend_dev) run_frontend_dev ;;
        build_frontend) build_frontend ;;
        *)
            echo "오류: 알 수 없는 함수 '$1'입니다."
            exit 1
            ;;
    esac
fi
