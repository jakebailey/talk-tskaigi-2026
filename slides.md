---
theme: default
drawings:
  persist: false
  enabled: false
# transition: slide-left
transition: fade
# transition: fade-out
# transition: view-transition
canvasWidth: 980
mdc: true
download: true
exportFilename: slides
lineNumbers: false
fonts:
  sans: 'Nunito Sans'
  mono: 'Hack'
  fallbacks: false
  provider: none
addons:
  - slidev-addon-qrcode
  - fancy-arrow
background: /img/bg.jpg
monaco: false
favicon: https://jakebailey.dev/favicon.ico
---

# TS 7: How We Got There

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

## Jake Bailey

#### TypeScript @ Microsoft

<img src="/img/me.jpg" alt="Professional headshot of Jake Bailey, a man with brown hair and beard wearing an olive green t-shirt, photographed outdoors by a body of water at sunset" id="profile-pic" />

<img src="/img/tskaigi-logo-white.svg" alt="TSKaigi 2026" id="conf-logo" />

<QRCode id="talk-qrcode" :width="120" :height="120" type="svg" :dotsOptions="{ color: 'var(--slidev-code-foreground)' }" :backgroundOptions="{ color: 'white' }"
data="https://jakebailey.dev/talk-tskaigi-2026" image="/img/typescript-design-assets/ts-logo-512.svg" :imageOptions="{ margin: 2 }" />

<style>
  h1 {
    font-size: 4rem !important;
    /* margin-bottom: 0 !important; */
  }
  #cover-subtitle {
    font-size: 2rem;
    font-style: italic;
    opacity: 0.5;
  }
  #profile-pic {
    position: absolute;
    top: 75%;
    left: 30%;
    width: 10%;
    border-radius: 50%;
    object-fit: cover;
    box-shadow: 0 4px 12px rgba(0,0,0,0.3);
  }
  #conf-logo {
    position: absolute;
    bottom: 5%;
    right: 5%;
    width: 15%;
    box-shadow: none;
    border-radius: 0;
  }
  #talk-qrcode {
    position: absolute;
    bottom: 18%;
    right: 6.5%;
  }
</style>

<!--
Welcome everyone! I'm Jake, I work on the TypeScript team at Microsoft.

I'm really excited to be here, and thanks to the TSKaigi organizers for inviting me.

TypeScript 7 is shipping very soon. I'd like to talk about our journey to get there,
from before the announcement, all the way through the last year of porting.
-->

---
layout: section
---

# What is TypeScript?

<!--
Let's start at the beginning, the reason we're all here.

What is TypeScript?
-->

---

# What is TypeScript?

## 

JavaScript<span v-click.at="+1">, with types!</span>

````md magic-move {lines: false}
```js
function add(a, b) {
    return a + b;
}

const obj = { width: 10, height: 15 };
const area = obj.width * obj.heigth;

let id;
console.log(document.getElementById(id));
```

```ts
function add(a: number, b: number): number {
    return a + b;
}

const obj = { width: 10, height: 15 };
const area = obj.width * obj.heigth;

let id: string | undefined;
console.log(document.getElementById(id));
```
````

<!--
As you all know, TypeScript is just JavaScript.

CLICK With Types!

TypeScript is a superset of JavaScript, with a rich type system and ecosystem.
-->

---

# What is TypeScript?

## 

JavaScript, with types! And errors!

```ts twoslash
function add(a: number, b: number): number {
    return a + b;
}

const obj = { width: 10, height: 15 };
const area = obj.width * obj.heigth;

let id: string | undefined;
console.log(document.getElementById(id));
```

<!--
TypeScript uses the types you declare to find bugs before running your JavaScript.

If any of you have ever written plain JavaScript before, you'll know how painful it can be.

TypeScript was made to enable working with JS codebases at scale.
-->

---

# We're the editor, too

<!-- dprint-ignore-start -->
<div class="monaco-editor-container">
  <div class="monaco-editor" data-theme="vs-dark">
    <div class="monaco-editor-background">
      <div class="view-lines">
        <div class="view-line" style="top:10px;height:19px;">
          <span class="mtk6">const</span><span class="mtk1">&nbsp;</span><span class="mtk12">myCats</span><span class="mtk1">&nbsp;</span><span class="mtk9">=</span><span class="mtk1">&nbsp;</span><span class="mtk6">new</span><span class="mtk1">&nbsp;</span><span class="mtk3">Set</span><span class="mtk1">(</span><span class="mtk1">[</span><span class="mtk17">"Nori"</span><span class="mtk1">,&nbsp;</span><span class="mtk17">"Miso"</span><span class="mtk1">,&nbsp;</span><span class="mtk17">"Momo"</span><span class="mtk1">]</span><span class="mtk1">)</span>
        </div>
        <div class="view-line" style="top:29px;height:19px;">
          <span class="mtk12">myCats</span><span class="mtk1">.</span><span class="mtk3">add</span><span class="mtk1">(</span><span class="mtk17">"???"</span><span class="mtk1">)</span>
        </div>
        <div class="view-line" style="top:48px;height:19px;"></div>
        <div class="view-line" style="top:67px;height:19px;"></div>
        <div class="view-line" style="top:86px;height:19px;">
          <span class="mtk12">document</span><span class="mtk1">.</span><span class="mtk4">getE</span><span class="cursor">|</span>
        </div>
        <div class="view-line" style="top:105px;height:19px;"></div>
        <div class="view-line" style="top:124px;height:19px;"></div>
        <div class="view-line" style="top:143px;height:19px;"></div>
        <div class="view-line" style="top:162px;height:19px;"></div>
        <div class="view-line" style="top:181px;height:19px;"></div>
        <div class="view-line" style="top:200px;height:19px;"></div>
        <div class="view-line" style="top:219px;height:19px;"></div>
        <div class="view-line" style="top:238px;height:19px;">
          <span class="mtk4">func</span><span class="mtk1">&nbsp;</span><span class="mtk3">whatsMyLanguageAgain</span><span class="mtk1">(</span><span class="mtk1">)</span><span class="mtk1">&nbsp;</span><span class="mtk1">{</span>
        </div>
        <div class="view-line" style="top:257px;height:19px;">
          <span class="mtk1">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="mtk6">return</span><span class="mtk1">&nbsp;</span><span class="mtk8">182</span>
        </div>
        <div class="view-line" style="top:276px;height:19px;">
          <span class="mtk1">}</span>
        </div>
      </div>
      <div class="view-overlays">
        <div class="cdr squiggly-error" style="position:absolute;top:115px;left:98px;width:31px;height:2px;"></div>
        <div class="cdr squiggly-error" style="position:absolute;top:267px;left:22px;width:31px;height:2px;"></div>
      </div>
    </div>
  </div>
  <!-- Hover tooltip for myCats -->
  <div v-click="1" class="monaco-hover" style="top: 40px; left: 120px;">
    <div class="monaco-hover-content">
      <div class="hover-text">(variable) myCats: Set&lt;string&gt;</div>
    </div>
  </div>
  <!-- Completion popup -->
  <div v-click="2" class="suggest-widget" style="top: 115px; left: 130px;">
    <div class="suggest-list">
      <div class="suggest-item suggest-item-selected">
        <span class="suggest-icon codicon codicon-symbol-method"></span>
        <span class="suggest-label">getElementById</span>
        <span class="suggest-type">HTMLElement | null</span>
      </div>
      <div class="suggest-item">
        <span class="suggest-icon codicon codicon-symbol-method"></span>
        <span class="suggest-label">getElementsByClassName</span>
        <span class="suggest-type">HTMLCollection</span>
      </div>
      <div class="suggest-item">
        <span class="suggest-icon codicon codicon-symbol-method"></span>
        <span class="suggest-label">getElementsByTagName</span>
        <span class="suggest-type">HTMLCollection</span>
      </div>
    </div>
  </div>
  <!-- Error tooltip for 'func' -->
  <div v-click="3" class="monaco-hover error-hover" style="top: 205px; left: 20px;">
    <div class="monaco-hover-content">
      <div class="error-text">
        <span class="error-code">TS1003:</span> 識別子が必要です。
      </div>
    </div>
  </div>
</div>

<style>
.monaco-editor-container {
  position: relative;
  width: 100%;
  min-height: 320px;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 4px 12px rgba(0,0,0,0.3);
}

.monaco-editor {
  position: relative;
  font-family: var(--slidev-code-font-family), 'Droid Sans Mono', 'monospace', monospace;
  font-size: 14px;
  line-height: 19px;
  width: 100%;
  height: 320px;
}

.monaco-editor-background {
  position: absolute;
  width: 100%;
  height: 100%;
  padding: 10px 20px;
}

.view-lines {
  position: relative;
  width: 100%;
  height: 100%;
}

.view-line {
  position: absolute;
  width: 100%;
  white-space: pre;
}

.view-overlays {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  pointer-events: none;
}

.cdr.squiggly-error {
  position: absolute;
  bottom: 0;
  height: 2px;
  background-image: url("data:image/svg+xml,%3csvg width='6' height='3' xmlns='http://www.w3.org/2000/svg'%3e%3cpath d='m0 3 l2 -2 l1 0 l2 2 l1 0' stroke='%23f14c4c' fill='none' stroke-width='1'/%3e%3c/svg%3e");
  background-repeat: repeat-x;
  background-position: bottom;
}

.cursor {
  animation: blink 1s infinite;
  font-weight: normal;
}

@keyframes blink {
  0%, 50% { opacity: 1; }
  51%, 100% { opacity: 0; }
}

/* Monaco Token Colors - Dark Theme */
.monaco-editor[data-theme="vs-dark"] {
  background-color: #1e1e1e;
  color: #d4d4d4;
}

.monaco-editor[data-theme="vs-dark"] .monaco-editor-background {
  background-color: #1e1e1e;
}

