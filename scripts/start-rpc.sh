#!/bin/bash
# 31.8.2026 claudemm: expose BOTH M5 devices to the RPC peer, not just VRAM.
# Petrus: "Jos RPC server ei tue koko muistia muuttakaa se."
# ROCm0 65536 MiB + CPU 62907 MiB = ~125 GiB offered instead of 64 GiB.
B=/home/petrus/llama-glm5/build/bin/ggml-rpc-server
pkill -f ggml-rpc-server 2>/dev/null
sleep 3
exec "$B" -H 10.55.0.2 -p 50052 -d ROCm0,CPU
