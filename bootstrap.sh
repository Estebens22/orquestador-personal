#!/usr/bin/env bash
# Instalador "una sola línea" del Orquestador Personal (macOS).
# Instala: Homebrew → Node → Claude Code → OpenClaw → baja el workspace.
# Los 3 pasos que NECESITAN un humano (login de Claude, onboarding, token de Telegram)
# se hacen después, guiados por tu Claude. Este script NO toca nada que no sea instalar.
set -e

say(){ printf "\n\033[1;36m%s\033[0m\n" "$1"; }
ok(){ printf "\033[1;32m✓ %s\033[0m\n" "$1"; }

say "🧠 Instalando tu Orquestador Personal. Relajate, yo me encargo de lo pesado."

# 0) macOS
[ "$(uname)" = "Darwin" ] || { echo "Este instalador es para Mac. En Windows/Linux mirá SETUP.md."; exit 1; }

# 1) Homebrew (gestor de programas). Puede pedir tu contraseña del Mac.
if ! command -v brew >/dev/null 2>&1; then
  say "📦 Instalando Homebrew (puede pedir tu contraseña del Mac)…"
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
# asegurar brew en el PATH (Apple Silicon e Intel)
eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null)" || eval "$(/usr/local/bin/brew shellenv 2>/dev/null)" || true
ok "Homebrew"

# 2) Node
command -v node >/dev/null 2>&1 || { say "📦 Instalando Node…"; brew install node; }
ok "Node $(node --version 2>/dev/null)"

# 3) Claude Code (el cerebro usa tu suscripción Claude Max)
command -v claude >/dev/null 2>&1 || { say "📦 Instalando Claude Code…"; npm install -g @anthropic-ai/claude-code; }
ok "Claude Code"

# 4) OpenClaw (el orquestador)
command -v openclaw >/dev/null 2>&1 || { say "📦 Instalando OpenClaw…"; curl -fsSL https://openclaw.ai/install.sh | bash; }
eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null)" || true
ok "OpenClaw"

# 5) Bajar el "cerebro" (personalidad + skills) al workspace
WS="$HOME/.openclaw/workspace"
mkdir -p "$WS"
say "📥 Bajando personalidad + skills…"
TMP="$(mktemp -d)"
curl -fsSL https://github.com/Estebens22/orquestador-personal/archive/refs/heads/main.tar.gz | tar xz -C "$TMP"
cp -R "$TMP"/orquestador-personal-main/workspace/* "$WS"/ 2>/dev/null || true
rm -rf "$TMP"
ok "Workspace en $WS"

cat <<'EOF'

============================================================
✅ ¡LISTO LO PESADO! Faltan 3 cositas que necesitan tu toque.
   Pegáselas a tu Claude si te trabás — te guía paso a paso:

  1) Entrá con tu cuenta Claude Max:
       claude
     (se abre el navegador para que inicies sesión; cerrá cuando diga OK)

  2) Configurá el orquestador:
       openclaw onboard --install-daemon
     → cuando pregunte el modelo, elegí/escribí:  claude-cli
     → cuando pida el token de Telegram, pegá el de tu bot (@BotFather)

  3) Encendelo y aprobá tu primer mensaje:
       openclaw gateway
       openclaw pairing list telegram
       openclaw pairing approve telegram <CODE>

  Después le hablás a tu bot por Telegram. 🎉
============================================================
EOF
