# 🙌 ¿No sos técnico? Que tu Claude te instale todo

No necesitás saber de "terminal" ni "node". Abrí **Claude** (app de escritorio o web), nuevo chat, y **pegá el mensaje de abajo tal cual**. Claude te va a llevar de la mano, paso a paso, esperando tu "listo" en cada uno.

---

```
Hola Claude 👋 Quiero instalar en mi Mac un "orquestador personal" (un asistente
que corre en mi compu y me habla por Telegram). NO soy técnica: no sé usar la
Terminal ni qué es "node", así que necesito que me guíes DE A UN PASO A LA VEZ,
con palabras MUY simples, esperando mi "listo" antes de seguir, y con mucha
paciencia. Si me da un error, te paso la captura y me lo resolvés.

Contexto para vos (Claude):
- El proyecto está acá: https://github.com/Estebens22/orquestador-personal
- Se instala con UNA sola línea que hace casi todo solo.
- El "cerebro" usa mi suscripción Claude Max (vía Claude Code), SIN API key.
- Yo ya tengo un bot de Telegram creado (tengo su token de @BotFather).

Guiame así, un paso a la vez:

1) Enseñame a abrir la app "Terminal" en mi Mac (dónde está, cómo se ve).

2) Dame ESTA línea para copiar y pegar en la Terminal, y explicame qué va a
   pasar (puede pedirme la contraseña de mi Mac, es normal):

   curl -fsSL https://raw.githubusercontent.com/Estebens22/orquestador-personal/main/bootstrap.sh | bash

   Esperá a que termine. Si sale algún error, te paso captura.

3) Cuando termine, me va a mostrar 3 pasos finales. Guiámelos uno por uno:
   a) escribir "claude" para iniciar sesión con mi cuenta Claude Max (se abre
      el navegador).
   b) escribir "openclaw onboard --install-daemon" y, cuando pregunte el modelo,
      ayudame a elegir "claude-cli"; cuando pida el token de Telegram, ayudame
      a pegarlo.
   c) encender el orquestador y aprobar mi primer mensaje.

4) Al final, probamos juntos: le mando un mensaje a mi bot de Telegram y me
   ayudás a confirmar que responde.

Arrancá por el paso 1, explicámelo bien simple, y esperá mi "listo".
```

---

> Si en algún paso algo no sale, **sacá una captura y pegásela a Claude en el mismo chat** — lo resuelve ahí mismo. Ese es el punto: Claude hace de técnico por vos.
