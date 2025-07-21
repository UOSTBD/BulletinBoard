from fastapi import APIRouter
from pathlib import Path
import importlib.util
import logging

router = APIRouter()

ENDPOINTS_DIR = Path(__file__).parent / "endpoints"


def include_all_routers(router: APIRouter, endpoints_dir: Path):
    """전역 라우터 등록

    생성된 모든 엔드포인트에서 `router`라는 이름으로 등록된 라우터를 수거합니다.
    수거된 라우터는 인자로 들어온 `router`에 포함됩니다.

    Args:
        router (APIRouter): 전역 라우터
        endpoints_dir (Path): 엔드포인트를 담은 디렉토리 주소
    """
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

            # 'router' 변수 존재 유무 확인 및 include
            if isinstance(endpoint_router := getattr(module, "router"), APIRouter):
                router.include_router(endpoint_router)
            elif endpoint_router is None:
                logging.warning(
                    f"'router'가 없는 endpoint가 발견되었습니다: {file_path.name}"
                )
            else:
                logging.warning(
                    f"'router'라는 이름의 변수에 APIRouter가 아닌 객체를 할당되었습니다: {file_path.name}"
                )
