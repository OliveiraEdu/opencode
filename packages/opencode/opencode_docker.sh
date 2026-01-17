docker run -it --rm \
  --entrypoint /bin/sh \
  -v "$(pwd)/d-OSPv2":/workspaces/d-OSPv2 \
  -v "$(pwd)/d-OSPv2/opencode.json":/root/.config/opencode/opencode.json \
  ghcr.io/anomalyco/opencode -c "
    apk add --no-cache git && \
    git clone -b develop https://github.com/OliveiraEdu/d-OSPv2.git /workspaces/d-OSPv2 && \
    cd /workspaces/d-OSPv2 && \
    git checkout develop && \
    opencode .
  "