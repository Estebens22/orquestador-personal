# 🧠 Orquestador Personal — tu propio asistente que vive en tu compu y te habla por Telegram

Un asistente de IA **tuyo**, que corre en tu propia máquina (Mac/Linux), te habla por **Telegram**, y hace tareas **con método y revisión** usando **tus propias herramientas**. No es un chatbot en la nube de alguien más: es tu agente, con tus llaves, bajo tu control.

Está construido sobre **[OpenClaw](https://openclaw.ai)** (open source, gratis). Este repo es un **arranque listo**: la personalidad, los skills y una guía para que lo tengas andando sin ser técnico.

> **Sin claves acá.** Este repo NO contiene ninguna API key ni token. Vos ponés las tuyas en tu máquina al instalar (quedan en `~/.openclaw`, nunca en el repo).

---

## ¿Qué vas a tener al final?

- Un **orquestador** corriendo en tu compu que te responde por **Telegram** (tu propio bot).
- Que **razona y ejecuta** tareas (no solo responde): busca, redacta, organiza, dispara flujos — y **te muestra todo para aprobar** antes de hacer algo hacia afuera.
- Con **tus herramientas** (LinkedIn, prospección, tu CRM, lo que conectes) como skills y connectors.
- **Gratis y privado**: corre local, con el modelo y las llaves que vos elijas.

## 🙌 ¿No sos técnico? (la forma más fácil)

No necesitás saber de terminal ni de "node". Dos opciones:

- **Que tu Claude te instale todo:** abrí **[PARA-CLAUDE-DESKTOP.md](PARA-CLAUDE-DESKTOP.md)**, copiá el mensaje y pegalo en tu Claude. Te lleva de la mano, paso a paso, y si algo falla le pasás una captura y lo resuelve.
- **Una sola línea:** abrí la app **Terminal** y pegá esto (instala todo solo):
  ```bash
  curl -fsSL https://raw.githubusercontent.com/Estebens22/orquestador-personal/main/bootstrap.sh | bash
  ```
  Al final te muestra 3 pasos cortos (login con tu Claude Max, tu token de Telegram, encender). Si te trabás, tu Claude te guía.

---

## Cómo empezar (manual, para quien quiera ver cada paso)

👉 Seguí **[SETUP.md](SETUP.md)** — guía paso a paso. En resumen:

1. Instalás **OpenClaw** (un comando).
2. **El cerebro:** usás tu **suscripción Claude Max** (sin API key, sin costo por uso — vía Claude Code) **o** una API key si preferís.
3. Conectás tu **bot de Telegram** (el token de BotFather).
4. Copiás el **`workspace/`** de este repo a tu OpenClaw (personalidad + skills).
5. Conectás **tus herramientas** y listo: le hablás por Telegram.

## Qué hay en este repo

| Carpeta | Qué es |
|---|---|
| `workspace/` | El "cerebro" de tu agente: `AGENTS.md` (reglas), `SOUL.md` (personalidad), `USER.md` (sobre vos), `skills/` (métodos). Se copia a `~/.openclaw/workspace/`. |
| `workspace/skills/` | Skills listos (contenido LinkedIn con revisión, prospección con revisión). Cada uno es un `SKILL.md`. |
| `config/` | Ejemplo de configuración (Telegram + modelo) con **placeholders**, sin claves. |
| `SETUP.md` | La guía de instalación paso a paso. |
| `.env.example` | Plantilla para llaves de herramientas (copiás a `.env`, que NO se versiona). |

## Agregar tus propias herramientas

Dos formas (ver SETUP.md):
- **Skills** (métodos): creás una carpeta en `workspace/skills/<nombre>/SKILL.md`. No necesita servidor.
- **Connectors / MCP** (herramientas que tocan sistemas externos): se conectan por configuración. Muchas apps ya traen MCP oficial.

## Licencia

**MIT** — libre para usar, copiar y adaptar. Construido sobre OpenClaw (su propia licencia).
