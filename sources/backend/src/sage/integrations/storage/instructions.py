"""Reads the runtime instructions file from Cloud Storage on every request."""

import logging
from functools import lru_cache

from google.cloud import storage

from sage.config import get_app_config

log = logging.getLogger(__name__)


@lru_cache
def _get_storage_client() -> storage.Client:
    return storage.Client(project=get_app_config().project_id)


def read_instructions() -> str:
    config = get_app_config()
    try:
        blob = (
            _get_storage_client()
            .bucket(config.instructions_bucket)
            .blob(config.instructions_object)
        )
        text = blob.download_as_text(encoding="utf-8")
    except Exception:
        log.warning(
            "Impossibile leggere gs://%s/%s",
            config.instructions_bucket,
            config.instructions_object,
            exc_info=True,
        )
        return ""
    log.info("Istruzioni aggiuntive caricate: %d caratteri", len(text))
    return text
