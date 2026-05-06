FROM ghcr.io/astral-sh/uv:python3.14-bookworm-slim

WORKDIR /opt/xcel_itron2mqtt

# Install dependencies into a venv (no project install — we run as scripts)
COPY pyproject.toml uv.lock ./
RUN uv sync --frozen --no-dev --no-install-project

# Bring in our code to the container
COPY xcel_itron2mqtt/. ./
COPY scripts ./scripts

ENV PATH="/opt/xcel_itron2mqtt/.venv/bin:$PATH"

ENTRYPOINT [ "/opt/xcel_itron2mqtt/run.sh" ]