.monaco-editor[data-theme="vs-dark"] .mtk1 { color: #d4d4d4; } /* default/punctuation */
.monaco-editor[data-theme="vs-dark"] .mtk3 { color: #4ec9b0; } /* types/functions */
.monaco-editor[data-theme="vs-dark"] .mtk4 { color: #f14c4c; } /* errors */
.monaco-editor[data-theme="vs-dark"] .mtk6 { color: #569cd6; } /* keywords */
.monaco-editor[data-theme="vs-dark"] .mtk8 { color: #b5cea8; } /* numbers */
.monaco-editor[data-theme="vs-dark"] .mtk9 { color: #d4d4d4; } /* operators */
.monaco-editor[data-theme="vs-dark"] .mtk12 { color: #9cdcfe; } /* variables */
.monaco-editor[data-theme="vs-dark"] .mtk17 { color: #ce9178; } /* strings */

/* Monaco Token Colors - Light Theme */
.monaco-editor[data-theme="vs"] {
  background-color: #ffffff;
  color: #000000;
}

.monaco-editor[data-theme="vs"] .monaco-editor-background {
  background-color: #ffffff;
}

.monaco-editor[data-theme="vs"] .mtk1 { color: #000000; } /* default/punctuation */
.monaco-editor[data-theme="vs"] .mtk3 { color: #267f99; } /* types/functions */
.monaco-editor[data-theme="vs"] .mtk4 { color: #cd3131; } /* errors */
.monaco-editor[data-theme="vs"] .mtk6 { color: #0000ff; } /* keywords */
.monaco-editor[data-theme="vs"] .mtk8 { color: #098658; } /* numbers */
.monaco-editor[data-theme="vs"] .mtk9 { color: #000000; } /* operators */
.monaco-editor[data-theme="vs"] .mtk12 { color: #001080; } /* variables */
.monaco-editor[data-theme="vs"] .mtk17 { color: #a31515; } /* strings */

/* Theme switching based on Slidev's dark mode */
html:not(.dark) .monaco-editor {
  background-color: #ffffff;
  color: #000000;
}

html:not(.dark) .monaco-editor .monaco-editor-background {
  background-color: #ffffff;
}

html:not(.dark) .monaco-editor .mtk1 { color: #000000; }
html:not(.dark) .monaco-editor .mtk3 { color: #267f99; }
html:not(.dark) .monaco-editor .mtk4 { color: #cd3131; }
html:not(.dark) .monaco-editor .mtk6 { color: #0000ff; }
html:not(.dark) .monaco-editor .mtk8 { color: #098658; }
html:not(.dark) .monaco-editor .mtk9 { color: #000000; }
html:not(.dark) .monaco-editor .mtk12 { color: #001080; }
html:not(.dark) .monaco-editor .mtk17 { color: #a31515; }

html.dark .monaco-editor {
  background-color: #1e1e1e;
  color: #d4d4d4;
}

html.dark .monaco-editor .monaco-editor-background {
  background-color: #1e1e1e;
}

html.dark .monaco-editor .mtk1 { color: #d4d4d4; }
html.dark .monaco-editor .mtk3 { color: #4ec9b0; }
html.dark .monaco-editor .mtk4 { color: #f14c4c; }
html.dark .monaco-editor .mtk6 { color: #569cd6; }
html.dark .monaco-editor .mtk8 { color: #b5cea8; }
html.dark .monaco-editor .mtk9 { color: #d4d4d4; }
html.dark .monaco-editor .mtk12 { color: #9cdcfe; }
html.dark .monaco-editor .mtk17 { color: #ce9178; }

/* Monaco Hover */
.monaco-hover {
  position: absolute;
  z-index: 100;
  border-radius: 3px;
  animation: fadeIn 0.15s ease-out;
  line-height: 0.8rem;
}

.monaco-hover-content {
  padding: 6px 8px;
  font-size: 13px;
  max-width: 500px;
}

/* Dark theme hover */
html.dark .monaco-hover {
  background-color: #252526;
  border: 1px solid #454545;
  box-shadow: 0 2px 8px rgba(0,0,0,0.32);
}

html.dark .monaco-hover .hover-text {
  color: #cccccc;
}

html.dark .monaco-hover.error-hover {
  background-color: #3c1e1e;
  border-color: #be1100;
}

html.dark .monaco-hover.error-hover .error-text {
  color: #f14c4c;
}

/* Light theme hover */
html:not(.dark) .monaco-hover {
  background-color: #f8f8f8;
  border: 1px solid #c8c8c8;
  box-shadow: 0 2px 8px rgba(0,0,0,0.16);
}

html:not(.dark) .monaco-hover .hover-text {
  color: #1e1e1e;
}

html:not(.dark) .monaco-hover.error-hover {
  background-color: #f2dede;
  border-color: #cd3131;
}

html:not(.dark) .monaco-hover.error-hover .error-text {
  color: #cd3131;
}

.error-code {
  font-weight: 600;
}

/* Suggest Widget (Completion) */
.suggest-widget {
  position: absolute;
  z-index: 100;
  border-radius: 3px;
  animation: fadeIn 0.15s ease-out;
  min-width: 300px;
}

.suggest-list {
  max-height: 200px;
  overflow: hidden;
}

.suggest-item {
  display: flex;
  align-items: center;
  padding: 2px 0;
  cursor: pointer;
  height: 22px;
  padding: 0 8px;
}

.suggest-item-selected {
  background-color: var(--vscode-list-activeSelectionBackground, #0e639c);
}

.suggest-icon {
  width: 16px;
  height: 16px;
  margin-right: 8px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 11px;
  border-radius: 2px;
  color: white;
  background-color: #652d90;
}

.suggest-label {
  flex: 1;
  font-size: 13px;
  line-height: 22px;
  margin-right: 8px;
}

.suggest-type {
  font-size: 11px;
  opacity: 0.7;
}

/* Dark theme suggest widget */
html.dark .suggest-widget {
  background-color: #252526;
  border: 1px solid #454545;
  box-shadow: 0 2px 8px rgba(0,0,0,0.32);
}

html.dark .suggest-item {
  color: #cccccc;
}

html.dark .suggest-item:hover:not(.suggest-item-selected) {
  background-color: #2a2d2e;
}

html.dark .suggest-item-selected {
  background-color: #094771;
  color: white;
}

/* Light theme suggest widget */
html:not(.dark) .suggest-widget {
  background-color: #f8f8f8;
  border: 1px solid #c8c8c8;
  box-shadow: 0 2px 8px rgba(0,0,0,0.16);
}

html:not(.dark) .suggest-item {
  color: #1e1e1e;
}

html:not(.dark) .suggest-item:hover:not(.suggest-item-selected) {
  background-color: #f0f0f0;
}

html:not(.dark) .suggest-item-selected {
  background-color: #0078d4;
  color: white;
}

/* Animations */
@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(-4px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.slidev-vclick-target {
  transition: all 300ms ease;
}

.slidev-vclick-hidden {
  opacity: 0;
  transform: translateY(-8px);
}
</style>
<!-- dprint-ignore-end -->

<!--
TypeScript also powers JavaScript support in most if not all editors.

Hovers? That's us.

Completions? That's us too.

Syntax errors? Yep, that's us too. Even in untyped JavaScript files.

The TypeScript toolchain and
types makes all of the features work, be it in  TypeScript or JavaScript.
-->

---

<img src="/img/octoverse-2025-top-programming-languages.png" alt="Octoverse line chart of top 10 GitHub languages from 2023 to 2025, showing TypeScript rising from third to first by late 2025, Python moving between first and second, JavaScript dropping from first to third, and Java, C#, PHP, and Go staying mostly stable" class="main"  />

[jakebailey.dev/go/octoverse-2025](https://jakebailey.dev/go/octoverse-2025)

<style>
  img.main {
    height: 95%;
    margin-left: auto;
    margin-right: auto;
  }
  p {
    text-align: right;
  }
</style>

<!--
And things are going great; last year GitHub's annual Octoverse report named us
the most widely used language on GitHub. That's a pretty incredible achievement for a language that's only 10 years old.
-->

---

<img src="/img/octoverse-2025-js-ts-combined-usage.png" alt="Octoverse chart showing JavaScript and TypeScript with the highest combined user count, rising from about 2.4M in 2023 to about 4.7M in 2025, ahead of Python, Java, and C#" class="main"  />

[jakebailey.dev/go/octoverse-2025](https://jakebailey.dev/go/octoverse-2025)

<style>
  img.main {
    height: 95%;
    margin-left: auto;
    margin-right: auto;
  }
  p {
    text-align: right;
  }
</style>

<!--
And if you combine JavaScript and TypeScript usage, we're even bigger,
nearly doubling Python, and way above anyone else.

I think it's certainly the case that TypeScript has grown far beyond our wildest expectations.
-->

---
layout: section
---

# But...

<!--
But, success doesn't mean perfection. There are still problems to solve!
If there weren't, I'd probably be out of a job
-->

---
layout: image-right
image: /img/snail.jpg
---

# Performance woes

<v-clicks>

- Teams with massive codebases
  - Millions of lines, tens of millions...
  - Even 2000+ `tsconfig.json` files 😱
- Libraries getting more complex
- New language features make us slower too
- `isolatedDeclarations` _kinda_ helps
- Editor speed suffers even more
  - Responsiveness is critical!

</v-clicks>

<!--
The main concern on everyone's mind was performance. CLICK

We have internal teams with millions of lines of TypeScript.
Some have tens of millions, with over 2000 tsconfig files. CLICK

As libraries get more complex, with deeper generics and more conditional types,
the checker slows down. CLICK And every new language feature we add tends to make
things a little slower too. CLICK

We added isolatedDeclarations to help with multi-project builds, but it
doesn't help single projects, and tsc itself never used it to speed up large builds and so far it can only be leveraged by external tools that orchestrate us, meaning most users are still stuck with slowness. CLICK

And editor speed suffers even more, because responsiveness is critical too.
When you type something and the editor lags, that's our problem.
-->

---

# TypeScript is (was 😉) written in TypeScript

## 

<br>

<LightOrDark>
  <template #dark="props">
    <img src="/img/ts-repo-dark.png" v-bind="props" class="main" alt="GitHub repository page for microsoft/TypeScript showing file structure with folders like .devcontainer, .github, .vscode, bin, scripts, src, tests and various configuration files, along with recent commit information and contributor statistics" />
  </template>
  <template #light="props">
    <img src="/img/ts-repo-light.png" v-bind="props" class="main" alt="GitHub repository page for microsoft/TypeScript showing file structure with folders like .devcontainer, .github, .vscode, bin, scripts, src, tests and various configuration files, along with recent commit information and contributor statistics" />
  </template>
</LightOrDark>

<LightOrDark>
  <template #dark="props">
    <img src="/img/ts-repo-dark.png" v-bind="props" class="zoom" alt="Close-up view of the TypeScript repository's language statistics bar showing 99.9% TypeScript with a small portion of other languages" />
  </template>
  <template #light="props">
    <img src="/img/ts-repo-light.png" v-bind="props" class="zoom" alt="Close-up view of the TypeScript repository's language statistics bar showing 99.9% TypeScript with a small portion of other languages" />
  </template>
</LightOrDark>

<style>
img.main {
  height: 80%;
  margin-left: auto;
  margin-right: auto;
  margin-bottom: 4%;
}
img.zoom {
  position: absolute;
  left: 50%;
  top: 60%;
  height: 70px;
  width: 400px;
  object-fit: none;
  object-position: 80.6% 84.8%;
  /* border: 2px solid #888; */
}
</style>

<!--
Now, like most languages, TypeScript is, or was, written in TypeScript.
That itself is not unusual -- most languages are written in themselves --,
but since TypeScript is just JavaScript,
what's unusual is having a _compiler_ written in JavaScript.

There's a tremendous benefit to being self-hosted.

We get would immediate feedback from our own code.

If something was buggy in the language or the editor support, we'd go fix it.

The TypeScript community knows TypeScript, and could send us fixes.
-->

---
layout: image-right
image: /img/checker-wall.jpg
---

# Challenges

<v-clicks depth="2">

- JavaScript wasn't designed for _writing compilers_ 🙃
  - Inherent language overheads
  - Can't share objects between threads
  - `async`/`await` means function coloring
  - 4GB memory limit in Electron (→ VS Code)
- We squeezed as much out of it as we could
  - Loads of profiling, caching, "monomorphization"

</v-clicks>

<!--
CLICK but at the end of the day, JavaScript wasn't designed for writing compilers.
As efficient as modern JS runtimes are, and they are efficient CLICK, there are still inherent overheads.
You can't share objects between threads; if you want multithreading,
you have to serialize everything, which defeats the purpose. CLICK
async/await means function coloring, and Promises aren't free. CLICK
And many builds of Node have a 4GB memory limit, including the one bundled
with VS Code.

Don't get me wrong, we squeezed as much out of JS as we could. CLICK Loads of profiling, caching,
monomorphization tricks. Still, performance woes, OOMs.
People have massive codebases that are only getting larger.
-->

---

# Deeper problems in the editor

<!-- dprint-ignore-start -->
<div class="thread-diagram">
  <div v-click="1" class="diagram-section">
    <div class="section-label">Incoming</div>
    <div class="request-stack">
      <div class="request-item ri-blue">outline</div>
      <div class="request-item ri-green">completions</div>
      <div class="request-item ri-purple">diagnostics</div>
      <div class="request-item ri-amber">go-to-def</div>
      <div class="request-item ri-red">folding</div>
      <div class="request-item ri-cyan">formatting</div>
    </div>
  </div>
  <div v-click="2" class="flow-connector">
    <div class="vscode-badge" :class="{ 'view-visible': $clicks >= 4 }">
      <img src="/img/vscode-alt.svg" alt="VS Code" class="vscode-logo" />
    </div>
    <div class="connector-line"></div>
  </div>
  <div v-click="2" class="diagram-section server-swap">
    <!-- Single server (clicks 2–3) -->
    <div class="server-view" :class="{ 'view-hidden': $clicks >= 4 }">
      <div class="section-label">tsserver</div>
      <div class="server-box">
        <div class="queue-zone">
          <div class="zone-label">queued</div>
          <div class="q-item ri-cyan">formatting</div>
          <div class="q-item ri-red">folding</div>
          <div class="q-item ri-purple">diagnostics</div>
          <div class="q-item ri-green">completions</div>
          <div class="q-item ri-blue">outline</div>
        </div>
        <div class="server-divider"></div>
        <div class="process-zone">
          <div class="zone-label">processing</div>
          <div class="p-item ri-amber">go-to-def ⏳</div>
        </div>
      </div>
    </div>
    <!-- Dual servers (click 4+) -->
    <div class="server-view dual-view" :class="{ 'view-hidden': $clicks < 4 }">
      <div class="dual-servers">
        <div>
          <div class="section-label">syntax tsserver</div>
          <div class="server-box server-box-sm">
            <div class="p-item ri-blue">outline</div>
            <div class="p-item ri-red">folding</div>
            <div class="p-item ri-cyan">formatting</div>
          </div>
        </div>
        <div>
          <div class="section-label">semantic tsserver</div>
          <div class="server-box server-box-sm">
            <div class="p-item ri-green">completions</div>
            <div class="p-item ri-purple">diagnostics</div>
            <div class="p-item ri-amber">go-to-def</div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div v-click="3" class="diagram-section">
    <div class="section-label">CPU Cores</div>
    <div class="cpu-grid">
      <div class="cpu-core core-on">1</div>
      <div class="cpu-core" :class="$clicks >= 4 ? 'core-on' : 'core-off'">2</div>
      <div class="cpu-core core-off">3</div>
      <div class="cpu-core core-off">4</div>
      <div class="cpu-core core-off">5</div>
      <div class="cpu-core core-off">6</div>
      <div class="cpu-core core-off">7</div>
      <div class="cpu-core core-off">8</div>
    </div>
  </div>
</div>
<!-- Hack: ensure Slidev tracks click 4 -->
<span v-click="4"></span>
<!-- dprint-ignore-end -->

<style>
.thread-diagram {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 36px;
  margin-top: 16px;
  width: 100%;
}

.diagram-section {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.section-label {
  font-weight: 700;
  margin-bottom: 12px;
  text-transform: uppercase;
  letter-spacing: 1.5px;
  opacity: 0.7;
  font-size: 14px;
}

.request-stack {
  display: flex;
  flex-direction: column;
  gap: 7px;
}

.request-item, .q-item, .p-item {
  padding: 7px 18px;
  border-radius: 6px;
  font-size: 15px;
  font-weight: 600;
  font-family: var(--slidev-code-font-family);
  color: white;
  text-align: center;
  white-space: nowrap;
}

.ri-blue   { background: #3b82f6; }
.ri-green  { background: #10b981; }
.ri-purple { background: #8b5cf6; }
.ri-amber  { background: #f59e0b; color: #1c1917; }
.ri-red    { background: #ef4444; }
.ri-cyan   { background: #06b6d4; }

.q-item { opacity: 0.6; }

.flow-connector {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 56px;
  flex-shrink: 0;
  position: relative;
}

.vscode-badge {
  background: #0065A9;
  border-radius: 8px;
  padding: 6px;
  margin-bottom: 6px;
  opacity: 0;
  transition: opacity 0.5s ease;
  display: flex;
  align-items: center;
  justify-content: center;
  box-shadow: 0 2px 8px rgba(0, 101, 169, 0.4);
}

.vscode-badge.view-visible {
  opacity: 1;
}

.vscode-logo {
  width: 24px;
  height: 24px;
  box-shadow: none;
  border-radius: 0;
}

.connector-line {
  height: 3px;
  width: 100%;
  background: #64748b;
  position: relative;
}

.connector-line::after {
  content: '';
  position: absolute;
  right: -1px;
  top: 50%;
  transform: translateY(-50%);
  border-left: 10px solid #64748b;
  border-top: 6px solid transparent;
  border-bottom: 6px solid transparent;
}

.server-box {
  border: 2px solid #475569;
  border-radius: 10px;
  padding: 16px;
  min-width: 200px;
  background: #1e293b;
}

html:not(.dark) .server-box {
  background: #f1f5f9;
  border-color: #94a3b8;
}

.zone-label {
  font-size: 11px;
  text-transform: uppercase;
  letter-spacing: 1px;
  opacity: 0.5;
  margin-bottom: 6px;
}

.queue-zone, .process-zone {
  display: flex;
  flex-direction: column;
  gap: 5px;
}

.server-divider {
  height: 1px;
  background: #475569;
  margin: 10px 0;
}

.thread-warning {
  margin-top: 12px;
  color: #fbbf24;
  font-weight: 700;
  font-size: 16px;
  text-align: center;
}

.server-swap {
  display: grid;
}

.server-view {
  grid-area: 1 / 1;
  display: flex;
  flex-direction: column;
  align-items: center;
  transition: opacity 0.5s ease;
}

.view-hidden {
  opacity: 0;
  pointer-events: none;
}

.dual-servers {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.server-box-sm {
  padding: 12px 16px;
  min-width: 180px;
  display: flex;
  flex-direction: column;
  gap: 5px;
}

.server-box-sm .p-item {
  font-size: 14px;
  padding: 5px 14px;
}

.dual-view .section-label {
  margin-bottom: 6px;
  font-size: 12px;
}

.cpu-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 10px;
}

.cpu-core {
  width: 56px;
  height: 56px;
  border-radius: 8px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: 700;
  font-size: 18px;
  font-family: var(--slidev-code-font-family);
}

.core-on {
  background: #22c55e;
  color: white;
  box-shadow: 0 0 12px rgba(34, 197, 94, 0.4);
}

.core-off {
  background: #374151;
  color: #6b7280;
  border: 1px solid #4b5563;
}

html:not(.dark) .core-off {
  background: #e5e7eb;
  color: #9ca3af;
  border-color: #d1d5db;
}
</style>

<!--
But the challenges don't stop there.

Every keystroke in your editor CLICK can trigger hovers, completions, diagnostics,
go-to-definition, and more. CLICK
All of these requests funnel  into a single tsserver process, which handles
them one at a time CLICK, and since TypeScript internally is not async capable, if a request is slow, everything behind it waits.

In order to keep the server responsive, we had to do cancellation out-of-band, and then on cancel, throw away everything in the queue and start over.

VS Code CLICK worked around this by running two separate tsserver processes: one
for fast syntactic operations like hovers and completions, one for slower
semantic work like diagnostics and go-to-definition. That gets us one more
core, but each process is still single-threaded.
-->

---
layout: section
---

# Can we rewrite TypeScript in another language?

<!--
So, with all of these impossible challenges in mind,
In 2024, we started seriously considering rewriting TypeScript, something that everyone had been asking us to do forever.
-->

---
layout: two-cols-header
---

# Evaluating our options

::left::

<v-clicks>

- A **port**, not a rewrite
  - Same code structure, same behaviors
- Concurrency, for faster compiles and editor responsiveness
- More control over memory
- Wasm support
- What about the public API? LS plugins?

</v-clicks>

::right::

<!-- dprint-ignore-start -->
<div class="lang-grid">
  <div class="lang-card">
    <img src="/img/rust-logo-512x512.png" alt="Rust" class="lang-logo" style="filter: brightness(1.75);" /><span class="lang-q">?</span>
  </div>
  <div class="lang-card">
    <img src="/img/Logo_C_sharp.svg" alt="C#" class="lang-logo" /><span class="lang-q">?</span>
  </div>
  <div class="lang-card">
    <img src="/img/Go-Logo_Blue.svg" alt="Go" class="lang-logo" /><span class="lang-q">?</span>
  </div>
  <div class="lang-card">
    <img src="/img/zig-mark.svg" alt="Zig" class="lang-logo" /><span class="lang-q">?</span>
  </div>
  <div class="lang-card">
    <img src="/img/OCaml_Sticker.svg" alt="OCaml" class="lang-logo" /><span class="lang-q">?</span>
  </div>
  <div class="lang-card lang-more">
    <span>... ?</span>
  </div>
</div>
<!-- dprint-ignore-end -->

<!-- dprint-ignore-start -->
<p class="logo-credits">
<a href="https://github.com/rust-lang/rust-artwork/blob/master/logo/rust-logo-512x512.png">Rust logo</a> by ™/®Rust Foundation / <a href="https://creativecommons.org/licenses/by/4.0/">CC BY 4.0</a>,
<a href="https://github.com/ziglang/logo/blob/master/zig-mark.svg">Zig logo</a> by KeyboardRage / <a href="https://creativecommons.org/licenses/by-sa/4.0/">CC BY-SA 4.0</a>
</p>
<!-- dprint-ignore-end -->

<style>
.logo-credits {
  position: absolute;
  bottom: 8px;
  right: 25px;
  opacity: 0.2;
  font-size: 0.45rem;
  text-align: right;
  max-width: 60%;
}
.lang-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-template-rows: repeat(3, 1fr);
  gap: 20px;
  padding: 10px;
  justify-items: center;
  align-items: center;
  height: 100%;
}
.lang-card {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
}
.lang-q {
  font-size: 2rem;
  font-weight: 700;
  opacity: 0.5;
}
.lang-more {
  font-size: 2.5rem;
  font-weight: 700;
  opacity: 0.5;
}
.lang-logo {
  width: 120px;
  height: 120px;
  object-fit: contain;
  box-shadow: none;
  border-radius: 0;
}
</style>

<!--
Obviously, there are many options. There are reasons to choose any language.

Rust is popular; there's a whole trend of rewriting JS tools in Rust.
Go has precedent via esbuild, a project I'd call the pioneer of JS tools written in a compiled language.
Zig, OCaml, C# are all viable too.

But we had specific requirements. CLICK We needed a port, not a rewrite. 
Same code structure, same behaviors. TypeScript doesn't have a spec;
the spec is whatever our compiler currently does.
So the target language has to be structurally similar enough
that we can move the code over and preserve all those behaviors. CLICK

We also wanted concurrency so we can make use of multiple cores, since most everyone has them. CLICK, we wanted more control over memory CLICK, and ideally Wasm support CLICK.
And we had to think about what happens to the public API and editor plugins.
-->

---
layout: none
---

<img src="/img/Go-Logo_Blue.svg" alt="Go programming language logo" />

<style>
img {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  height: 75%;
  width: auto;
  object-fit: contain;
  box-shadow: none;
  border-radius: 0px;
}
</style>

<!--
Now, as you all know, we made the choice to port TypeScript to go.
Go is a really interesting language.
-->

---

# Go at a glance

##

<div v-if="$clicks < 1">

```go
// Structs and methods, no classes
type User struct {
    Name  string
    Email string
}

func (u *User) DisplayName() string {
    return fmt.Sprintf("%s <%s>", u.Name, u.Email)
}
```

</div>
<div v-if="$clicks === 1">

```go
// Interfaces are structural, like TypeScript
type UserRepository interface {
    FindByID(id string) (*User, error)
    Save(user *User) error
}

// Any struct with FindByID() and Save() satisfies this
// No "implements" keyword needed
```

</div>
<div v-if="$clicks >= 2">

```go
// Goroutines: lightweight concurrency, no async/await
func fetchAll(urls []string) []Response {
    results := make(chan Response, len(urls))
    for _, url := range urls {
        go func() {
            results <- fetch(url)
        }()
    }
    // collect results
    var out []Response
    for range urls {
        out = append(out, <-results)
    }
    return out
}
```

</div>

<!-- dprint-ignore-start -->
<span v-click="1"></span><span v-click="2"></span>
<!-- dprint-ignore-end -->

<!--
Quick look at Go for those who haven't seen it. It's pretty simple

Structs and methods. No classes, no inheritance. Just data and functions.

Click: Interfaces are structural, just like TypeScript. If you have the
right methods, you satisfy the interface. No "implements" keyword needed, like TypeScript, although TypeScript does have that keyword.

Click: And goroutines give you lightweight concurrency without async/await. The code looks synchronous, but you can spawn thousands if not millions of goroutines and be fine.
-->

---

# Why Go?

## 

<v-clicks>

- Similar structure to TypeScript, tending towards data / functions / interfaces
- Fast compile times
- Garbage collection, ergonomic cyclic data structures
- Concurrency without `async`/`await`
- Easy to learn
- The code is truly 1:1

</v-clicks>

<img src="/img/Go-Logo_Blue.svg" alt="Go logo" class="go-watermark" />

<style>
.go-watermark {
  position: absolute;
  bottom: 30px;
  right: 120px;
  width: 360px;
  box-shadow: none;
  border-radius: 0;
}
</style>

<!--
CLICK Structurally, it's very similar to TypeScript. Our old codebase was
effectively class-free: data, functions, interfaces. Go is exactly that.

CLICK It also compiles relatively quickly compared to other compiled languages.
CLICK Garbage collection means we
don't have to worry about our cyclic data structures; we have parent
pointers in our ASTs, it'd be a mess to have to track that.

CLICK We can have concurrency for free with similar looking code, no function coloring.

CLICK It's also easy to learn. We had about 10 engineers learning Go for the first
time; I was the only one who'd written a meaningful amount of Go before.
Everyone was productive within days.

CLICK And as you'll see, the code is truly 1:1.
-->

---

<!-- dprint-ignore-start -->
````md magic-move {lines: false}
```ts {*|2-4|6-9|10-14|*}
export function createTypeChecker(): TypeChecker {
    const unionTypes = new Map<string, UnionType>();
    const intersectionTypes = new Map<string, Type>();
    const anyType = createIntrinsicType(TypeFlags.Any, "any")
    // ...

    function getTypeAtLocation(location: Node): Type {/* ... */}
    function getApparentType(t: Type): Type {/* ... */}
    function getUnionSignatures(signatureLists: readonly (readonly Signature[])[]): Signature[] {/* ... */}

    return {
        getTypeAtLocation,
        getApparentType,
    };
}
```

```go {*}
type Checker struct {
    unionTypes         map[string, *UnionType]
    intersectionTypes  map[string, *Type]
    anyType            *Type
    // ...
}

func createTypeChecker() *Checker {
    c := &Checker{}
    c.unionTypes = make(map[string]*UnionType)
    c.intersectionTypes = make(map[string]*Type)
    c.anyType = c.createIntrinsicType(TypeFlagsAny, "any")
    // ...
    return c
}

func (c *Checker) getTypeAtLocation(location *Node) *Type {/* ... */}
func (c *Checker) getApparentType(t *Type) *Type {/* ... */}
func (c *Checker) getUnionSignatures(signatureLists [][]*Signature) []*Signature {/* ... */}
```
````
<!-- dprint-ignore-end -->

<!--
So to get a rough idea of what porting looked like, let's look at an example.

Our old code was effectively class-free. CLICK

Functions close over state, CLICK inner functions do the work, CLICK we return to export an API. Strangely enough CLICK, this is the fastest way to do it in JavaScript. Of course, your own code might not be perf critical as much, so don't go refactoring your code to look like this just because we did.

CLICK In Go, we can more simply write plain structs and methods.
We don't need the inheritance or polymorphism, just data and functions.

And as you can see, the code looks very similar to the original code.
-->

---

<LightOrDark>
  <template #dark="props">
    <img src="/img/ts-to-go-dark.png" v-bind="props" class="main" alt="GitHub repository page for jakebailey/ts-to-go showing file structure with folders like .vscode, output, and files like .dprint.jsonc, LICENSE, README.md, with 'Very hacky transformer from TS to Go' description and language breakdown showing 89.8% Go, 9.6% TypeScript, 0.6% JavaScript" />
  </template>
  <template #light="props">
    <img src="/img/ts-to-go-light.png" v-bind="props" class="main" alt="GitHub repository page for jakebailey/ts-to-go showing file structure with folders like .vscode, output, and files like .dprint.jsonc, LICENSE, README.md, with 'Very hacky transformer from TS to Go' description and language breakdown showing 89.8% Go, 9.6% TypeScript, 0.6% JavaScript" />
  </template>
</LightOrDark>

<div id="ts-to-go-link">
<a href="https://github.com/jakebailey/ts-to-go">github.com/jakebailey/ts-to-go</a>
</div>

<style>
	img.main {
  height: 90%;
  margin-left: auto;
  margin-right: auto;
  margin-bottom: 4%;
}
	a {
		position: absolute;
		bottom: 150px;
		right: 50px;
	}
	#ts-to-go-link {
		position: absolute;
		bottom: 50px;
		right: 50px;
		background-color: #007aff;
		border: 2px solid #007aff;
		border-radius: 8px;
		padding: 8px 12px;
	}
	#ts-to-go-link a {
		position: static;
		color: white;
		text-decoration: none;
	}
</style>

<!--
And so early on while the scanner/parser were being ported, I wrote a tool
that loosely transforms TypeScript code into Go code.

It's called ts-to-go, and it uses TypeScript's API to parse out our own compiler,
then converts TS syntax in to Go, using type information to write
down types where needed.

Remember, this is a year and half ago, AI was way worse then,
but even still, this automation is a good way to approach the problem.
Code transformers are super useful!
-->

---

<!-- dprint-ignore-start -->
````md magic-move {lines: false}
```ts
function bindForStatement(node: ForStatement): void {
    const preLoopLabel = setContinueTarget(node, createLoopLabel());
    const preBodyLabel = createBranchLabel();
    const postLoopLabel = createBranchLabel();
    bind(node.initializer);
    addAntecedent(preLoopLabel, currentFlow);
    currentFlow = preLoopLabel;
    bindCondition(node.condition, preBodyLabel, postLoopLabel);
    currentFlow = finishFlowLabel(preBodyLabel);
    bindIterativeStatement(node.statement, postLoopLabel, preLoopLabel);
    bind(node.incrementor);
    addAntecedent(preLoopLabel, currentFlow);
    currentFlow = finishFlowLabel(postLoopLabel);
}
```

```go
func (b *Binder) bindForStatement(node ForStatement) {
    preLoopLabel := b.setContinueTarget(node, b.createLoopLabel())
    preBodyLabel := b.createBranchLabel()
    postLoopLabel := b.createBranchLabel()
    b.bind(node.initializer)
    b.addAntecedent(preLoopLabel, b.currentFlow)
    b.currentFlow = preLoopLabel
    b.bindCondition(node.condition, preBodyLabel, postLoopLabel)
    b.currentFlow = b.finishFlowLabel(preBodyLabel)
    b.bindIterativeStatement(node.statement, postLoopLabel, preLoopLabel)
    b.bind(node.incrementor)
    b.addAntecedent(preLoopLabel, b.currentFlow)
    b.currentFlow = b.finishFlowLabel(postLoopLabel)
}
```
````
<!-- dprint-ignore-end -->

<!--
As an example, ts-to-go would take code that looks like this

and turn it into code that looks like this CLICK

It's very similar. Things just shifted around.
-->

---

<!-- dprint-ignore-start -->
````md magic-move {lines: false}
```ts
function getTypeOfSymbol(symbol: Symbol): Type {
    const checkFlags = getCheckFlags(symbol);
    if (checkFlags & CheckFlags.DeferredType) {
        return getTypeOfSymbolWithDeferredType(symbol);
    }
    if (checkFlags & CheckFlags.Instantiated) {
        return getTypeOfInstantiatedSymbol(symbol);
    }
    if (checkFlags & CheckFlags.Mapped) {
        return getTypeOfMappedSymbol(symbol as MappedSymbol);
    }
    if (checkFlags & CheckFlags.ReverseMapped) {
        return getTypeOfReverseMappedSymbol(symbol as ReverseMappedSymbol);
    }
    if (symbol.flags & (SymbolFlags.Variable | SymbolFlags.Property)) {
        return getTypeOfVariableOrParameterOrProperty(symbol);
    }
    // ...
    return errorType;
}
```

```go
func (c *Checker) getTypeOfSymbol(symbol *ast.Symbol) *Type {
    checkFlags := getCheckFlags(symbol)
    if checkFlags&ast.CheckFlagsDeferredType != 0 {
        return c.getTypeOfSymbolWithDeferredType(symbol)
    }
    if checkFlags&ast.CheckFlagsInstantiated != 0 {
        return c.getTypeOfInstantiatedSymbol(symbol)
    }
    if checkFlags&ast.CheckFlagsMapped != 0 {
        return c.getTypeOfMappedSymbol(symbol.(MappedSymbol))
    }
    if checkFlags&ast.CheckFlagsReverseMapped != 0 {
        return c.getTypeOfReverseMappedSymbol(symbol.(ReverseMappedSymbol))
    }
    if symbol.flags&(ast.SymbolFlagsVariable|ast.SymbolFlagsProperty) != 0 {
        return c.getTypeOfVariableOrParameterOrProperty(symbol)
    }
    // ...
    return c.errorType
}
```
````
<!-- dprint-ignore-end -->

<!--
Code that looks like this, with bitwise operations, type assertions, etc,

gets turned into this.

Again, very similar.
-->

---

<!-- dprint-ignore-start -->
```ts {*|3}
function getPropertyNameFromBindingElement(e: BindingElement) {
	const exprType = getLiteralTypeFromPropertyName(
		e.propertyName || e.name as Identifier,
	);
	return isTypeUsableAsPropertyName(exprType)
		? getPropertyNameFromType(exprType)
		: undefined;
}
```

<br>


```go {*|2}{at:1}
func (c *Checker) getPropertyNameFromBindingElement(e BindingElement) *string {
	exprType := c.getLiteralTypeFromPropertyName(e.PropertyName || e.Name.AsIdentifier())
	if isTypeUsableAsPropertyName(exprType) {
		return getPropertyNameFromType(exprType)
	} else {
		return nil
	}
}
```
<!-- dprint-ignore-end -->

<!--
Now, it's not all a perfect one to one.

The output may be syntactically valid, but it is not necessarily going
to compile. Note the `||` CLICK, which in JavaScript means "take the left side if truthy,
otherwise the right side", which in Go would have to be an if statement.

So there's a bit of manual massaging that's required here.
-->

---

<!-- dprint-ignore-start -->
```ts {*|4-6|6}
function getApplicableIndexInfoForName(type: Type, name: __String): IndexInfo | undefined {
	return getApplicableIndexInfo(
		type,
		isLateBoundName(name)
			? esSymbolType
			: getStringLiteralType(unescapeLeadingUnderscores(name)),
	);
}
```

<br>

```go {*|4-8|7}{at:1}
func (c *Checker) getApplicableIndexInfoForName(t *Type, name string) *IndexInfo {
	return c.getApplicableIndexInfo(
		t,
		ifElse(
			c.isLateBoundName(name),
			c.esSymbolType,
			c.getStringLiteralType(unescapeLeadingUnderscores(name)),
		),
	)
}
```
<!-- dprint-ignore-end -->

<!--
Go also lacks a ternary operator CLICK, so that gets turned into a fake call
to an if else function.

Note that this is not necessarily a safe transformation; the call always
evaluates its arguments, so this else case would always run. This one also
requires some manual intervention.
-->

---
layout: image-right
image: /img/port.jpg
---

# Starting the port

<v-clicks>

- Started by hand, `ts-to-go` soon after
- Anders did most of the initial prototype
  - Scanner, parser, binder, start of checker
- Eventually more people could work in parallel
- Many things made the porting process easier
  - Strategies you can use too!

</v-clicks>

<!--
For the most part, we started by hand, but but ts-to-go made this process quicker.

CLICk Anders did most of everything in the initial prototype: scanner, parser, binder,
and the start of the checker. Don't worry about those terms, I'll show them later.

CLICk Eventually we were able to start getting more and more people working on it,
until we got to the point where we could do work in parallel.

CLICK There were a bunch of things that made the porting process easier. Many of these
are actually things you could also do in your projects, to an extent.
-->

---
layout: section
---

# What helped us port TypeScript?

<!--
Let's take a look at some of the things that helped us port.
-->

---
layout: image-right
image: /img/camera.jpg
---

# Snapshot testing

Snapshots _aka_ baselines _aka_ golden files

<v-clicks>

- Idea: don't write assertions, just capture the output
- Most of our tests are based on this idea
- This is a strategy anyone can use!
  - [vitest.dev/guide/snapshot](https://vitest.dev/guide/snapshot.html)
  - [jestjs.io/docs/snapshot-testing](https://jestjs.io/docs/snapshot-testing)
  - and others!

</v-clicks>

<!--
The first of those strategies was snapshot testing.

CLICK The idea with snapshot testing is that you don't write assertions, you instead capture the output of what your test does and save that to disk.

CLICK This is the primary way we write tests in TypeScript

CLICK and it's something available in most test runners like vitest or jest.
-->

---

# Snapshotting in action

<!-- dprint-ignore-start -->
````md magic-move {lines: false}
```ts
import { expect, test } from "vitest";
import { createUser } from "./user";

test("default user", () => {
    const user = createUser("Jake");
    expect(user.plan).toBe("free");       // hardcoded
    expect(user.tags).toEqual([]);        // hardcoded
});
```

```ts
import { expect, test } from "vitest";
import { createUser } from "./user";

test("default user", () => {
    const user = createUser("Jake");       // change the code,
    expect(user.verified).toBe(false);     // change the test 😞
    expect(user.planID).toBe("plan_free");
    expect(user.labels).toEqual(["new"]);
});
```

```ts
import { expect, test } from "vitest";
import { createUser } from "./user";

test("default user", () => {
    expect(createUser("Jake")).toMatchSnapshot(); // no hardcoding! 
});
```
````
<!-- dprint-ignore-end -->

<!--
Let's say you have a unit test. You might use "expect" to assert that the behavior returns a specific result.

CLICK but if you change the code you're testing, you now need to update the tests to match. if you have a few of these, maybe it's okay, but the more tests you have, the more annoying it gets. It's also error prone because maybe there are other properties you didn't think about testing.

CLICK Snapshot testing gets rid of all of this entirely
-->

---

# Snapshotting in action

<!-- dprint-ignore-start -->
````md magic-move {lines: false, at: 1}
```ts
import { expect, test } from "vitest";
import { createUser } from "./user";

test("default user", () => {
    expect(createUser("Jake")).toMatchSnapshot();
});
```

```ts
import { expect, test } from "vitest";
import { createUser } from "./user"; // ← this changed!

test("default user", () => {
    expect(createUser("Jake")).toMatchSnapshot();
});
```
````

````md magic-move {lines: false, at: 1}
```js
exports[`default user 1`] = `
{
  "name": "Jake",
  "plan": "free",
  "tags": [],
}
`;
```

```js
exports[`default user 1`] = `
{
  "email": "jake@example.com",
  "name": "Jake",
  "planID": "plan_free",
  "labels": ["new"],
  "verified": false,
}
`;
```
````
<!-- dprint-ignore-end -->

<v-click at=1>

Just run `vitest -u`.

</v-click>

<!--
When you write a snapshot test, the test runner, in this case vitest, will write out a file that visually displays what you're testing. This file gets committed to your repo.

CLICK if you change behavior, the test will fail, but you can ask the test runner to update the snapshot. Now, when you make a change and send a PR, the PR diff clearly shows  that you changed something, without ever updating any tests.
-->

---

# TypeScript's compiler tests

<!-- dprint-ignore-start -->
```ts [tskaigi.ts]
// @strict: true
// @target: es5

const arr = [];
arr.push("hi");
arr.push(1234);

const value: string | number = arr[1];
```
<!-- dprint-ignore-end -->

<!--
This strategy is what we use in TypeScript, taken even further.

Instead of writing out unit tests that individually test functions in our code, we write high-level end-to-end "compiler tests".

These tests are very readable. To add a test, we just add a file and the test runner automatically runs it. We have something like 17 thousand of these.

The output of this test are snapshots, though we refer to them as "baselines".
-->

---

# Type baselines

<!-- dprint-ignore-start -->
```ts [tskaigi.types] {*|2-3,6-10,13-17}
const arr = [];
>arr : never[]
>[] : never[]

arr.push("hi");
>arr.push("hi") : number
>arr.push : (...items: never[]) => number
>arr : never[]
>push : (...items: never[]) => number
>"hi" : "hi"

arr.push(1234);
>arr.push(1234) : number
>arr.push : (...items: never[]) => number
>arr : never[]
>push : (...items: never[]) => number
>1234 : 1234
```
<!-- dprint-ignore-end -->

<!--
One output from the compiler tests is a "type baseline". We walk every node in the AST,
and ask "what's the type at this node", CLICK "what's the type at this node", and so on,
storing the result. If we are working on a change to the compiler and break something,
we'll know because one the baselines will change. These files are committed to the repo,
so we can review them in PRs.
-->

---

# Error baselines

<!-- dprint-ignore-start -->
```plaintext [tskaigi.errors.txt]
tskaigi.ts(2,10): error TS2345: Argument of type '"hi"' is not assignable to parameter of type 'never'.
tskaigi.ts(3,10): error TS2345: Argument of type '1234' is not assignable to parameter of type 'never'.


==== tskaigi.ts (2 errors) ====
    const arr = [];
    arr.push("hi");
             ~~~~
!!! error TS2345: Argument of type '"hi"' is not assignable to parameter of type 'never'.
    arr.push(1234);
             ~~~~
!!! error TS2345: Argument of type '1234' is not assignable to parameter of type 'never'.
    
    const value: string | number = arr[1];
```
<!-- dprint-ignore-end -->

<!--
We do the same thing for error messages.

Since we are in control of what the baseline looks like, we can make it look pretty, and include nice squiggles to make them readable.

It's pretty nice.
-->

---

# Even more meta: _diffing_ baselines

<!-- dprint-ignore-start -->
```diff
--- old.example.errors.txt
+++ new.example.errors.txt
-<no content>
+example.ts(2,10): error TS2345: Argument of type '"hi"' is not assignable to parameter of type 'never'
+example.ts(3,10): error TS2345: Argument of type '1234' is not assignable to parameter of type 'never'
+
+==== example.ts (2 errors) ====
+    const arr = [];
+    arr.push("hi");
+             ~~~~
+!!! error TS2345: Argument of type '"hi"' is not assignable to parameter of type 'never'
```
<!-- dprint-ignore-end -->

<!--
Since we need to be able to test the new compiler too, we can implement a test runner that takes all of our existing tests and runs them in the same way.

Since the Go-based test runner also outputs baseline files in the same format, what we can do is make _even more baselines_ that show the difference between the old compiler and the new one. Those files can be committed to the repo too.

These tricks combined means that we can get a massive amount of code coverage without writing any unit tests at all, and have everything very easily readable in PRs.
-->

---

# Burning down diffs

## 

<!-- dprint-ignore-start -->
<div v-if="$clicks < 1">
<img src="/img/diff-pr.png" class="diff-img" alt="GitHub PR showing code changes to scanner.go alongside baseline diff files being added and removed" />
</div>
<div v-if="$clicks === 1">
<img src="/img/diff-baselines.png" class="diff-img" alt="GitHub diff view showing baseline type files being corrected, with red/green lines showing fixed type representations" />
</div>
<div v-if="$clicks >= 2">
<img src="/img/diff-baselines.png" class="diff-img" alt="GitHub diff view showing baseline type files being corrected" />
<img src="/img/diff-baselines.png" class="diff-zoom" alt="Zoomed view showing 'This file was deleted' message for a resolved baseline diff" />
</div>
<span v-click="1"></span><span v-click="2"></span>
<!-- dprint-ignore-end -->

<style>
.diff-img {
  width: 100%;
  border-radius: 10px;
  border: 2px solid #475569;
  box-shadow: 0 4px 12px rgba(0,0,0,0.3);
}
.diff-zoom {
  position: absolute;
  right: 30px;
  bottom: 50px;
  width: 600px;
  height: 220px;
  object-fit: none;
  object-position: 50% 90%;
  border: 3px solid #3b82f6;
  border-radius: 10px;
  box-shadow: 0 8px 24px rgba(0,0,0,0.5);
}
</style>

<!--
For example, this is a PR to the tsgo repo from earlier this week.
How do I know if this PR is correct? How do I know if it matches the old compiler?

CLICK

I look at the baselines; the output looks less weird, you can see there's some weird unicode stuff going away which already looks good, but crucially CLICK, the diff file is being deleted! 

This gives us confidence in the changes we're making.
-->

---

# Fuzzing

<!-- dprint-ignore-start -->
<div class="fuzz-demo">
  <div class="fuzz-fn">
    <span class="fuzz-kw">func</span> ParseSourceFile(<span class="fuzz-param">sourceText</span> <span class="fuzz-type">string</span>) *<span class="fuzz-type">ast.SourceFile</span>
  </div>
  <div class="fuzz-lanes">
    <div class="fuzz-calls">
      <div class="fuzz-call c1"><span class="fuzz-prompt">→</span> <span class="fuzz-expr"><span class="fuzz-fn-call">ParseSourceFile(</span><span class="fuzz-arg">"const x: number = 42;"</span><span class="fuzz-fn-call">)</span></span> <span class="fuzz-result ok">✓ PASS</span></div>
      <div class="fuzz-call c2"><span class="fuzz-prompt">→</span> <span class="fuzz-expr"><span class="fuzz-fn-call">ParseSourceFile(</span><span class="fuzz-arg">"if (a &amp;&amp; b) { return c }"</span><span class="fuzz-fn-call">)</span></span> <span class="fuzz-result ok">✓ PASS</span></div>
      <div class="fuzz-call c3"><span class="fuzz-prompt">→</span> <span class="fuzz-expr"><span class="fuzz-fn-call">ParseSourceFile(</span><span class="fuzz-arg">"((([[[)))]]]]))))"</span><span class="fuzz-fn-call">)</span></span> <span class="fuzz-result ok">✓ PASS</span></div>
      <div class="fuzz-call c4"><span class="fuzz-prompt">→</span> <span class="fuzz-expr"><span class="fuzz-fn-call">ParseSourceFile(</span><span class="fuzz-arg">"\x00\xff\xfe\x80\x7f"</span><span class="fuzz-fn-call">)</span></span> <span class="fuzz-result ok">✓ PASS</span></div>
      <div class="fuzz-call c5"><span class="fuzz-prompt">→</span> <span class="fuzz-expr"><span class="fuzz-fn-call">ParseSourceFile(</span><span class="fuzz-arg">"type T = T extends T ? T :"</span><span class="fuzz-fn-call">)</span></span> <span class="fuzz-result ok">✓ PASS</span></div>
      <div class="fuzz-call c6"><span class="fuzz-prompt">→</span> <span class="fuzz-expr"><span class="fuzz-fn-call">ParseSourceFile(</span><span class="fuzz-arg">"import * as 🤯 from '@@'"</span><span class="fuzz-fn-call">)</span></span> <span class="fuzz-result crash">✗ PANIC</span></div>
      <div class="fuzz-call c7"><span class="fuzz-prompt">→</span> <span class="fuzz-expr"><span class="fuzz-fn-call">ParseSourceFile(</span><span class="fuzz-arg">"let a = /*\n\n\n\n\n\n*/"</span><span class="fuzz-fn-call">)</span></span> <span class="fuzz-result ok">✓ PASS</span></div>
      <div class="fuzz-call c8"><span class="fuzz-prompt">→</span> <span class="fuzz-expr"><span class="fuzz-fn-call">ParseSourceFile(</span><span class="fuzz-arg">"export default default"</span><span class="fuzz-fn-call">)</span></span> <span class="fuzz-result ok">✓ PASS</span></div>
    </div>
    <div class="fuzz-calls lane-b">
      <div class="fuzz-call c1"><span class="fuzz-prompt">→</span> <span class="fuzz-expr"><span class="fuzz-fn-call">ParseSourceFile(</span><span class="fuzz-arg">"for (;;) break;"</span><span class="fuzz-fn-call">)</span></span> <span class="fuzz-result ok">✓ PASS</span></div>
      <div class="fuzz-call c2"><span class="fuzz-prompt">→</span> <span class="fuzz-expr"><span class="fuzz-fn-call">ParseSourceFile(</span><span class="fuzz-arg">"yield* await void 0"</span><span class="fuzz-fn-call">)</span></span> <span class="fuzz-result ok">✓ PASS</span></div>
      <div class="fuzz-call c3"><span class="fuzz-prompt">→</span> <span class="fuzz-expr"><span class="fuzz-fn-call">ParseSourceFile(</span><span class="fuzz-arg">"declare module ''"</span><span class="fuzz-fn-call">)</span></span> <span class="fuzz-result ok">✓ PASS</span></div>
      <div class="fuzz-call c4"><span class="fuzz-prompt">→</span> <span class="fuzz-expr"><span class="fuzz-fn-call">ParseSourceFile(</span><span class="fuzz-arg">"switch switch switch"</span><span class="fuzz-fn-call">)</span></span> <span class="fuzz-result ok">✓ PASS</span></div>
      <div class="fuzz-call c5"><span class="fuzz-prompt">→</span> <span class="fuzz-expr"><span class="fuzz-fn-call">ParseSourceFile(</span><span class="fuzz-arg">"a?.b!.c??d"</span><span class="fuzz-fn-call">)</span></span> <span class="fuzz-result ok">✓ PASS</span></div>
      <div class="fuzz-call c6"><span class="fuzz-prompt">→</span> <span class="fuzz-expr"><span class="fuzz-fn-call">ParseSourceFile(</span><span class="fuzz-arg">"\u0000\u0001\u0002"</span><span class="fuzz-fn-call">)</span></span> <span class="fuzz-result ok">✓ PASS</span></div>
      <div class="fuzz-call c7"><span class="fuzz-prompt">→</span> <span class="fuzz-expr"><span class="fuzz-fn-call">ParseSourceFile(</span><span class="fuzz-arg">"#!@$%^*()_+~|;:',."</span><span class="fuzz-fn-call">)</span></span> <span class="fuzz-result ok">✓ PASS</span></div>
      <div class="fuzz-call c8"><span class="fuzz-prompt">→</span> <span class="fuzz-expr"><span class="fuzz-fn-call">ParseSourceFile(</span><span class="fuzz-arg">"enum enum enum"</span><span class="fuzz-fn-call">)</span></span> <span class="fuzz-result crash">✗ PANIC</span></div>
    </div>
    <div class="fuzz-calls lane-c">
      <div class="fuzz-call c1"><span class="fuzz-prompt">→</span> <span class="fuzz-expr"><span class="fuzz-fn-call">ParseSourceFile(</span><span class="fuzz-arg">"as as as as as as"</span><span class="fuzz-fn-call">)</span></span> <span class="fuzz-result ok">✓ PASS</span></div>
      <div class="fuzz-call c2"><span class="fuzz-prompt">→</span> <span class="fuzz-expr"><span class="fuzz-fn-call">ParseSourceFile(</span><span class="fuzz-arg">"return return return"</span><span class="fuzz-fn-call">)</span></span> <span class="fuzz-result ok">✓ PASS</span></div>
      <div class="fuzz-call c3"><span class="fuzz-prompt">→</span> <span class="fuzz-expr"><span class="fuzz-fn-call">ParseSourceFile(</span><span class="fuzz-arg">"class extends implements"</span><span class="fuzz-fn-call">)</span></span> <span class="fuzz-result ok">✓ PASS</span></div>
      <div class="fuzz-call c4"><span class="fuzz-prompt">→</span> <span class="fuzz-expr"><span class="fuzz-fn-call">ParseSourceFile(</span><span class="fuzz-arg">"...[]...[]...[]"</span><span class="fuzz-fn-call">)</span></span> <span class="fuzz-result ok">✓ PASS</span></div>
      <div class="fuzz-call c5"><span class="fuzz-prompt">→</span> <span class="fuzz-expr"><span class="fuzz-fn-call">ParseSourceFile(</span><span class="fuzz-arg">"const _ = /(/;"</span><span class="fuzz-fn-call">)</span></span> <span class="fuzz-result ok">✓ PASS</span></div>
      <div class="fuzz-call c6"><span class="fuzz-prompt">→</span> <span class="fuzz-expr"><span class="fuzz-fn-call">ParseSourceFile(</span><span class="fuzz-arg">"typeof typeof typeof"</span><span class="fuzz-fn-call">)</span></span> <span class="fuzz-result ok">✓ PASS</span></div>
      <div class="fuzz-call c7"><span class="fuzz-prompt">→</span> <span class="fuzz-expr"><span class="fuzz-fn-call">ParseSourceFile(</span><span class="fuzz-arg">"async function* ()"</span><span class="fuzz-fn-call">)</span></span> <span class="fuzz-result ok">✓ PASS</span></div>
      <div class="fuzz-call c8"><span class="fuzz-prompt">→</span> <span class="fuzz-expr"><span class="fuzz-fn-call">ParseSourceFile(</span><span class="fuzz-arg">"new new new new"</span><span class="fuzz-fn-call">)</span></span> <span class="fuzz-result ok">✓ PASS</span></div>
    </div>
  </div>
</div>
<!-- dprint-ignore-end -->

<style>
.fuzz-demo {
  margin-top: 16px;
  font-family: var(--slidev-code-font-family);
}
.fuzz-fn {
  font-size: 22px;
  padding: 14px 24px;
  border-radius: 10px;
  margin-bottom: 8px;
  border: 2px solid #475569;
}
html.dark .fuzz-fn { background: #1e293b; color: #d4d4d4; }
html:not(.dark) .fuzz-fn { background: #f1f5f9; color: #000000; border-color: #94a3b8; }
html.dark .fuzz-kw { color: #569cd6; }
html:not(.dark) .fuzz-kw { color: #0000ff; }
html.dark .fuzz-param { color: #9cdcfe; }
html:not(.dark) .fuzz-param { color: #001080; }
html.dark .fuzz-type { color: #4ec9b0; }
html:not(.dark) .fuzz-type { color: #267f99; }
.fuzz-lanes {
  display: flex;
  flex-direction: column;
  gap: 0;
}
.fuzz-calls {
  position: relative;
  height: 36px;
  overflow: hidden;
  border-radius: 4px;
  padding: 2px 0;
}
.fuzz-call {
  position: absolute;
  left: 0;
  right: 0;
  padding: 4px 24px;
  font-size: 18px;
  display: flex;
  align-items: center;
  gap: 16px;
  opacity: 0;
  animation: fuzz-scroll 24s linear infinite;
}
.fuzz-call.c1  { animation-delay: 0s; }
.fuzz-call.c2  { animation-delay: 3.0s; }
.fuzz-call.c3  { animation-delay: 6.0s; }
.fuzz-call.c4  { animation-delay: 9.0s; }
.fuzz-call.c5  { animation-delay: 12.0s; }
.fuzz-call.c6  { animation-delay: 15.0s; }
.fuzz-call.c7  { animation-delay: 18.0s; }
.fuzz-call.c8  { animation-delay: 21.0s; }
.lane-b .fuzz-call { animation-duration: 18s; }
.lane-b .fuzz-call.c1  { animation-delay: 0.7s; }
.lane-b .fuzz-call.c2  { animation-delay: 2.95s; }
.lane-b .fuzz-call.c3  { animation-delay: 5.2s; }
.lane-b .fuzz-call.c4  { animation-delay: 7.45s; }
.lane-b .fuzz-call.c5  { animation-delay: 9.7s; }
.lane-b .fuzz-call.c6  { animation-delay: 11.95s; }
.lane-b .fuzz-call.c7  { animation-delay: 14.2s; }
.lane-b .fuzz-call.c8  { animation-delay: 16.45s; }
.lane-c .fuzz-call { animation-duration: 27s; }
.lane-c .fuzz-call.c1  { animation-delay: 1.4s; }
.lane-c .fuzz-call.c2  { animation-delay: 4.78s; }
.lane-c .fuzz-call.c3  { animation-delay: 8.16s; }
.lane-c .fuzz-call.c4  { animation-delay: 11.54s; }
.lane-c .fuzz-call.c5  { animation-delay: 14.92s; }
.lane-c .fuzz-call.c6  { animation-delay: 18.3s; }
.lane-c .fuzz-call.c7  { animation-delay: 21.68s; }
.lane-c .fuzz-call.c8  { animation-delay: 25.06s; }
.lane-b .fuzz-result { animation-duration: 18s; }
.lane-c .fuzz-result { animation-duration: 27s; }
@keyframes fuzz-scroll {
  0%   { opacity: 0; }
  1%   { opacity: 1; }
  7%   { opacity: 1; }
  9%   { opacity: 0; }
  100% { opacity: 0; }
}
.fuzz-prompt { color: #64748b; font-size: 22px; }
html.dark .fuzz-arg { color: #ce9178; }
html:not(.dark) .fuzz-arg { color: #a31515; }
.fuzz-arg { }
html.dark .fuzz-fn-call { color: #dcdcaa; }
html:not(.dark) .fuzz-fn-call { color: #795e26; }
.fuzz-fn-call { white-space: nowrap; }
.fuzz-expr { flex: 1; }
.fuzz-result {
  font-weight: 700;
  font-size: 18px;
  padding: 4px 12px;
  border-radius: 6px;
  white-space: nowrap;
  opacity: 0;
  animation: fuzz-result-appear 23s linear infinite;
  animation-delay: inherit;
}
.fuzz-result.ok { color: #22c55e; }
.fuzz-result.crash {
  color: #ef4444;
  background: rgba(239, 68, 68, 0.15);
}
@keyframes fuzz-result-appear {
  0%   { opacity: 0; }
  3%   { opacity: 0; }
  4%   { opacity: 1; }
  7%   { opacity: 1; }
  9%   { opacity: 0; }
  100% { opacity: 0; }
}
</style>

In Go:

- `go test -fuzz=FuzzSomething`
- [go.dev/doc/security/fuzz/fuzz-testing](https://go.dev/doc/security/fuzz/fuzz-testing)

In TS/JS:

- [fast-check.dev](https://fast-check.dev/)
- [github.com/CodeIntelligenceTesting/jazzer.js](https://github.com/CodeIntelligenceTesting/jazzer.js)

<!--
Another strategy that gives us confidence in our code is  "fuzzing".

Fuzzing is a kind of test where you generate test cases very quickly, sometimes
randomly, sometimes based on code coverage, to find crashes.

Go has coverage-based fuzzing built in, so we can fuzz functions out of the box.

It'll run the test over and over, looking for new code paths, trying to break the code. You just leave it running until you're satified.

This strategy is how many security issues have been found in major libraries like OpenSSL, and it's something that you can use in JavaScript with tools like fast-check or jazzer.
-->

---

# Differential fuzzing

##

<!-- dprint-ignore-start -->
````md magic-move {lines: false}
```go
// Direct port from the old compiler
var fileNameLowerCaseRegExp = regexp.MustCompile(
    `[^\x{0130}\x{0131}\x{00DF}a-z0-9\\/:\-_. ]+`,
)

func ToFileNameLowerCase(fileName string) string {
    return fileNameLowerCaseRegExp.ReplaceAllStringFunc(
        fileName, strings.ToLower,
    )
}
// regexp 😨
```

```go {*}
// Replaced with an optimized version:
func ToFileNameLowerCase(fileName string) string {
    const IWithDot = '\u0130'
    ascii, needsLower := scanASCII(fileName)
    if ascii {
        if !needsLower { return fileName }
        b := make([]byte, len(fileName))
        for i := range len(fileName) {
            c := fileName[i]
            if 'A' <= c && c <= 'Z' { c += 'a' - 'A' }
            b[i] = c
        }
        return unsafe.String(&b[0], len(b))
    }
    return strings.Map(func(r rune) rune {
        if r == IWithDot { return r }
        return unicode.ToLower(r)
    }, fileName)
}
```

```go
// Fuzz the new against the old:
func oldToFileNameLowerCase(fileName string) string { /* regex */ }
func ToFileNameLowerCase(fileName string) string { /* optimized */ }

func FuzzToFileNameLowerCase(f *testing.F) {
    f.Add("foo/bar/baz.ts")
    f.Add("C:/foo/bar/baz.ts")

    f.Fuzz(func(t *testing.T, p string) {
        want := oldToFileNameLowerCase(p)
        got := ToFileNameLowerCase(p)
        assert.Equal(t, want, got)
    })
}
```
````
<!-- dprint-ignore-end -->

<!--
But in my opinion, the coolest trick that you can do with fuzzing is
"differential fuzzing". For example, let's take this code we directly
ported from the old compiler. A regex is fast in JavaScript,
but Go's regexp engine is not fast, so this code is slow.

Click: We can write a new version without regexes that's a bit more complicated but is faster.
But, we want to make sure that the new version works correctly,
because it's not immediately obvious that it does. We could trust that our unit test suite tests everything, but in practice, it's easy to forget a case, especially in code even more complicated than this.

Click: So what we can do is create a fuzz test that doesn't mainly look for crashes,
but instead compares the output of two functions,  the new version and the old version. If they differ, we know there's a bug in the new version, and the fuzzer will give us a test case!

All we had to do was give the fuzzer some examples, and it will figure the test cases for us. It's like magic.
-->

---

# Extended testing: top repos

## 

<img src="/img/toptests.png" class="main" alt="GitHub comment from typescript-bot showing results of running the top 400 repos with tsc, comparing main and a PR branch, with microsoft/vscode showing errors like TS2578 unused ts-expect-error directives and TS7027 unreachable code" />

<style>
img.main {
  height: 140%;
  margin-left: auto;
  margin-right: auto;
}
</style>

<!--
Beyond our own test suite, we also pull the top projects from GitHub
in TypeScript and JavaScript, and run our compiler against their tsconfigs.

Here you can see that a PR changed type checking behavior in VS Code's codebase:
some ts-expect-error directives became unused, and some code became unreachable.
That tells us our change actually had an effect.

If you're working on a library, this is a great strategy: get to know
your consumers, run their code against your changes.
-->

---

# Extended testing: server fuzzing

## 

<img src="/img/servertests-crash.png" class="main" alt="GitHub issue from typescript-bot reporting errors from running 300 popular TS repos, showing a panic in the language server during textDocument/signatureHelp with a stack trace through lsp server.go, debug.go, and signaturehelp.go" />

<style>
img.main {
  height: 90%;
  margin-left: auto;
  margin-right: auto;
}
</style>

<!--
We also pull random repos and fuzz our language server with randomized requests
to see if we crash.

We had this infrastructure in the old codebase, and rebuilt it for the new one,
and it's been churning out crashes ever since. Each crash comes with a full stack
trace, but even better...
-->

---

# Extended testing: replay

## 

<img src="/img/servertests-replay.png" class="main" alt="GitHub issue detail showing repro steps for a server crash, including git clone commands, downloading replay artifacts, and running npx tsreplay to reproduce the issue locally" />

<!-- dprint-ignore-start -->
<img v-click src="/img/servertests-replay.png" class="replay-zoom" alt="Zoomed view of the repro steps section showing git clone, artifact download, and tsreplay commands" />
<!-- dprint-ignore-end -->

<style>
img.main {
  height: 90%;
  margin-left: auto;
  margin-right: auto;
}
.replay-zoom {
  position: absolute;
  left: 140px;
  bottom: 30px;
  width: 700px;
  height: 320px;
  object-fit: cover;
  object-position: 15% 100%;
  border: 3px solid #3b82f6;
  border-radius: 10px;
  box-shadow: 0 8px 24px rgba(0,0,0,0.5);
  z-index: 10;
}
</style>

<!--
Each crash also comes with replay instructions. CLICK We record the messages sent
during the fuzz run, and you can replay it locally to reproduce and debug the problem.
-->

---

# Replay in Go

## 

As easy as:

```sh
go test ./internal/lsp -run TestReplay -replay crash.jsonl -testDir ./repo
```

<div v-click>

```go
func TestReplay(t *testing.T) {
    // spin up a real LSP server in-process
    client, closeClient := lsptestutil.NewLSPClient(t, serverOpts, nil)
    defer closeClient()

    // read the recorded traffic (JSON-lines)
    for _, rawMsg := range messages {
        switch rawMsg.Kind {
        case "request":
            response, _ := client.SendRequestWorker(t, msg.AsRequest(), reqID)
            if response.Error != nil {
                t.Fatalf("server error for %s:\n%v", rawMsg.Method, response.Error)
            }
        case "notification":
            client.WriteMsg(t, &msg)
        }
    }
}
```

</div>

<!--
And in the new code, replay is just a Go test, not even an external tool.
One command, and you're reproducing the crash locally.

CLICK

It spins up a real LSP server in-process and sends it the same messages that the fuzzer did.

No mocking, no complex harness. Just a Go test, against the real server.
-->

---
layout: section
---

# Getting it into users' hands

<!--
Now, good testing is important, but even more critical is actually getting the port out into the hands of users so they can try it out.
-->

---

# Native preview

## 

Released May 22nd, 2025, exactly one year ago 🥳

```sh
npm install -D @typescript/native-preview
npx tsgo
```

<!-- dprint-ignore-start -->
<div class="chart-container">
  <div class="chart-label y-label">Weekly npm downloads</div>
  <div class="chart-inner">
    <div class="y-axis">
      <span>6M</span>
      <span>3M</span>
      <span>0</span>
    </div>
    <div class="chart-area">
      <svg viewBox="0 0 720 200" preserveAspectRatio="none" class="chart-svg">
        <defs>
          <linearGradient id="dlGrad" x1="0" y1="0" x2="0" y2="1">
            <stop offset="0%" stop-color="#3b82f6" stop-opacity="0.3" />
            <stop offset="100%" stop-color="#3b82f6" stop-opacity="0.02" />
          </linearGradient>
        </defs>
        <path d="M0,199.8 L14.1,199.3 L28.2,196.5 L42.4,196.5 L56.5,196.8 L70.6,191.3 L84.7,194.2 L98.8,195.4 L112.9,194.9 L127.1,195.2 L141.2,195.3 L155.3,194.4 L169.4,193.7 L183.5,190.3 L197.6,190.2 L211.8,190.1 L225.9,189.3 L240,189.7 L254.1,189.1 L268.2,188.7 L282.4,187.1 L296.5,184.8 L310.6,184.8 L324.7,184.5 L338.8,169.4 L352.9,138.7 L367.1,147.7 L381.2,125.0 L395.3,131.5 L409.4,155.2 L423.5,148.3 L437.6,168.9 L451.8,159.3 L465.9,160.6 L480,152.5 L494.1,152.6 L508.2,130.1 L522.4,130.1 L536.5,128.8 L550.6,129.2 L564.7,135.6 L578.8,121.6 L592.9,114.2 L607.1,99.6 L621.2,95.1 L635.3,101.4 L649.4,64.2 L663.5,62.3 L677.6,42.3 L691.8,32.4 L705.9,23.8 L720,22.2 L720,200 L0,200 Z" fill="url(#dlGrad)" />
        <path d="M0,199.8 L14.1,199.3 L28.2,196.5 L42.4,196.5 L56.5,196.8 L70.6,191.3 L84.7,194.2 L98.8,195.4 L112.9,194.9 L127.1,195.2 L141.2,195.3 L155.3,194.4 L169.4,193.7 L183.5,190.3 L197.6,190.2 L211.8,190.1 L225.9,189.3 L240,189.7 L254.1,189.1 L268.2,188.7 L282.4,187.1 L296.5,184.8 L310.6,184.8 L324.7,184.5 L338.8,169.4 L352.9,138.7 L367.1,147.7 L381.2,125.0 L395.3,131.5 L409.4,155.2 L423.5,148.3 L437.6,168.9 L451.8,159.3 L465.9,160.6 L480,152.5 L494.1,152.6 L508.2,130.1 L522.4,130.1 L536.5,128.8 L550.6,129.2 L564.7,135.6 L578.8,121.6 L592.9,114.2 L607.1,99.6 L621.2,95.1 L635.3,101.4 L649.4,64.2 L663.5,62.3 L677.6,42.3 L691.8,32.4 L705.9,23.8 L720,22.2" fill="none" stroke="#3b82f6" stroke-width="2" stroke-linejoin="round" stroke-linecap="round" vector-effect="non-scaling-stroke" />
        <line x1="0" y1="100" x2="720" y2="100" stroke="currentColor" opacity="0.08" stroke-dasharray="4" vector-effect="non-scaling-stroke" />
      </svg>
      <div class="chart-endpoint"><span>6.2M</span></div>
    </div>
  </div>
  <div class="x-axis">
    <span>May 2025</span>
    <span>Sep 2025</span>
    <span>Jan 2026</span>
    <span>May 2026</span>
  </div>
</div>
<!-- dprint-ignore-end -->

<img v-click="[1, 2]" src="/img/tskaigi2025.jpg" alt="TSKaigi 2025" class="fullscreen-overlay" />

<style>
.fullscreen-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: contain;
  z-index: 100;
  background: black;
  border-radius: 0;
  box-shadow: none;
}
.chart-container {
  margin-top: auto;
  width: 85%;
  margin-left: auto;
  margin-right: auto;
  padding-bottom: 8px;
}
.chart-label {
  font-size: 1.1rem;
  opacity: 0.4;
  text-align: center;
  margin-bottom: 4px;
}
.chart-inner {
  display: flex;
  gap: 6px;
}
.y-axis {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  font-size: 1.05rem;
  opacity: 0.4;
  text-align: right;
  padding: 0;
}
.chart-area {
  flex: 1;
  position: relative;
  border-left: 1px solid rgba(128,128,128,0.15);
  border-bottom: 1px solid rgba(128,128,128,0.15);
  height: 210px;
}
.chart-svg {
  width: 100%;
  height: 100%;
}
.chart-endpoint {
  position: absolute;
  top: -14px;
  right: 4px;
  color: #3b82f6;
  font-weight: 700;
  font-size: 1.65rem;
}
.x-axis {
  display: flex;
  justify-content: space-between;
  font-size: 1.05rem;
  opacity: 0.35;
  padding-left: 40px;
  margin-top: 4px;
}
.slidev-layout {
  display: flex;
  flex-direction: column;
}
.announce-img {
  width: 70%;
  border-radius: 10px;
  border: 2px solid #475569;
  box-shadow: 0 4px 12px rgba(0,0,0,0.3);
  margin-bottom: 8px;
}
</style>

<!--
And so, our "native previews" launched exactly one year ago, May 22nd, 2025.

Of course, I feel the need to apologize. CLICK
It turns out, we put out the preview the same day as TSKaigi last year!

So, I'm happy to announce that this time, I'm not announcing anything!

CLICK

Anyway... In the past year, we've grown to 6.2 million weekly downloads.

That's pretty crazy because the last time I gave a talk about this effort, we were only at something like 200 thousand downloads. We're at least 20 times bigger now.
-->

---

# Native preview: VS Code extension

##

<img src="/img/native-preview-ext.png" alt="VS Code marketplace page for the TypeScript Native Preview extension" class="ext-img" />

[jakebailey.dev/go/ts-native-preview-ext](https://jakebailey.dev/go/ts-native-preview-ext)

<style>
.ext-img {
  height: 75%;
  margin-left: auto;
  margin-right: auto;
  margin-bottom: 8px;
}
</style>

<!--
And we have a VS Code extension that lets you try the native preview
right in your editor.

It's even got a 5 star review, so you know it's good!
-->

---

# Community feedback

## 

In the past year:

- 1141 new issues!
- 1828 PRs, 1487 of which are merged!

<img src="/img/typescript-go-issues.png" alt="GitHub issues page for microsoft/typescript-go showing 117 open and 1024 closed issues from the past year, with bug reports about incremental builds, type narrowing, module resolution, and crash reports" class="issues-img" />

<style>
.issues-img {
  height: 90%;
  margin-left: auto;
  margin-right: auto;
  margin-top: 8px;
}
</style>

<!--
With these two out there, we've been able to get a load of feedback, and have been
working non stop for the last year. We've had over a thousand issues filed,
and nearly 1500 PRs merged, which is just incredible.

Though, I checked and nearly a third of those PRs were mine, so maybe I could afford to work a little less...
-->

---

# Editor telemetry

##

<v-clicks>

- Crash traces, sanitized and sent via VS Code telemetry
	```plaintext
	lsconv.(*Converters).LineAndCharacterToPosition()
	internal/ls/lsconv/converters.go:175
	ls.(*LanguageService).adjustFoldingEnd()
	internal/ls/folding.go:43
	ls.(*LanguageService).ProvideFoldingRange()
	internal/ls/folding.go:23
	lsp.(*Server).handleFoldingRange()
	internal/lsp/server.go:1267
	```
- Helps us measure progress, focus on the most common crashers
- Copilot can often take a stack trace and reproduce the crash!

</v-clicks>

<!--
In addition to the direct feedback we get from users, we also get indirect feedback through telemetry.

I know telemetry can be a touchy subject, but it's something that's really important
to making sure that we are doing the right thing. CLICK

The main thing we get from telemetry is crash information. When the server hits a bug,
that trace is sanitized and sent to us. We can then process that info CLICK, and focus on fixing them,
or identifying patterns to fix bugs that cause multiple crashes.

In many cases, the stack trace is enough to figure what's going on.
We've had success CLICK simply handing Copilot a stack trace, and it can reproduce the crash,
something we definitely could not do before.
-->

---

# Editor error rates

##

<!-- dprint-ignore-start -->
<div class="chart-container">
  <div class="chart-label y-label">Crash rate (% of sessions)</div>
  <div class="chart-inner">
    <div class="y-axis">
      <span></span>
      <span></span>
      <span></span>
    </div>
    <div class="chart-area">
      <svg viewBox="0 0 720 200" preserveAspectRatio="none" class="chart-svg">
        <defs>
          <linearGradient id="crGrad" x1="0" y1="0" x2="0" y2="1">
            <stop offset="0%" stop-color="#ef4444" stop-opacity="0.3" />
            <stop offset="100%" stop-color="#22c55e" stop-opacity="0.02" />
          </linearGradient>
        </defs>
        <path d="M0.0,107.8 L16.0,143.1 L32.0,148.1 L48.0,145.8 L64.0,140.6 L80.0,137.7 L96.0,180.0 L112.0,162.5 L128.0,161.2 L144.0,161.3 L160.0,144.0 L176.0,127.9 L192.0,80.7 L208.0,45.1 L224.0,61.2 L240.0,28.2 L256.0,28.5 L272.0,28.9 L288.0,191.5 L304.0,187.1 L320.0,183.5 L336.0,171.0 L352.0,176.7 L368.0,180.1 L384.0,178.1 L400.0,167.2 L416.0,166.3 L432.0,174.1 L448.0,189.6 L464.0,193.1 L480.0,195.9 L496.0,196.4 L512.0,196.4 L528.0,196.5 L544.0,196.5 L560.0,196.8 L576.0,196.4 L592.0,196.0 L608.0,195.8 L624.0,196.0 L640.0,196.3 L656.0,196.5 L672.0,196.5 L688.0,196.6 L704.0,196.8 L720.0,197.5 L720,200 L0,200 Z" fill="url(#crGrad)" />
        <path d="M0.0,107.8 L16.0,143.1 L32.0,148.1 L48.0,145.8 L64.0,140.6 L80.0,137.7 L96.0,180.0 L112.0,162.5 L128.0,161.2 L144.0,161.3 L160.0,144.0 L176.0,127.9 L192.0,80.7 L208.0,45.1 L224.0,61.2 L240.0,28.2 L256.0,28.5 L272.0,28.9 L288.0,191.5 L304.0,187.1 L320.0,183.5 L336.0,171.0 L352.0,176.7 L368.0,180.1 L384.0,178.1 L400.0,167.2 L416.0,166.3 L432.0,174.1 L448.0,189.6 L464.0,193.1 L480.0,195.9 L496.0,196.4 L512.0,196.4 L528.0,196.5 L544.0,196.5 L560.0,196.8 L576.0,196.4 L592.0,196.0 L608.0,195.8 L624.0,196.0 L640.0,196.3 L656.0,196.5 L672.0,196.5 L688.0,196.6 L704.0,196.8 L720.0,197.5" fill="none" stroke="#ef4444" stroke-width="2" stroke-linejoin="round" stroke-linecap="round" vector-effect="non-scaling-stroke" />
        <line x1="0" y1="100" x2="720" y2="100" stroke="currentColor" opacity="0.08" stroke-dasharray="4" vector-effect="non-scaling-stroke" />
      </svg>
      <div class="chart-endpoint"><span></span></div>
    </div>
  </div>
  <div class="x-axis">
    <span>Apr 5</span>
    <span>Apr 21</span>
    <span>May 1</span>
    <span>May 20</span>
  </div>
</div>
<!-- dprint-ignore-end -->

<style>
.chart-container {
  margin-top: auto;
  width: 85%;
  margin-left: auto;
  margin-right: auto;
  padding-bottom: 8px;
}
.chart-label {
  font-size: 1.1rem;
  opacity: 0.4;
  text-align: center;
  margin-bottom: 4px;
}
.chart-inner {
  display: flex;
  gap: 6px;
}
.y-axis {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  font-size: 1.05rem;
  opacity: 0.4;
  text-align: right;
  padding: 0;
}
.chart-area {
  flex: 1;
  position: relative;
  border-left: 1px solid rgba(128,128,128,0.15);
  border-bottom: 1px solid rgba(128,128,128,0.15);
  height: 210px;
}
.chart-svg {
  width: 100%;
  height: 100%;
}
.chart-endpoint {
  position: absolute;
  bottom: -4px;
  right: 4px;
  color: #22c55e;
  font-weight: 700;
  font-size: 1.65rem;
}
.x-axis {
  display: flex;
  justify-content: space-between;
  font-size: 1.05rem;
  opacity: 0.35;
  padding-left: 40px;
  margin-top: 4px;
}
.slidev-layout {
  display: flex;
  flex-direction: column;
}
</style>

<!--
And, this has been a success too. Through telemetry and user feedback, especially
those people willing to give us full editor traces, we've been able to fix basically
all of our crashes.

Today, the crash rate per session is somewhere around 0.17%.

For comparison, the old TypeScript 6.0 server has about a 5% crash rate, so we're roughly 20x more
stable than the JS-based server ever was!
-->

---
layout: section
---

# Is it fast?


<!--
But of course, I think you all want to know the answer to the most important question: is it fast?
-->


---

# What people are saying

##

<!-- dprint-ignore-start -->
<div class="results-grid">
  <div class="result-card">
    <div class="company">Slack</div>
    <div class="quote">"Intellisense in VSCode was approaching often unusable with tsc because of how long it took to load; with tsgo it's usually working in seconds."</div>
    <div class="metric">CI typecheck: <strong>7.5 min → 1.25 min</strong><br>Merge queue: <strong>200s faster</strong></div>
  </div>
  <div class="result-card">
    <div class="company">Canva</div>
    <div class="quote">"Project diagnostics: ~58s → ~4.8s.<br>Show error: ~3.5s → ~600ms.<br>Autocomplete: ~2.5s → ~500ms."</div>
  </div>
  <div class="result-card">
    <div class="company">Miro</div>
    <div class="quote">"Typecheck of the main app went down from 200s to 45s.<br>Project diagnostics in IDEs: 42s → 11.5s."</div>
  </div>
  <div class="result-card">
    <div class="company">Vanta</div>
    <div class="quote">"We got a net ~5× improvement on type checking performance across the packages in our monorepo."</div>
  </div>
</div>
<!-- dprint-ignore-end -->

<style>
.results-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 20px;
  margin-top: 16px;
}
.result-card {
  border: 2px solid #475569;
  border-radius: 12px;
  padding: 18px 22px;
}
html.dark .result-card { background: #0f172a; border-color: #334155; }
html:not(.dark) .result-card { background: #f1f5f9; border-color: #94a3b8; }
.company {
  font-weight: 700;
  font-size: 1.2rem;
  margin-bottom: 10px;
  color: var(--slidev-theme-primary);
}
.quote {
  font-size: 1.05rem;
  line-height: 1.45;
  font-style: italic;
  opacity: 0.85;
  margin-bottom: 8px;
}
.metric {
  font-size: 0.9rem;
  line-height: 1.6;
  opacity: 0.7;
}
.metric strong {
  color: #4fc3f7;
}
</style>

<!--
These are real numbers from real companies who switched early.

Slack's merge queue got 200 seconds faster. Their CI typecheck went from
7.5 minutes to 1.25. Locally, typechecking used to take so long that
engineers wouldn't bother; they'd push and wait for CI.

Canva saw diagnostics drop from 58 seconds to under 5.

These are the kinds of improvements that change how people work.
-->

---

# What people are saying

##

<!-- dprint-ignore-start -->
<div class="posts-layout">
  <div class="posts-left">
    <SocialPost platform="bluesky" avatar="/img/avatars/tkdodo.jpg" name="Dominik 🔮" handle="@tkdodo.eu">
      <p>On the @sentry.io codebase:</p>
      <p>- tsc is 56s<br>- tsgo is 9s</p>
      <p>Use it, NOW 🔥</p>
      <template #reply>
        <SocialPost platform="bluesky" avatar="/img/avatars/tomhicks.jpg" name="Tom Hicks" handle="@hicksyfern.bsky.social" bare>
          <p>Yeah ours is about 2m vs 13s.</p>
          <p>We've been using it to compare results versus tsc and we've spotted no differences in many, many months.</p>
        </SocialPost>
      </template>
    </SocialPost>
    <SocialPost platform="twitter" avatar="/img/avatars/rozenmd.jpg" name="Max Rozen" handle="@RozenMD">
      <p>saved us like 6 mins per pipeline run IIRC</p>
    </SocialPost>
  </div>
  <div class="posts-right">
    <SocialPost platform="twitter" avatar="/img/avatars/abraguilera.jpg" name="Abraham Aguilera" handle="@abraguilera">
      <p>Just finished upgrading and running typecheck across 10 packages went from 5 min to ~5-10sec per package</p>
    </SocialPost>
    <SocialPost platform="bluesky" avatar="/img/avatars/danrosenwasser.jpg" name="Daniel Rosenwasser" handle="@danr.bsky.social">
      <p>An internal team just adopted tsgo (soon TypeScript 7) and told us they were able to shave off about 400 hours a month of waiting on CI builds.</p>
    </SocialPost>
  </div>
</div>
<!-- dprint-ignore-end -->

<style>
.posts-layout {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 16px;
  margin-top: 4px;
  align-items: start;
}
.posts-left {
  display: flex;
  flex-direction: column;
  gap: 12px;
}
.posts-right {
  display: flex;
  flex-direction: column;
  gap: 12px;
}
.posts-layout :deep(.social-post) {
  padding: 14px 18px;
  font-size: 0.9em;
}
</style>

<!--
And it's not just private feedback. People are posting about it publicly.

Dominik, maintainer of TanStack Query, ran it on Sentry's codebase: 56 seconds to 9.

Tom Hicks says theirs went from 2 minutes to 13 seconds, and they've been
comparing results against tsc for months with no differences.
-->


---

# Is it fast?

<!-- dprint-ignore-start -->
<div class="perf-chart">
  <div class="chart-header">
    <div class="project-label"></div>
    <div class="bar-labels">
      <span class="label-old">tsc</span>
      <span class="label-new">tsgo</span>
    </div>
  </div>
  <div class="chart-row vscode">
    <div class="project-name">VS Code<br><span class="loc">2.3M LoC</span></div>
    <div class="bars">
      <div class="bar-old"><span class="time old-time"></span></div>
      <div class="bar-new-container">
        <div class="bar-new"><span class="time new-time"></span></div>
        <div class="speedup-indicator">
          <div class="speedup-label"></div>
        </div>
      </div>
    </div>
  </div>
  <div class="chart-row sentry">
    <div class="project-name">Sentry<br><span class="loc">1.9M LoC</span></div>
    <div class="bars">
      <div class="bar-old"><span class="time old-time"></span></div>
      <div class="bar-new-container">
        <div class="bar-new"><span class="time new-time"></span></div>
        <div class="speedup-indicator">
          <div class="speedup-label"></div>
        </div>
      </div>
    </div>
  </div>
  <div class="chart-row grafana">
    <div class="project-name">Grafana<br><span class="loc">1.8M LoC</span></div>
    <div class="bars">
      <div class="bar-old"><span class="time old-time"></span></div>
      <div class="bar-new-container">
        <div class="bar-new"><span class="time new-time"></span></div>
        <div class="speedup-indicator">
          <div class="speedup-label"></div>
        </div>
      </div>
    </div>
  </div>
  <div class="chart-row bluesky">
    <div class="project-name">Bluesky<br><span class="loc">628K LoC</span></div>
    <div class="bars">
      <div class="bar-old"><span class="time old-time"></span></div>
      <div class="bar-new-container">
        <div class="bar-new"><span class="time new-time"></span></div>
        <div class="speedup-indicator">
          <div class="speedup-label"></div>
        </div>
      </div>
    </div>
  </div>
  <div class="chart-row playwright">
    <div class="project-name">Playwright<br><span class="loc">528K LoC</span></div>
    <div class="bars">
      <div class="bar-old"><span class="time old-time"></span></div>
      <div class="bar-new-container">
        <div class="bar-new"><span class="time new-time"></span></div>
        <div class="speedup-indicator">
          <div class="speedup-label"></div>
        </div>
      </div>
    </div>
  </div>
  <div class="chart-row tldraw">
    <div class="project-name">tldraw<br><span class="loc">345K LoC</span></div>
    <div class="bars">
      <div class="bar-old"><span class="time old-time"></span></div>
      <div class="bar-new-container">
        <div class="bar-new"><span class="time new-time"></span></div>
        <div class="speedup-indicator">
          <div class="speedup-label"></div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- dprint-ignore-end -->

Best of 3 runs, on an AMD Ryzen AI 9 HX 370, 24 cores, 32 GB RAM, Arch Linux _(btw)_

<style>
.perf-chart {
  max-width: 900px;
  margin: 0 auto;
  font-family: var(--slidev-code-font-family);
}
.chart-header {
  display: flex;
  align-items: center;
  height: 30px;
}
.project-label { width: 100px; }
.bar-labels {
  flex: 1;
  display: flex;
  gap: 20px;
  font-size: 14px;
  font-weight: bold;
}
.label-old { color: #ff9500; }
.label-new { color: #007acc; }
.chart-row {
  display: flex;
  align-items: center;
  margin-bottom: 8px;
  height: 52px;
}
.project-name {
  width: 100px;
  text-align: right;
  padding-right: 12px;
  font-weight: bold;
  font-size: 16px;
}
.loc {
  font-size: 12px;
  font-weight: normal;
  opacity: 0.7;
  display: block;
  margin-top: 2px;
}
.bars {
  flex: 1;
  position: relative;
  height: 50px;
}
.bar-old, .bar-new {
  height: 24px;
  border-radius: 4px;
  display: flex;
  align-items: center;
  justify-content: flex-end;
  padding-right: 4px;
  margin-bottom: 3px;
  min-width: 50px;
  flex-shrink: 0;
}
.bar-new-container {
  display: flex;
  height: 24px;
  margin-bottom: 3px;
  position: relative;
}
.bar-old {
  background: linear-gradient(90deg, #ffb347, #ff9500);
  opacity: 0.9;
}
.bar-new {
  background: linear-gradient(90deg, #4fc3f7, #007acc);
}
.time {
  color: white;
  font-weight: bold;
  font-size: 14px;
  text-shadow: 0 1px 2px rgba(0,0,0,0.5);
  white-space: nowrap;
}
.speedup-indicator {
  flex: 0 0 auto;
  display: flex;
  align-items: center;
  margin-left: 10px;
}
.speedup-label {
  font-size: 15px;
  font-weight: bold;
  color: var(--slidev-theme-primary);
  white-space: nowrap;
}
.vscode .bar-old { width: 100%; }
.vscode .bar-new { width: calc(10.555 / 125.69 * 100%); }
.vscode .old-time::after { content: "125.7s"; }
.vscode .new-time::after { content: "10.6s"; }
.vscode .speedup-label::after { content: "11.9x"; }
.sentry .bar-old { width: 100%; }
.sentry .bar-new { width: calc(15.695 / 139.82 * 100%); }
.sentry .old-time::after { content: "139.8s"; }
.sentry .new-time::after { content: "15.7s"; }
.sentry .speedup-label::after { content: "8.9x"; }
.grafana .bar-old { width: 100%; }
.grafana .bar-new { width: calc(16.611 / 113.86 * 100%); }
.grafana .old-time::after { content: "113.9s"; }
.grafana .new-time::after { content: "16.6s"; }
.grafana .speedup-label::after { content: "6.9x"; }
.bluesky .bar-old { width: 100%; }
.bluesky .bar-new { width: calc(2.808 / 24.32 * 100%); }
.bluesky .old-time::after { content: "24.3s"; }
.bluesky .new-time::after { content: "2.8s"; }
.bluesky .speedup-label::after { content: "8.7x"; }
.playwright .bar-old { width: 100%; }
.playwright .bar-new { width: calc(1.472 / 12.80 * 100%); }
.playwright .old-time::after { content: "12.8s"; }
.playwright .new-time::after { content: "1.47s"; }
.playwright .speedup-label::after { content: "8.7x"; }
.tldraw .bar-old { width: 100%; }
.tldraw .bar-new { width: calc(1.457 / 11.16 * 100%); }
.tldraw .old-time::after { content: "11.2s"; }
.tldraw .new-time::after { content: "1.46s"; }
.tldraw .speedup-label::after { content: "7.7x"; }
</style>

<!--
Yes! Though, not every codebase can get that 10x.
-->

---

# Memory usage

<!-- dprint-ignore-start -->
<div class="perf-chart">
  <div class="chart-header">
    <div class="project-label"></div>
    <div class="bar-labels">
      <span class="label-old">tsc</span>
      <span class="label-new">tsgo</span>
    </div>
  </div>
  <div class="chart-row vscode">
    <div class="project-name">VS Code<br><span class="loc">2.3M LoC</span></div>
    <div class="bars">
      <div class="bar-old"><span class="time old-time"></span></div>
      <div class="bar-new-container">
        <div class="bar-new"><span class="time new-time"></span></div>
        <div class="speedup-indicator">
          <div class="speedup-label"></div>
        </div>
      </div>
    </div>
  </div>
  <div class="chart-row sentry">
    <div class="project-name">Sentry<br><span class="loc">1.9M LoC</span></div>
    <div class="bars">
      <div class="bar-old"><span class="time old-time"></span></div>
      <div class="bar-new-container">
        <div class="bar-new"><span class="time new-time"></span></div>
        <div class="speedup-indicator">
          <div class="speedup-label"></div>
        </div>
      </div>
    </div>
  </div>
  <div class="chart-row grafana">
    <div class="project-name">Grafana<br><span class="loc">1.8M LoC</span></div>
    <div class="bars">
      <div class="bar-old"><span class="time old-time"></span></div>
      <div class="bar-new-container">
        <div class="bar-new"><span class="time new-time"></span></div>
        <div class="speedup-indicator">
          <div class="speedup-label"></div>
        </div>
      </div>
    </div>
  </div>
  <div class="chart-row bluesky">
    <div class="project-name">Bluesky<br><span class="loc">628K LoC</span></div>
    <div class="bars">
      <div class="bar-old"><span class="time old-time"></span></div>
      <div class="bar-new-container">
        <div class="bar-new"><span class="time new-time"></span></div>
        <div class="speedup-indicator">
          <div class="speedup-label"></div>
        </div>
      </div>
    </div>
  </div>
  <div class="chart-row playwright">
    <div class="project-name">Playwright<br><span class="loc">528K LoC</span></div>
    <div class="bars">
      <div class="bar-old"><span class="time old-time"></span></div>
      <div class="bar-new-container">
        <div class="bar-new"><span class="time new-time"></span></div>
        <div class="speedup-indicator">
          <div class="speedup-label"></div>
        </div>
      </div>
    </div>
  </div>
  <div class="chart-row tldraw">
    <div class="project-name">tldraw<br><span class="loc">345K LoC</span></div>
    <div class="bars">
      <div class="bar-old"><span class="time old-time"></span></div>
      <div class="bar-new-container">
        <div class="bar-new"><span class="time new-time"></span></div>
        <div class="speedup-indicator">
          <div class="speedup-label"></div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- dprint-ignore-end -->

Best of 3 runs, on an AMD Ryzen AI 9 HX 370, 24 cores, 32 GB RAM, Arch Linux _(btw)_

<style>
.perf-chart {
  max-width: 900px;
  margin: 0 auto;
  font-family: var(--slidev-code-font-family);
}
.chart-header {
  display: flex;
  align-items: center;
  height: 30px;
}
.project-label { width: 100px; }
.bar-labels {
  flex: 1;
  display: flex;
  gap: 20px;
  font-size: 14px;
  font-weight: bold;
}
.label-old { color: #ff9500; }
.label-new { color: #007acc; }
.chart-row {
  display: flex;
  align-items: center;
  margin-bottom: 8px;
  height: 52px;
}
.project-name {
  width: 100px;
  text-align: right;
  padding-right: 12px;
  font-weight: bold;
  font-size: 16px;
}
.loc {
  font-size: 12px;
  font-weight: normal;
  opacity: 0.7;
  display: block;
  margin-top: 2px;
}
.bars {
  flex: 1;
  position: relative;
  height: 50px;
}
.bar-old, .bar-new {
  height: 24px;
  border-radius: 4px;
  display: flex;
  align-items: center;
  justify-content: flex-end;
  padding-right: 4px;
  margin-bottom: 3px;
  min-width: 50px;
  flex-shrink: 0;
}
.bar-new-container {
  display: flex;
  height: 24px;
  margin-bottom: 3px;
  position: relative;
}
.bar-old {
  background: linear-gradient(90deg, #ffb347, #ff9500);
  opacity: 0.9;
}
.bar-new {
  background: linear-gradient(90deg, #4fc3f7, #007acc);
}
.time {
  color: white;
  font-weight: bold;
  font-size: 14px;
  text-shadow: 0 1px 2px rgba(0,0,0,0.5);
  white-space: nowrap;
}
.speedup-indicator {
  flex: 0 0 auto;
  display: flex;
  align-items: center;
  margin-left: 10px;
}
.speedup-label {
  font-size: 15px;
  font-weight: bold;
  color: var(--slidev-theme-primary);
  white-space: nowrap;
}
.vscode .bar-old { width: calc(5295791 / 5295791 * 100%); }
.vscode .bar-new { width: calc(4318223 / 5295791 * 100%); }
.vscode .old-time::after { content: "5.2 GB"; }
.vscode .new-time::after { content: "4.2 GB"; }
.vscode .speedup-label::after { content: "-18%"; }
.sentry .bar-old { width: calc(5004546 / 5295791 * 100%); }
.sentry .bar-new { width: calc(4682855 / 5295791 * 100%); }
.sentry .old-time::after { content: "4.9 GB"; }
.sentry .new-time::after { content: "4.6 GB"; }
.sentry .speedup-label::after { content: "-6%"; }
.grafana .bar-old { width: calc(5072797 / 5295791 * 100%); }
.grafana .bar-new { width: calc(5195826 / 5295791 * 100%); }
.grafana .old-time::after { content: "5.0 GB"; }
.grafana .new-time::after { content: "5.1 GB"; }
.grafana .speedup-label::after { content: "+2% 😢"; }
.bluesky .bar-old { width: calc(1845516 / 5295791 * 100%); }
.bluesky .bar-new { width: calc(1362682 / 5295791 * 100%); }
.bluesky .old-time::after { content: "1.8 GB"; }
.bluesky .new-time::after { content: "1.3 GB"; }
.bluesky .speedup-label::after { content: "-26%"; }
.playwright .bar-old { width: calc(1006895 / 5295791 * 100%); }
.playwright .bar-new { width: calc(895461 / 5295791 * 100%); }
.playwright .old-time::after { content: "1.0 GB"; }
.playwright .new-time::after { content: "0.9 GB"; }
.playwright .speedup-label::after { content: "-11%"; }
.tldraw .bar-old { width: calc(646432 / 5295791 * 100%); }
.tldraw .bar-new { width: calc(550219 / 5295791 * 100%); }
.tldraw .old-time::after { content: "0.6 GB"; }
.tldraw .new-time::after { content: "0.5 GB"; }
.tldraw .speedup-label::after { content: "-15%"; }
</style>

<!--
Memory usage is also improved across the board, though the gains are more
modest than speed. Bluesky sees a 26% reduction, VS Code 19%. Grafana is
roughly the same. The key point: we get 7-12x faster without using more memory.
-->

---
layout: section
---

# Why is it faster?

---
src: ./pages/concurrency.md
---


---
layout: section
---

# 💻

<!-- Now, let's take a look at all of this in action. Fingers crossed things work as I try to do this live! -->

---
layout: section
---

# TypeScript 6

## The bridge release

<!--
But if course, while we were busy working on TypeScript 7, we still had
to ship TypeScript 6!

We decided to make 6.0 a bridge release, and ship TypeScript 7, a full
major version bump, as the Go release. That way we could make changes in 6
to align with what we thought we'd want in 7, allowing people to upgrade,
get ready, and switch to 7 afterward.
-->

---
layout: image-right
image: /img/bridge.jpg
---

# Moving forward

<v-clicks>

- New, sensible defaults
- Deprecations of underused/finnicky features
- A new flag to help prepare for 7.0's deterministic type ordering

</v-clicks>

<!--
The kinds of changes we put into 6.0 are roughly split into three categories,
CLICK new sensible defaults, CLICK deprecations and removals of underused or hard to port issues,
CLICK plus an all new flag.
-->

---
layout: image-right
image: /img/bridge.jpg
---

# New defaults

##

- `strict` is now `true` by default 🎉
- `target` defaults to current-year ES (i.e. `es2025`)
- `module` defaults to `esnext`
- `rootDir` defaults to `.`
- `types` defaults to `[]`
- `noUncheckedSideEffectImports` is `true`

<!--
The all new defaults are a big change, but one we're really happy with.
Of course, the big one is that strict defaults to true!

But we also made some further modernizations like upping our default targets,
and flipping some defaults to make strange behavior stand out more.
-->

---
layout: image-right
image: /img/bridge.jpg
---

# Deprecations and removals

##


- `target: es5`, `downlevelIteration`
- `moduleResolution: node10` (aka `node`)
- `moduleResolution: classic`
- `module: amd`, `umd`, `system`
- `outFile`
- `baseUrl` as a lookup root
- `esModuleInterop: false`, `alwaysStrict: false`
- `no-default-lib` directive
- Legacy `module` namespace syntax


<!--
We also deprecated a whole bunch of stuff too! Largely, these are motivated by these features
being annoying to do efficiently in Go, or just that they are a lot of code and are underused.

There are few of these that are quite interesting.
-->

---

# Why remove `no-default-lib`?

## 

<!-- dprint-ignore-start -->
<div class="load-layout">
  <div class="file-tree">
    <div class="tree-item root">📁 my-app/</div>
    <div class="tree-item indent1" :class="{ loaded: $clicks >= 5, dep: true }">├── 📦 node_modules/</div>
    <div class="tree-item indent2" :class="{ loaded: $clicks >= 5, dep: true }">├── express/index.d.ts</div>
    <div class="tree-item indent2" :class="{ loaded: $clicks >= 5, dep: true }">└── lodash/index.d.ts</div>
    <div class="tree-item indent1" :class="{ loaded: $clicks >= 3, src: true }">├── 📁 src/</div>
    <div class="tree-item indent2" :class="{ loaded: $clicks >= 4, src: true }">├── api.ts</div>
    <div class="tree-item indent2" :class="{ loaded: $clicks >= 5, src: true }">├── helpers.ts</div>
    <div class="tree-item indent2" :class="{ loaded: $clicks >= 3, src: true }">├── index.ts</div>
    <div class="tree-item indent2" :class="{ loaded: $clicks >= 5, src: true }">├── types.ts</div>
    <div class="tree-item indent2" :class="{ loaded: $clicks >= 4, src: true }">└── utils.ts</div>
    <div class="tree-item indent1" :class="{ loaded: $clicks >= 2, lib: true }">├── lib.d.ts</div>
    <div class="tree-item indent1" :class="{ loaded: $clicks >= 5, lib: true }">├── lib.dom.d.ts</div>
    <div class="tree-item indent1" :class="{ loaded: $clicks >= 1 }">└── tsconfig.json</div>
  </div>
  <div class="pragma-example">
    <div v-click="6" class="pragma-code">
      <div class="pragma-filename">src/service-worker.ts</div>
      <pre class="pragma-pre"><code>/// &lt;reference no-default-lib="true" /&gt;
/// &lt;reference lib="esnext" /&gt;
/// &lt;reference lib="webworker" /&gt;
const worker = self as unknown
    as ServiceWorkerGlobalScope;
worker.addEventListener('install', ...);</code></pre>
    </div>
    <div v-click="7" class="pragma-problem">
      <div class="pragma-filename problem-filename">What no-default-lib actually means</div>
      <pre class="pragma-pre problem-pre"><code>// Despite its name:
// NOT "don't include the default lib"
// It means "THIS file is the root lib,
// start lib inclusion here"
//
// Removed in 6.0</code></pre>
    </div>
  </div>
</div>
<!-- Hack: ensure Slidev tracks all clicks -->
<span v-click="1"></span><span v-click="2"></span><span v-click="3"></span><span v-click="4"></span><span v-click="5"></span><span v-click="6"></span><span v-click="7"></span>
<!-- dprint-ignore-end -->

<style>
.load-layout {
  display: flex;
  gap: 40px;
  margin-top: 10px;
}
.file-tree {
  flex: 1;
  font-family: var(--slidev-code-font-family);
  font-size: 0.95rem;
  line-height: 2;
}
.tree-item {
  opacity: 0.25;
  transition: opacity 0.5s ease, color 0.5s ease;
  white-space: nowrap;
}
.tree-item.root {
  opacity: 1;
  font-weight: 700;
}
.tree-item.loaded {
  opacity: 1;
}
.indent1 { padding-left: 1.2em; }
.indent2 { padding-left: 2.4em; }
.tree-item.lib.loaded { color: #6366f1; }
.tree-item.src.loaded { color: #16a34a; }
.tree-item.dep.loaded { color: #b45309; }
.pragma-example {
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 16px;
  padding-top: 20px;
}
.pragma-filename {
  font-family: var(--slidev-code-font-family);
  font-size: 0.75rem;
  font-weight: 700;
  opacity: 0.7;
  margin-bottom: 4px;
  color: #6366f1;
}
.problem-filename {
  color: #dc2626;
}
.pragma-pre {
  margin: 0;
  padding: 12px 14px;
  border-radius: 10px;
  font-size: 0.8rem;
  line-height: 1.6;
  border: 2px solid #475569;
}
html.dark .pragma-pre { background: #1e293b; }
html:not(.dark) .pragma-pre { background: #f1f5f9; border-color: #94a3b8; }
.problem-pre {
  border-color: #ef4444;
}
html.dark .problem-pre { background: #450a0a; }
html:not(.dark) .problem-pre { background: #fef2f2; }
.pragma-code code, .pragma-problem code {
  font-family: var(--slidev-code-font-family);
}
</style>

<!--
To understand why we removed no-default-lib, let's look at how program loading works.

CLICK We start by reading tsconfig.json. CLICK From that, we know the default lib is lib.d.ts, so we start loading it.

3 CLICKS As we load concurrently, we find more and more files, maybe even we find the DOM types.

CLICK Now, imagine you encounter a file like this. What does this mean?

CLICK Despite its name, no-default-lib does NOT mean "don't include the default lib". It means "THIS file IS the root lib", start lib inclusion over again, a weird quirk of the code.

But, we're loading concurrently. How would we do that? It only worked before because we were single threaded.

I didn't want to have to solve this problem, so we just removed no-default-lib.
-->

---

# Why remove module transforms?

##

<!-- dprint-ignore-start -->
<div class="emit-examples">
  <div class="emit-input">
    <div class="emit-label">Your code</div>
    <pre class="emit-code"><code>import { log } from "./utils";
class Greeter {
  greet = () => `Hello!`;
}</code></pre>
  </div>
  <div v-click class="emit-output removed">
    <div class="emit-label">--module system</div>
    <pre class="emit-code"><code>System.register(["./utils"],
  function (exports_1, context_1) {
  "use strict";
  var utils_1, Greeter;
  var __moduleName = context_1
    &amp;&amp; context_1.id;
  return {
    setters: [function (utils_1_1) {
      utils_1 = utils_1_1;
    }],
    execute: function () {
      Greeter = class Greeter {
        constructor() {
          this.greet = () => `Hello!`;
        }
      };
      exports_1("Greeter", Greeter);
    }
  };
});</code></pre>
  </div>
  <div v-click class="emit-output removed">
    <div class="emit-label">--outFile bundle.js</div>
    <pre class="emit-code"><code>// utils.js
System.register("utils", [],
  function (exports_1) {
  // ...
});
// greeter.js
System.register("greeter",
  ["utils"],
  function (exports_1, context_1) {
  // ...
});
// app.js
System.register("app",
  ["greeter"],
  function (exports_1, context_1) {
  // ...
});</code></pre>
    <div class="outfile-note">TypeScript is a bundler???</div>
  </div>
</div>
<!-- dprint-ignore-end -->

<style>
.emit-examples {
  display: flex;
  gap: 16px;
  margin-top: 8px;
  height: 85%;
  align-items: flex-start;
}
.emit-input {
  flex: 1;
}
.emit-output {
  flex: 1;
}
.emit-label {
  font-family: var(--slidev-code-font-family);
  font-size: 13px;
  letter-spacing: 1.5px;
  opacity: 0.7;
  margin-bottom: 4px;
  font-weight: 700;
}
.emit-output.removed .emit-label {
  color: #dc2626;
  opacity: 1;
}
html.dark .emit-output.removed .emit-label { color: #ef4444; }
.emit-code {
  margin: 0;
  padding: 10px 12px;
  border-radius: 10px;
  font-size: 0.62rem;
  line-height: 1.4;
  border: 2px solid #94a3b8;
  overflow: hidden;
}
html.dark .emit-code { background: #1e293b; border-color: #475569; }
html:not(.dark) .emit-code { background: #f1f5f9; }
.emit-output.removed .emit-code {
  border-color: #dc2626;
}
html.dark .emit-output.removed .emit-code {
  border-color: #ef4444;
  background: rgba(239, 68, 68, 0.08);
}
html:not(.dark) .emit-output.removed .emit-code {
  background: #fef2f2;
}
.emit-code code {
  font-family: var(--slidev-code-font-family);
}
.outfile-note {
  font-size: 0.8rem;
  font-weight: 700;
  color: #dc2626;
  text-align: center;
  margin-top: 6px;
  font-style: italic;
}
html.dark .outfile-note { color: #ef4444; }
</style>

<!--
Module transformation was another place we made cut.

Take four lines of modern TypeScript.

CLICK: with module=system, TypeScript wraps it in System.register with setters
and an execute function. This is a module system that predates ESM.

CLICK: and with outFile, TypeScript acted as a bundler. It concatenated all of
your modules into a single file, each wrapped in System.register with a name.
These days, nobody does this; there are bundlers that can do this better, and
removing it greatly simplifies many aspects of our code.
-->

---

# Why remove ES5?

##

<!-- dprint-ignore-start -->
<div class="es5-layout">
  <div class="es5-input">
    <div class="es5-label">Your code</div>
    <pre class="es5-code input-code"><code>async function fetchAll(urls: string[]) {
  const results = [];
  try {
    for (const url of urls) {
      const res = await fetch(url);
      results.push(await res.json());
    }
    return results;
  } catch (err) {
    console.error("Failed:", err);
    throw err;
  }
}</code></pre>
    <div v-click="1" class="es2015-section">
      <div class="es5-label es2015-label">--target es2015</div>
      <pre class="es5-code es2015-code"><code>function fetchAll(urls) {
  return __awaiter(this, void 0,
    void 0, function* () {
    const results = [];
    try {
      for (const url of urls) {
        const res = yield fetch(url);
        results.push(yield res.json());
      }
      return results;
    } catch (err) {
      console.error("Failed:", err);
      throw err;
    }
  });
}</code></pre>
    </div>
  </div>
  <div v-click="2" class="es5-output">
    <div class="es5-label removed-label">--target es5</div>
    <pre class="es5-code output-code"><code>function fetchAll(urls) {
  return __awaiter(this, void 0, void 0, function () {
    var results, _i, urls_1, url, res, _a, _b, err_1;
    return __generator(this, function (_c) {
      switch (_c.label) {
        case 0: results = []; _c.label = 1;
        case 1:
          _c.trys.push([1, 7, , 8]);
          _i = 0, urls_1 = urls; _c.label = 2;
        case 2:
          if (!(_i &lt; urls_1.length)) return [3, 6];
          url = urls_1[_i];
          return [4 /*yield*/, fetch(url)];
        case 3:
          res = _c.sent();
          _b = (_a = results).push;
          return [4 /*yield*/, res.json()];
        case 4:
          _b.apply(_a, [_c.sent()]); _c.label = 5;
        case 5: _i++; return [3 /*break*/, 2];
        case 6: return [2 /*return*/, results];
        case 7:
          err_1 = _c.sent();
          console.error("Failed:", err_1);
          throw err_1;
        case 8: return [2 /*return*/];
      }
    });
  });
}</code></pre>
  </div>
</div>
<!-- dprint-ignore-end -->

<style>
.es5-layout {
  display: flex;
  gap: 24px;
  margin-top: 4px;
}
.es5-input {
  flex: 1;
  display: flex;
  flex-direction: column;
}
.es5-output {
  flex: 1;
  display: flex;
  flex-direction: column;
}
.es5-label {
  font-family: var(--slidev-code-font-family);
  font-size: 13px;
  letter-spacing: 1.5px;
  opacity: 0.7;
  margin-bottom: 4px;
  font-weight: 700;
}
.removed-label {
  color: #dc2626;
  opacity: 1;
}
html.dark .removed-label { color: #ef4444; }
.es5-code {
  margin: 0;
  padding: 8px 10px;
  border-radius: 10px;
  font-size: 0.55rem;
  line-height: 1.3;
  border: 2px solid #94a3b8;
  overflow: hidden;
}
html.dark .es5-code { background: #1e293b; border-color: #475569; }
html:not(.dark) .es5-code { background: #f1f5f9; }
.output-code {
  border-color: #dc2626;
}
html.dark .output-code {
  border-color: #ef4444;
  background: rgba(239, 68, 68, 0.08);
}
html:not(.dark) .output-code {
  background: #fef2f2;
}
.es5-code code {
  font-family: var(--slidev-code-font-family);
}
.es2015-section {
  margin-top: 8px;
}
.es2015-label {
  color: #b45309;
  opacity: 1;
}
html.dark .es2015-label { color: #f59e0b; }
.es2015-code {
  border-color: #b45309;
}
html.dark .es2015-code {
  border-color: #f59e0b;
  background: rgba(245, 158, 11, 0.08);
}
html:not(.dark) .es2015-code {
  background: #fffbeb;
  border-color: #b45309;
}
</style>

<!--
Here's another reasonably simple piece of code; an async function that fetches a bunch of URLs.

CLICK: With ES2015, it's not bad. async/await becomes a generator function
with yield, wrapped in __awaiter. The structure is still recognizable; you
can still read it.

CLICK: But drop to ES5 and generators don't exist either. Now it's some kind of state machine? If I thought hard enough I could probably make sense of it, but I know from experience that trying to write the code that actually turns the original code into this code is not trivial The code to do this and all of the other ES5 stuff is substantial, something like 8,000 lines of code plus other infrastructure.

Is it worth porting this over code to target runtimes from more than a decade ago? We thought not, and decided to deprecate this in 6.0 and not port it to 7.0
-->

---

# Why remove `--alwaysStrict`?

##

"Sloppy":

```js twoslash
// @alwaysStrict: false
// @moduleDetection: legacy
var arguments;
function doSomething() {
  arguments = [];
  with (Math) { log("PI is", PI); }
}
```

Strict:

```js twoslash
// @alwaysStrict: true
var arguments;
function doSomething() {
  arguments = [];
  with (Math) {	log("PI is", PI); }
}
```

<!--
Another flag we deprecated based on feedback from the porting process was alwaysStrict.

If you aren't aware, JavaScript has a "strict" mode, which disallows strange behaviors.

For example, in strict mode, you're not allowed to use "arguments" as a variable name,
since it's a special name that refers to the arguments passed to a function.

You're also not allowed to use "with" statements, though those are already banned in TypeScript files as they break type checking.
-->

---

# AST reuse

##

<!-- dprint-ignore-start -->
<div class="reuse-slide">
  <div class="programs-col">
    <div class="program-box prog-a">
      <div class="prog-header">Program A</div>
      <pre class="tsconfig-json"><code>{
  "compilerOptions": {
    "alwaysStrict": <span class="val-false">false</span>
  },
  "files": ["src/index.ts"]
}</code></pre>
    </div>
    <div class="program-box prog-b">
      <div class="prog-header">Program B</div>
      <pre class="tsconfig-json"><code>{
  "compilerOptions": {
    "alwaysStrict": <span class="val-true">true</span>
  },
  "files": ["src/index.ts"]
}</code></pre>
    </div>
  </div>
  <div class="arrows-col">
    <svg viewBox="0 0 80 260" class="arrow-svg">
      <defs>
        <marker id="ah" markerWidth="8" markerHeight="6" refX="8" refY="3" orient="auto">
          <path d="M0,0 L8,3 L0,6 Z" fill="#64748b" />
        </marker>
        <marker id="ah-green" markerWidth="8" markerHeight="6" refX="8" refY="3" orient="auto">
          <path d="M0,0 L8,3 L0,6 Z" fill="#22c55e" />
        </marker>
      </defs>
      <line x1="0" y1="65" x2="70" y2="65" stroke="#64748b" stroke-width="2" marker-end="url(#ah)" :style="{ transition: 'all 0.6s ease', opacity: $clicks >= 1 ? 0 : 1 }" />
      <line v-if="$clicks >= 1" x1="0" y1="65" x2="70" y2="155" stroke="#22c55e" stroke-width="2" marker-end="url(#ah-green)" style="transition: opacity 0.6s ease;" />
      <line x1="0" y1="195" x2="70" y2="195" stroke="#64748b" stroke-width="2" marker-end="url(#ah)" style="transition: all 0.6s ease;" />
    </svg>
  </div>
  <div class="asts-col">
    <div class="ast-box ast-sloppy" :class="{ 'ast-hidden': $clicks >= 1 }">
      <div class="ast-header sloppy-header">AST <span class="ast-mode">(sloppy)</span></div>
      <div class="ast-content">
        <div class="ast-file">src/index.ts</div>
        <div class="ast-tree">
          <div class="ast-node">SourceFile</div>
          <div class="ast-node indent">├ FunctionDecl</div>
          <div class="ast-node indent">├ VarStatement</div>
          <div class="ast-node indent">└ ...</div>
        </div>
        <div class="ast-diag diag-ok">No strict-mode diagnostics</div>
      </div>
    </div>
    <div class="ast-box ast-strict" :class="{ 'ast-shared': $clicks >= 1 }">
      <div class="ast-header" :class="$clicks >= 1 ? 'shared-header' : 'strict-header'">
        <span v-if="$clicks < 1">AST <span class="ast-mode">(strict)</span></span>
        <span v-else>AST <span class="ast-mode">(shared, always strict)</span></span>
      </div>
      <div class="ast-content">
        <div class="ast-file">src/index.ts</div>
        <div class="ast-tree">
          <div class="ast-node">SourceFile <span class="node-flag flag-on">strict</span></div>
          <div class="ast-node indent">├ FunctionDecl</div>
          <div class="ast-node indent">├ VarStatement</div>
          <div class="ast-node indent">└ ...</div>
        </div>
        <div class="ast-diag diag-err">TS1100: <code>"arguments"</code> invalid in strict</div>
      </div>
    </div>
  </div>
</div>
<span v-click="1"></span>
<!-- dprint-ignore-end -->

<style>
.reuse-slide {
  display: grid;
  grid-template-columns: 1fr 80px 1fr;
  align-items: center;
  justify-items: center;
  gap: 0;
  height: 85%;
  margin-top: 8px;
}
.programs-col {
  display: flex;
  flex-direction: column;
  gap: 16px;
  justify-self: end;
}
.program-box {
  border: 2px solid #475569;
  border-radius: 10px;
  padding: 10px 14px;
  min-width: 240px;
}
html.dark .program-box { background: #1e293b; }
html:not(.dark) .program-box { background: #f1f5f9; border-color: #94a3b8; }
.prog-header {
  font-weight: 700;
  font-size: 0.85rem;
  margin-bottom: 6px;
  color: var(--slidev-theme-primary);
}
.tsconfig-json {
  margin: 0;
  padding: 6px 8px;
  border-radius: 6px;
  font-size: 0.62rem;
  line-height: 1.35;
  border: 1px solid rgba(128,128,128,0.2);
  font-family: var(--slidev-code-font-family);
}
html.dark .tsconfig-json { background: #0f172a; }
html:not(.dark) .tsconfig-json { background: #fff; }
.tsconfig-json code { font-family: var(--slidev-code-font-family); }
.val-true { color: #22c55e; font-weight: 700; }
.val-false { color: #ef4444; font-weight: 700; }
.arrows-col {
  display: flex;
  align-items: center;
  justify-content: center;
}
.arrow-svg {
  width: 80px;
  height: 260px;
  overflow: visible;
}
.arrow-svg line {
  transition: all 0.6s ease;
}
.asts-col {
  display: flex;
  flex-direction: column;
  gap: 16px;
  justify-self: start;
}
.ast-box {
  border-radius: 10px;
  padding: 10px 14px;
  min-width: 240px;
  transition: all 0.5s ease;
}
.ast-strict {
  border: 2px solid #22c55e;
}
html.dark .ast-strict { background: #14532d; }
html:not(.dark) .ast-strict { background: #f0fdf4; }
.ast-strict.ast-shared {
  box-shadow: 0 0 16px rgba(34, 197, 94, 0.3);
}
.ast-sloppy {
  border: 2px solid #ef4444;
}
html.dark .ast-sloppy { background: #450a0a; }
html:not(.dark) .ast-sloppy { background: #fef2f2; }
.ast-sloppy.ast-hidden {
  opacity: 0.15;
  transform: scale(0.95);
  border-color: #6b7280;
  filter: grayscale(1);
}
html.dark .ast-sloppy.ast-hidden { background: #1e293b; }
html:not(.dark) .ast-sloppy.ast-hidden { background: #f1f5f9; }
.ast-header {
  font-weight: 700;
  font-size: 0.8rem;
  margin-bottom: 4px;
}
.strict-header { color: #22c55e; }
.sloppy-header { color: #ef4444; }
.shared-header { color: #22c55e; }
.ast-mode {
  font-weight: 400;
  opacity: 0.7;
  font-size: 0.7rem;
}
.ast-content {
  display: flex;
  flex-direction: column;
  gap: 4px;
}
.ast-file {
  font-family: var(--slidev-code-font-family);
  font-size: 0.65rem;
  padding: 2px 8px;
  border-radius: 4px;
  background: rgba(128,128,128,0.1);
}
.ast-detail {
  font-size: 0.6rem;
  opacity: 0.7;
  padding-left: 2px;
}
.ast-tree {
  display: flex;
  flex-direction: column;
  gap: 1px;
  margin: 2px 0;
}
.ast-node {
  font-family: var(--slidev-code-font-family);
  font-size: 0.58rem;
  opacity: 0.6;
  white-space: nowrap;
}
.ast-node.indent {
  padding-left: 12px;
  opacity: 0.4;
}
.node-flag {
  font-size: 0.5rem;
  padding: 1px 5px;
  border-radius: 3px;
  font-weight: 700;
  margin-left: 4px;
  vertical-align: middle;
}
.node-flag.flag-on {
  color: #22c55e;
  background: rgba(34, 197, 94, 0.15);
  border: 1px solid rgba(34, 197, 94, 0.3);
}
.ast-diag {
  font-family: var(--slidev-code-font-family);
  font-size: 0.55rem;
  padding: 3px 6px;
  border-radius: 4px;
  line-height: 1.3;
}
.ast-diag code {
  font-size: 0.55rem;
}
.diag-err {
  color: #fca5a5;
  background: rgba(239, 68, 68, 0.15);
  border-left: 3px solid #ef4444;
}
html:not(.dark) .diag-err {
  color: #dc2626;
  background: rgba(239, 68, 68, 0.08);
}
.diag-ok {
  color: #86efac;
  background: rgba(34, 197, 94, 0.1);
  border-left: 3px solid #22c55e;
}
html:not(.dark) .diag-ok {
  color: #16a34a;
  background: rgba(34, 197, 94, 0.06);
}
</style>

<!--
One side effect of strict mode is that the AST and the errors it contains might be different depending on the flag. The way the binder looks at thing changes based on whether or not the code is strict, might declare symbols different, and it then emits different errors.

This means that if you have two tsconfigs with two different alwaysStrict set, we will actually have the same file in memory twice, just slightly different.

CLICK If we instead drop the alwaysStrict flag, we don't need to duplicate any ASTs anymore!

After some previous work, this flag was the only blocker to near perfect AST reuse, and allowed us to greatly simplify how we cache files in the language server.
-->

---
layout: section
---

# `--stableTypeOrdering`

## a new flag in 6.0??

<!--
Shockingly, we actually _added_ a flag to TypeScript 6, despite it seeming like we're only removing things. This flag changes the behavior of one of the more mysterious details about how TypeScript works internally.
-->

---

# Internal orderings

## 

<br>
<br>

<div class="type-definition">
<span class="code-text">type T =
<span v-click="1">string</span>
<span v-click="2"> | Promise&lt;T&gt;</span>
<span v-click="3"> | Map&lt;K, V&gt;</span>
<span v-click="4"> | [A, B][]</span>
<span v-click="5"> | undefined</span>
</span>
</div>

<br>

<div class="union-array">
  <div class="array-bracket">{</div>
  <div class="type-slots">
    <div v-motion v-click="1" :initial="{ opacity: 0, scale: 0 }" :enter="{ opacity: 1, scale: 1, x: 0 }" :click-5="{ x: 160, transition: { delay: 200 } }" class="type-box">
      <code>string</code>
      <span class="type-id">id: 3</span>
    </div>
    <div v-motion v-click="2" :initial="{ opacity: 0, scale: 0 }" :enter="{ opacity: 1, scale: 1, x: 0 }" :click-4="{ x: 140, transition: { delay: 200 } }" :click-5="{ x: 310, transition: { delay: 200 } }" class="type-box">
      <code>Promise&lt;T&gt;</code>
      <span class="type-id">id: 53</span>
    </div>
    <div v-motion v-click="3" :initial="{ opacity: 0, scale: 0 }" :enter="{ opacity: 1, scale: 1, x: 0 }" :click-4="{ x: 140, transition: { delay: 200 } }" :click-5="{ x: 310, transition: { delay: 200 } }" class="type-box">
      <code>Map&lt;K, V&gt;</code>
      <span class="type-id">id: 82</span>
    </div>
    <div v-motion v-click="4" :initial="{ opacity: 0, y: -50 }" :enter="{ opacity: 1, y: 0, x: -335 }" :click-5="{ x: -170, transition: { delay: 200 } }" class="type-box">
      <code>[A, B][]</code>
      <span class="type-id">id: 34</span>
    </div>
    <div v-motion v-click="5" :initial="{ opacity: 0, y: -50 }" :enter="{ opacity: 1, y: 0, x: -620 }" class="type-box">
      <code>undefined</code>
      <span class="type-id">id: 1</span>
    </div>
  </div>
  <div class="array-bracket">}</div>
</div>
<div v-if="$clicks >= 6" class="checker2-section">
  <div class="checker2-label">Different checker, different IDs, different order:</div>
  <div class="union-array">
    <div class="array-bracket clone-item" style="--from-x:0px">{</div>
    <div class="type-slots">
      <div class="type-box clone-item" style="--from-x:0px; --i:0; background: linear-gradient(135deg, #7c3aed, #8b5cf6);"><code>undefined</code><span class="type-id">id: 1</span></div>
      <div class="type-box clone-item" style="--from-x:0px; --i:1; background: linear-gradient(135deg, #4f46e5, #6366f1);"><code>string</code><span class="type-id">id: 3</span></div>
      <div class="type-box clone-item" style="--from-x:280px; --i:2; background: linear-gradient(135deg, #dc2626, #ef4444);"><code>Map&lt;K, V&gt;</code><span class="type-id changed-id">id: 41</span></div>
      <div class="type-box clone-item" style="--from-x:0px; --i:3; background: linear-gradient(135deg, #059669, #10b981);"><code>Promise&lt;T&gt;</code><span class="type-id changed-id">id: 67</span></div>
      <div class="type-box clone-item" style="--from-x:-280px; --i:4; background: linear-gradient(135deg, #7c2d12, #ea580c);"><code>[A, B][]</code><span class="type-id changed-id">id: 90</span></div>
    </div>
    <div class="array-bracket clone-item" style="--from-x:0px">}</div>
  </div>
</div>
<span v-click="6"></span>

<style>
.type-definition {
  text-align: center;
  margin: 2rem 0;
}

.code-text {
  font-family: var(--slidev-code-font-family);
  font-size: 1.4rem;
  font-weight: 500;
  line-height: 1.4;
}

.union-array {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  margin: auto;
  gap: 20px;
}

.array-bracket {
  font-size: 5rem;
  font-weight: bold;
  color: var(--slidev-theme-primary);
}

.type-slots {
  display: flex;
  position: relative;
  gap: 20px;
  min-width: 700px;
  height: 100px;
  align-items: center;
}

.type-box {
  position: relative;
  background: linear-gradient(135deg, #4f46e5, #6366f1);
  color: white;
  border: none;
  border-radius: 8px;
  padding: 12px 16px;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 4px;
  min-width: 120px;
  box-shadow: 0 4px 12px rgba(79, 70, 229, 0.3);
  transition: transform 0.5s ease;
}

.type-box code {
  font-family: var(--slidev-code-font-family);
  font-size: 1.1rem;
  font-weight: 600;
  color: white;
  background: none;
}

.type-id {
  font-size: 0.8rem;
  color: white;
  background: rgba(255, 255, 255, 0.2);
  padding: 2px 6px;
  border-radius: 4px;
  font-family: var(--slidev-code-font-family);
  opacity: 0.9;
}

/* Different colors for each type */
.type-box:nth-child(1) {
  background: linear-gradient(135deg, #4f46e5, #6366f1);
  box-shadow: 0 4px 12px rgba(79, 70, 229, 0.3);
}

.type-box:nth-child(2) {
  background: linear-gradient(135deg, #059669, #10b981);
  box-shadow: 0 4px 12px rgba(5, 150, 105, 0.3);
}

.type-box:nth-child(3) {
  background: linear-gradient(135deg, #dc2626, #ef4444);
  box-shadow: 0 4px 12px rgba(220, 38, 38, 0.3);
}

.type-box:nth-child(4) {
  background: linear-gradient(135deg, #7c2d12, #ea580c);
  box-shadow: 0 4px 12px rgba(124, 45, 18, 0.3);
}

.type-box:nth-child(5) {
  background: linear-gradient(135deg, #7c3aed, #8b5cf6);
  box-shadow: 0 4px 12px rgba(124, 58, 237, 0.3);
}

/* Dark mode */
.dark .type-box {
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4);
}

.dark .type-box:nth-child(1) {
  box-shadow: 0 4px 12px rgba(79, 70, 229, 0.4);
}

.dark .type-box:nth-child(2) {
  box-shadow: 0 4px 12px rgba(5, 150, 105, 0.4);
}

.dark .type-box:nth-child(3) {
  box-shadow: 0 4px 12px rgba(220, 38, 38, 0.4);
}

.dark .type-box:nth-child(4) {
  box-shadow: 0 4px 12px rgba(124, 45, 18, 0.4);
}

.dark .type-box:nth-child(5) {
  box-shadow: 0 4px 12px rgba(124, 58, 237, 0.4);
}
.checker2-section {
  margin-top: 8px;
}
.checker2-label {
  text-align: center;
  font-size: 0.8rem;
  font-weight: 600;
  color: #f59e0b;
  margin-bottom: 4px;
  animation: cloneFadeIn 0.3s ease-out both;
}
.clone-item {
  animation: cloneSlideOut 0.6s ease-out both;
  animation-delay: calc(var(--i, 0) * 0.06s + 0.05s);
}
@keyframes cloneSlideOut {
  0% {
    opacity: 0;
    transform: translate(var(--from-x, 0px), -120px);
  }
  40% {
    opacity: 1;
  }
  100% {
    opacity: 1;
    transform: translate(0, 0);
  }
}
@keyframes cloneFadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}
.changed-id {
  background: rgba(245, 158, 11, 0.4) !important;
  border: 1px solid rgba(245, 158, 11, 0.6);
  border-radius: 4px;
}
</style>

<!--
Every AST node, Symbol, and Type has a unique ID. These IDs are assigned
based on the order in which they are encountered during processing.
These IDs are then used for various operations like type inference, tie breaking.

For example, consider unions. CLICKS! For efficiency and consistency, unions are
internally sorted by IDs. As we add things to the union, we insert them
in order.

But, as I said before, we use more than one checker!

If two checkers walk the same code differently, that "helicoptering" I mentioned previously, they might assign the same types different IDs, CLICK leading to different union orderings. This can lead to bad effects.
-->

---

# Internal orderings

## 

<!-- dprint-ignore-start -->
```ts twoslash
// @lib: es2020
type A<K, V> = [K, V][];

type B<V> = { [key: string]: V; };

//                               id=91     id=94
function doSomething<K, V>(init: A<K, V> | B<V>): void {}

const obj = {
    key1: "value1",
    key2: "value2",
    key3: "value3",
};

doSomething(Object.entries(obj).map(([key, value]) => [key, value]));
```
<!-- dprint-ignore-end -->

<p style="text-align: right; font-style: italic; opacity: 0.7;">In TS 5.8</p>

<!--
Take this case; when written as is, this code compiles.

But if you swap the order of the union CLICK, the checker walks the code
in a different order, and now inference fails because it chooses a
different inference candidate for the call.
-->

---

# Internal orderings

## 

<!-- dprint-ignore-start -->
```ts twoslash
// @errors: 2345
// @lib: es2020
type A<K, V> = [K, V][];

type B<V> = { [key: string]: V; };

//                               id=89  id=94
function doSomething<K, V>(init: B<V> | A<K, V>): void {}

const obj = {
    key1: "value1",
    key2: "value2",
    key3: "value3",
};

doSomething(Object.entries(obj).map(([key, value]) => [key, value]));
```
<!-- dprint-ignore-end -->

<!--
Take this case; when written as is, this code compiles.

But if you swap the order of the union CLICK, the checker walks the code
in a different order, and now inference fails because it chooses a
different inference candidate for the call.
-->

---

# ID independent sorting

```go
func (c *Checker) compareNodes(n1, n2 *ast.Node) int {
	if n1 == n2 { return 0 }
	if n1 == nil { return 1 }
	if n2 == nil { return -1 }
	s1 := ast.GetSourceFileOfNode(n1)
	s2 := ast.GetSourceFileOfNode(n2)
	if s1 != s2 {
		f1 := c.fileIndexMap[s1]
		f2 := c.fileIndexMap[s2]
		// Order by index of file in the containing program
		return f1 - f2
	}
	// In the same file, order by source position
	return n1.Pos() - n2.Pos()
}
```

<!--
To solve this, we introduced sorting functions for Nodes, Symbols, and Types that
do not depend on IDs.

Nodes are sorted by the file they're a part of, since we have a deterministic
file loading order, and then by their position within that file.
-->

---

# ID independent sorting

```go
func (c *Checker) compareSymbols(s1, s2 *ast.Symbol) int {
	if s1 == s2 { return 0 }
	if s1 == nil { return 1 }
	if s2 == nil { return -1 }
	if len(s1.Declarations) != 0 && len(s2.Declarations) != 0 {
		if r := c.compareNodes(s1.Declarations[0], s2.Declarations[0]); r != 0 {
			return r
		}
	} else if len(s1.Declarations) != 0 {
		return -1
	} else if len(s2.Declarations) != 0 {
		return 1
	}
	if r := strings.Compare(s1.Name, s2.Name); r != 0 {
		return r
	}
	return int(ast.GetSymbolId(s1)) - int(ast.GetSymbolId(s2))
}
```

<!--
Symbols are sorted by their declaration, name, and finally by ID as a last resort,
which only ever happens for symbols created wholly within the checker.
 -->

---

# ID independent sorting

```go
func CompareTypes(t1, t2 *Type) int {
	if t1 == t2 { return 0 }
	if t1 == nil { return -1 }
	if t2 == nil { return 1 }
	if c := getSortOrderFlags(t1) - getSortOrderFlags(t2); c != 0 {
		return c
	}
	if c := compareTypeNames(t1, t2); c != 0 {
		return c
	}
	switch {
	// ...
	case t1.flags&TypeFlagsStringLiteral != 0:
		// String literal types are ordered by their values.
		if c := strings.Compare(
			t1.AsLiteralType().value.(string),
			t2.AsLiteralType().value.(string)); c != 0 { return c }
	// ...
	}
```

<!--
Types are sorted by their flags, their names if present.

And when comparing types whose flags match, we walk into them and compare
their parts, like looking at the actual literal values of string or number
types.

The upshot of this is that two type checkers, given the same input,
will always produce the same orderings, regardless of how they walked
the code.

But, this does mean that some programs that compiled before
might not compile now, because the orderings are different.
-->

---

# `--stableTypeOrdering`

## 

These should behave the same!

```console
$ npx tsgo
$ npx tsc --stableTypeOrdering
```

<!--
And so, given this difference, we backported the sorting algorithm to the old compiler
in TS 6.0. If you pass `--stableTypeOrdering`, you'll be able to check ahead of time
what might break, or determine if a change is related to this ordering specifically.

This helps bridge the gap between the old and new compilers.

Now, this flag comes at a pretty significant performance cost; I've seen some codebases take 30% longer to compile, so I wouldn't recommend leaving it on permanently.
-->

---

# Backporting (forward porting?) from TS 5/6 to TS 7

## 

Every 5.x/6.x change needs to land in Go too

<img src="/img/copilot-port-prs.png" alt="GitHub PR list showing Copilot-authored port PRs like 'Port TypeScript#63071: Mark downlevelIteration as removed', 'Port TS PR #62418: Add diagnostic when rootDir inference changes output layout', and others, all authored by Copilot AI and merged with approvals" class="port-img" />

<style>
.port-img {
  height: 80%;
  margin-left: auto;
  margin-right: auto;
}
</style>

<!--
Finally, since we were working on TS 5 and 6 at the same time as the port, we had a big backlog
of changes that needed to be ported to Go. Originally, we did this by hand. But in the year since
we started porting, tools like Copilot have gotten really good. We were able to port pretty much all
PRs that went into the old compiler using Copilot, which was a huge help in getting everything in.
-->

---
layout: section
---

# What's next?

<!--
So, what's next?

Of course, we're going to release TS 7.

But we're already working on new stuff, like Wasm builds, and an API for 7.1
-->

---

# The new API

## 

<div v-if="$clicks < 1">

```ts
import { API } from "@typescript/native-preview/unstable/sync"; // eventually, just "typescript/sync"
import { createVirtualFileSystem } from "@typescript/native-preview/unstable/fs";

const api = new API({
    cwd: process.cwd(),
    fs: createVirtualFileSystem({
        "/tsconfig.json": "{}",
        "/src/index.ts": "const x: number = 1;",
    }),
});

const snapshot = api.updateSnapshot({
    openProject: "/tsconfig.json",
});
```

</div>
<div v-if="$clicks === 1">

```ts
const project = snapshot.getProject("/tsconfig.json")!;

// Diagnostics
const diags = project.program.getSemanticDiagnostics("/src/index.ts");

// Type checker
const symbol = project.checker.getSymbolAtPosition("/src/index.ts", 6);
const type = project.checker.getTypeOfSymbol(symbol);
console.log(symbol.name, project.checker.typeToString(type)); // "x", "number"
```

</div>
<div v-if="$clicks >= 2">

```ts
import { isFunctionDeclaration } from "@typescript/native-preview/unstable/ast/is";

const sourceFile = project.program.getSourceFile("/src/index.ts");

sourceFile?.forEachChild(function visit(node) {
    if (isFunctionDeclaration(node)) {
        console.log("Found function:", node.name?.text);
    }
    node.forEachChild(visit);
});
```

</div>

<!-- Hack: ensure Slidev tracks clicks -->
<!-- dprint-ignore-start -->
<span v-click="1"></span><span v-click="2"></span>
<!-- dprint-ignore-end -->

<!--
Let me show you the new prototype API.

We're calling it "unstable" for now. You create an API
instance, hand it a file system (real or virtual), and call updateSnapshot to
open a project.

Click: From there you get a project with a program and a type checker. You
can get diagnostics, resolve symbols, ask for types. These are familiar concepts if
you've used the old API.

Click: And the generated AST type guards work just like before. Visit nodes,
narrow types, inspect the tree.
-->

---

# How does this work?

<!-- dprint-ignore-start -->
<div class="rpc-diagram">
  <div class="rpc-side">
    <div class="rpc-label">Your code (Node.js)</div>
    <div class="rpc-box">
      <div class="rpc-item">new API()</div>
      <div class="rpc-item">snapshot.getProject()</div>
      <div class="rpc-item">checker.getTypeOfSymbol()</div>
    </div>
  </div>
  <div class="rpc-pipe">
    <div class="rpc-pipe-label">stdin / stdout</div>
    <div class="rpc-pipe-line"></div>
    <div class="rpc-pipe-format">MessagePack binary</div>
  </div>
  <div class="rpc-side">
    <div class="rpc-label">tsgo (Go process)</div>
    <div class="rpc-box rpc-box-go">
      <div class="rpc-item">Parser</div>
      <div class="rpc-item">Checker</div>
      <div class="rpc-item">Emitter</div>
    </div>
  </div>
</div>
<!-- dprint-ignore-end -->

<v-clicks>

- Out of process: Go binary spawned as a child
- Sync API: blocking reads/writes on pipes, no async needed
- Async API: JSON-RPC 2.0 over streams

</v-clicks>

<style>
.rpc-diagram {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 24px;
  margin: 24px 0;
}
.rpc-side { text-align: center; }
.rpc-label {
  font-weight: 700;
  font-size: 14px;
  margin-bottom: 12px;
  opacity: 0.7;
  text-transform: uppercase;
  letter-spacing: 1.5px;
}
.rpc-box {
  border: 2px solid #475569;
  border-radius: 10px;
  padding: 14px 20px;
  min-width: 220px;
  display: flex;
  flex-direction: column;
  gap: 6px;
}
html.dark .rpc-box { background: #1e293b; }
html:not(.dark) .rpc-box { background: #f1f5f9; border-color: #94a3b8; }
.rpc-box-go { border-color: #3b82f6; }
html.dark .rpc-box-go { background: #172554; }
html:not(.dark) .rpc-box-go { background: #eff6ff; border-color: #3b82f6; }
.rpc-item {
  font-family: var(--slidev-code-font-family);
  font-size: 0.85rem;
  padding: 4px 10px;
  border-radius: 4px;
  background: rgba(128,128,128,0.1);
}
.rpc-pipe {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 4px;
  min-width: 160px;
}
.rpc-pipe-label {
  font-size: 0.75rem;
  font-family: var(--slidev-code-font-family);
  opacity: 0.5;
}
.rpc-pipe-line {
  height: 3px;
  width: 100%;
  background: #64748b;
  position: relative;
}
.rpc-pipe-line::after {
  content: '';
  position: absolute;
  right: -1px;
  top: 50%;
  transform: translateY(-50%);
  border-left: 8px solid #64748b;
  border-top: 5px solid transparent;
  border-bottom: 5px solid transparent;
}
.rpc-pipe-line::before {
  content: '';
  position: absolute;
  left: -1px;
  top: 50%;
  transform: translateY(-50%);
  border-right: 8px solid #64748b;
  border-top: 5px solid transparent;
  border-bottom: 5px solid transparent;
}
.rpc-pipe-format {
  font-size: 0.7rem;
  opacity: 0.4;
}
</style>

<!--
Under the hood, this is all out of process.

CLICK Your Node.js code talks to a Go binary over stdin/stdout pipes.

CLICK The sync API uses blocking reads and writes, no async needed.

CLICK But there's also an async API using JSON-RPC 2.0.
-->

---

# Everything is generated

##

[github.com/microsoft/typescript-go/blob/main/_scripts/ast.json](https://github.com/microsoft/typescript-go/blob/main/_scripts/ast.json) (single source of truth)

<div v-if="$clicks < 1">

```json
{
  "FunctionDeclaration": {
    "extends": "FunctionLikeDeclaration",
    "members": {
      "name": { "type": "Identifier", "optional": true },
      "body": { "type": "FunctionBody", "optional": true },
      "asteriskToken": { "type": "AsteriskToken", "optional": true }
    }
  }
}
```

</div>
<div v-if="$clicks === 1">

```ts
// Generated: ast.generated.ts
export interface FunctionDeclaration extends FunctionLikeDeclaration {
    readonly kind: SyntaxKind.FunctionDeclaration;
    readonly name?: Identifier;
    readonly body?: FunctionBody;
    readonly asteriskToken?: AsteriskToken;
}

// Generated: is.generated.ts
export function isFunctionDeclaration(node: Node): node is FunctionDeclaration {
    return node.kind === SyntaxKind.FunctionDeclaration;
}
```

</div>
<div v-if="$clicks >= 2">

```go
// Generated: ast_generated.go
type FunctionDeclaration struct {
    FunctionLikeDeclarationBase
    Name          *IdentifierNode
    Body          *FunctionBody
    AsteriskToken *AsteriskToken
}

// Generated: encoder_generated.go
func (e *Encoder) encodeFunctionDeclaration(node *FunctionDeclaration) {
    e.writeNodeHeader(SyntaxKindFunctionDeclaration)
    e.writeOptionalNode(node.Name)
    // ...
}
```

</div>

<!-- dprint-ignore-start -->
<span v-click="1"></span><span v-click="2"></span>
<!-- dprint-ignore-end -->

<!--
As a part of making this API, we've finally been able to make a spec for our AST types.
We can define them in JSON, and generate the rest.

Click: TypeScript interfaces, type guards, factory functions.

Click: Go structs, and the binary encoder/decoder that serializes the AST
across the RPC boundary. One source of truth!
-->

---

# Tradeoffs

## 

<!-- dprint-ignore-start -->
<div v-click="1" class="napi-diagram">
  <div class="process-box">
    <div class="process-label">Node.js process</div>
    <div class="napi-modules">
      <div class="napi-mod">
        <div class="mod-name">typescript@7.0</div>
        <div class="go-rt">Go runtime</div>
      </div>
      <div class="napi-mod napi-mod-bad">
        <div class="mod-name">typescript@7.1</div>
        <div class="go-rt go-rt-bad">Go runtime</div>
      </div>
      <div class="napi-boom">💥</div>
    </div>
  </div>
</div>
<!-- dprint-ignore-end -->

<v-clicks>

- Why not N-API?
  - Go's runtime can only be loaded once per process
  - One N-API module means one TypeScript version, ever
  - Possibly later for perf
- Out of process: different tradeoffs
  - Objects live in Go; JS gets lightweight proxies
  - Need explicit lifetimes: scoped to a `Snapshot`
  - When you update the snapshot, old references are invalidated
- The upside: cross-process plugins
  - Any process can open a channel to `tsgo`
  - Plugins don't need to be in the same process or language
  - Editors, linters, bundlers can all connect

</v-clicks>

<style>
.napi-diagram {
  position: absolute;
  right: 40px;
  top: 100px;
}
.process-box {
  border: 2px solid #475569;
  border-radius: 10px;
  padding: 14px 20px;
  position: relative;
}
html.dark .process-box { background: #1e293b; }
html:not(.dark) .process-box { background: #f1f5f9; border-color: #94a3b8; }
.process-label {
  font-weight: 700;
  font-size: 14px;
  text-transform: uppercase;
  letter-spacing: 1.5px;
  opacity: 0.7;
  margin-bottom: 12px;
}
.napi-modules {
  display: flex;
  align-items: center;
  gap: 10px;
}
.napi-mod {
  border: 2px solid #22c55e;
  border-radius: 8px;
  padding: 8px 12px;
  text-align: center;
}
html.dark .napi-mod { background: #14532d; }
html:not(.dark) .napi-mod { background: #f0fdf4; }
.napi-mod-bad {
  border-color: #ef4444;
  opacity: 0.7;
}
html.dark .napi-mod-bad { background: #450a0a; }
html:not(.dark) .napi-mod-bad { background: #fef2f2; }
.mod-name {
  font-family: var(--slidev-code-font-family);
  font-size: 0.65rem;
  font-weight: 600;
  margin-bottom: 4px;
}
.go-rt {
  font-size: 0.6rem;
  padding: 2px 6px;
  border-radius: 4px;
  background: rgba(34, 197, 94, 0.2);
  color: #22c55e;
  font-weight: 600;
}
.go-rt-bad {
  background: rgba(239, 68, 68, 0.2);
  color: #ef4444;
  text-decoration: line-through;
}
.napi-boom {
  font-size: 2rem;
}
.napi-caption {
  text-align: center;
  margin-top: 10px;
  font-size: 0.8rem;
  color: #ef4444;
  font-weight: 600;
}
</style>

<!--
CLICK Why not N-API? Go has a runtime that can only be loaded once per process. That
means one N-API module locks you to one TypeScript version per process. We could
possibly ship an N-API package later with restrictions, but our testing has shown
it's not that much faster.

CLICK Out of process means different tradeoffs: objects live in Go, JS gets proxies,
you need explicit lifetimes scoped to Snapshots.

CLICK But the upside is cross-process plugins. Any process can open a channel to tsgo:
editors, linters. That's not really possible with N-API.

Again, I don't think we're ruling out N-API entirely; this all certainly needs more research.
-->

---
layout: section
---

# What it means for you

<!--
Let's close out. What does all of this mean for you?
-->

---
layout: image-right
image: /img/ready.jpg
---

# TS 7.0 is ready

##

<v-clicks>

- Is it fast? Yes!
- Please, try out the beta (or better, nightly!)
  - [jakebailey.dev/go/ts-7.0-beta](https://jakebailey.dev/go/ts-7.0-beta)
  - `npm install -D @typescript/native-preview`
- PLEASE, try out the VS Code extension!
  - [jakebailey.dev/go/ts-native-preview-ext](https://jakebailey.dev/go/ts-native-preview-ext)
- Give us feedback! [github.com/microsoft/typescript-go](https://github.com/microsoft/typescript-go)
  - Especially if you have API thoughts
- Switch to TS 6.0 ASAP!
  - Use [github.com/andrewbranch/ts5to6](https://github.com/andrewbranch/ts5to6)
  to fix deprecated 5.x stuff

</v-clicks>

<!--
Is it fast? Yes!

TS 7.0 is very ready to use today. CLICK Please try it out.

CLICK we have the npm package, and the VS Code extension

We absolutely want your feedback. CLICK

And if you haven't already, please update to TS 6.0, so you're ready to jump to 7.0 when it comes out.
Andrew on our team even made a tool to help with that upgrade.
-->


---

# Thank you!

## 

Find me online!

- [jakebailey.dev](https://jakebailey.dev)
- [@jakebailey.dev](https://bsky.app/profile/jakebailey.dev) on Bluesky
- [@jakebailey](https://github.com/jakebailey) on GitHub

<div class="talk-info">
<QRCode id="talk-qrcode" :width="175" :height="175" type="svg" :dotsOptions="{ color: 'var(--slidev-code-foreground)' }" :backgroundOptions="{ color: 'transparent' }"
data="https://jakebailey.dev/talk-tskaigi-2026" image="/img/typescript-design-assets/ts-logo-512.svg" :imageOptions="{ margin: 2 }" />

<br>
<br>
<br>
<br>
<br>
<br>
<br>

[jakebailey.dev/talk-tskaigi-2026](https://jakebailey.dev/talk-tskaigi-2026)

</div>

<img src="/img/me.jpg" alt="Professional headshot of Jake Bailey, a man with brown hair and beard wearing an olive green t-shirt, photographed outdoors by a body of water at sunset" id="profile-pic" />

<style>
  .talk-info {
    position: relative;
    text-align: right;
    padding-top: 0;
  }
  #talk-qrcode {
    position: absolute;
    top: -\0px;
    right: 0;
  }
  .talk-info p {
    margin: 0;
    clear: both;
  }
  #profile-pic {
    position: absolute;
    top: 24%;
    left: 35%;
    width: 10%;
    border-radius: 50%;
    object-fit: cover;
    box-shadow: 0 4px 12px rgba(0,0,0,0.3);
  }
</style>


<!-- 
And with that, thank you all for listening! Again, feel free to look back on these slides,
and don't be afraid to come talk to me about anything!
 -->
