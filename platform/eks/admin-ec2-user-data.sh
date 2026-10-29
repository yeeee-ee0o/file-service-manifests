#!/bin/bash
set -euxo pipefail

KUBECTL_PATH=1.36.2/2026-07-05
ARCH=$(uname -m | sed 's/x86_64/amd64/; s/aarch64/arm64/')

curl -fsSLo /usr/local/bin/kubectl \
  "https://s3.us-west-2.amazonaws.com/amazon-eks/${KUBECTL_PATH}/bin/linux/${ARCH}/kubectl"
chmod +x /usr/local/bin/kubectl

dnf install -y git

cat > /etc/profile.d/kubectl.sh <<'EOF'
export AWS_DEFAULT_REGION=ap-northeast-2
alias k=kubectl
if [ -n "${BASH_VERSION:-}" ]; then
  source <(kubectl completion bash)
  complete -o default -F __start_kubectl k
fi
EOF
