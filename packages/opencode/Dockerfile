# Use Debian-based Bun for 100% TUI compatibility
FROM oven/bun:1.1 AS runtime

# Install dependencies (coreutils includes stty)
RUN apt-get update && apt-get install -y \
    git \
    curl \
    ripgrep \
    coreutils \
    ncurses-bin \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/.config/opencode

WORKDIR /workspaces/opencode

# Terminal settings for TUI
ENV TERM=xterm-256color
ENV COLORTERM=truecolor

# Create the executable wrapper
RUN printf '#!/bin/sh\nexec bun run /workspaces/opencode/packages/opencode/src/index.ts "$@"' > /usr/local/bin/opencode && \
    chmod 755 /usr/local/bin/opencode

COPY packages/opencode/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
CMD ["/bin/bash"]