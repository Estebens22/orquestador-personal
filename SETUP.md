# 🚀 SETUP — montá tu orquestador personal (paso a paso)

Pensado para **no-técnicos**. Vas a hacer todo una sola vez; después solo le hablás por Telegram. Si algo no sale, pedile ayuda a tu Claude/ChatGPT pegándole el paso que te traba.

> **Requisito:** una Mac (o Linux) encendida cuando quieras que el agente trabaje. Y **Node.js 22+** instalado (si no lo tenés, el instalador te guía: https://openclaw.ai).

---

## 1) Instalar OpenClaw (un comando)

Abrí la **Terminal** y pegá:

```bash
curl -fsSL https://openclaw.ai/install.sh | bash
```

## 2) El cerebro: tu suscripción Claude Max (SIN API key) — recomendado

Si ya pagás **Claude Max/Pro**, podés usar **esa misma suscripción** como el cerebro de tu agente — **sin API key y sin costo por uso**. Funciona porque OpenClaw puede manejar **Claude Code** por debajo (el backend `claude-cli`).

**Pasos:**

1. **Instalá Claude Code** y logueate con tu cuenta de Claude Max (una sola vez):
   ```bash
   # instalá Claude Code (ver https://claude.ai/code) y luego:
   claude            # te pide iniciar sesión con tu cuenta Max en el navegador
   ```
2. **Corré el onboarding de OpenClaw:**
   ```bash
   openclaw onboard --install-daemon
   ```
   Cuando pregunte por el modelo, en vez de pegar una API key, vas a usar el backend de Claude Code. Dejá tu modelo principal como `claude-cli/...`. Si el onboarding no te lo ofrece directo, agregá esto a tu config (`~/.openclaw/openclaw.config.json5`):
   ```json5
   {
     agents: {
       defaults: {
         model: { primary: "claude-cli/claude-sonnet-4-6" }, // o el modelo que te dé tu Claude Code (ej. opus)
         cliBackends: {
           "claude-cli": { bundleMcp: true }   // para que tu agente tenga herramientas
         },
       },
     },
   }
   ```
   > `bundleMcp: true` es lo que le da **herramientas** al agente (no solo texto).

Verificá que quedó andando:
```bash
openclaw gateway status     # debe decir que escucha en el puerto 18789
```

### Alternativa: API key (si NO tenés Claude Max)

Si preferís una API key clásica (Anthropic/OpenAI/Google), corré `openclaw onboard --install-daemon` y pegá tu key cuando la pida. **Queda en tu máquina**, nunca en este repo. Ojo: esto **sí cobra por uso**, a diferencia de la suscripción Max.

## 3) Conectar tu bot de Telegram

Ya tenés tu bot creado en **@BotFather** (si no: abrí Telegram → @BotFather → `/newbot` → guardá el **token**).

Decile a OpenClaw tu token (una vez):
```bash
openclaw configure        # buscá la sección de canales → Telegram → pegá el botToken
```
o, si preferís archivo, en tu config (`~/.openclaw/openclaw.config.json5`) agregás algo como el ejemplo de `config/openclaw.example.json5` de este repo (cambiando el token por el tuyo).

Arrancá y aprobá tu primer mensaje:
```bash
openclaw gateway
openclaw pairing list telegram
openclaw pairing approve telegram <CODE>
```
Mandale un mensaje a tu bot desde tu Telegram → te responde. 🎉

## 4) Cargar el "cerebro" (este workspace)

Copiá el contenido de la carpeta `workspace/` de este repo a tu workspace de OpenClaw:

```bash
cp -R workspace/* ~/.openclaw/workspace/
```

Eso le da a tu agente:
- **`AGENTS.md`** → cómo se comporta (reglas de oro, seguridad).
- **`SOUL.md`** → su personalidad (editala a tu gusto).
- **`USER.md`** → sobre vos (completalo: quién sos, qué hacés, qué te molesta).
- **`skills/`** → métodos listos (contenido LinkedIn con revisión, prospección con revisión).

> **Personalizá `USER.md` y `SOUL.md`** — ahí está la diferencia entre un bot genérico y *tu* asistente.

## 5) Agregar tus herramientas

- **Skills (métodos):** copiá/creá carpetas en `~/.openclaw/workspace/skills/<nombre>/SKILL.md`. Mirá los que ya vienen como ejemplo.
- **Connectors / MCP (herramientas reales):** muchas apps traen un MCP oficial; se conectan por configuración (`openclaw configure` → tools/MCP) o pegando una URL. Las llaves de esas herramientas van en tu `.env` local (copiá `.env.example`), **nunca en el repo**.

## 6) Usar tu agente

Le hablás por **Telegram** como me hablás a mí. Ejemplos:
- "Armame un post de LinkedIn sobre X" → usa el skill, te muestra el borrador, **vos aprobás**, y recién ahí lo deja listo.
- "Conseguime 20 prospectos de Y" → arma la lista con revisión antes de contactar.

---

## Reglas de oro (ya vienen en `AGENTS.md`)

- **Nada hacia afuera sin tu aprobación** (enviar, publicar, contactar).
- **Tus secretos viven en tu máquina**, nunca en este repo.
- **Vos mandás**: podés pausarlo, corregirlo o apagarlo cuando quieras.

¿Dudas? La doc oficial de OpenClaw: https://docs.openclaw.ai
