from fastapi import APIRouter
from pathlib import Path
import importlib.util
import logging

router = APIRouter()

ENDPOINTS_DIR = Path(__file__).parent / "endpoints"


def include_all_routers(router: APIRouter, endpoints_dir: Path):
    # endpoints 폴더 하위 .py 파일 순회
    for file_path in endpoints_dir.iterdir():
        if (
            file_path.is_file()
            and file_path.suffix == ".py"
            and file_path.name != "__init__.py"
        ):
            # 모듈 이름 생성
            module_name = f"endpoints.{file_path.stem}"

            # 모듈 정보 로드
            spec = importlib.util.spec_from_file_location(module_name, file_path)

            # 모듈 정보 로드 - 예외 처리
            if spec is None or spec.loader is None:
                logging.warning(
                    f"적절한 모듈 형식을 따르지 않는 파일이 발견되었습니다: {file_path.name}\n"
                    "이는 부적절한 이름 형식이나 확장자명 때문일 수 있습니다."
                )
                continue

            # 모듈 로드
            module = importlib.util.module_from_spec(spec)
            spec.loader.exec_module(module)

            # 'router' 객체 존재 유무 확인 및 include
            if hasattr(module, "router"):
                router.include_router(module.router)
            else:
                logging.warning(
                    f"'router'가 없는 endpoint가 발견되었습니다: {file_path.name}"
                )
