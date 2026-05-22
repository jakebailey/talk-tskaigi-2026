import { createRequire } from "node:module";
import { readFileSync } from "node:fs";
import { dirname, join } from "node:path";

// Switch TypeScript's diagnostic messages to Japanese for twoslash code blocks.
// `setLocalizedDiagnosticMessages` mutates module-global state on the TS
// instance, so we have to do this on the same `typescript` copy that twoslash
// uses (pnpm gives twoslash its own copy, distinct from ours).
const require = createRequire(import.meta.url);
const shikiTwoslashRequire = createRequire(require.resolve("@shikijs/twoslash"));
const twoslashRequire = createRequire(shikiTwoslashRequire.resolve("twoslash"));
const ts = twoslashRequire("typescript");
const tsLibDir = dirname(twoslashRequire.resolve("typescript/lib/typescript.js"));
const messages = JSON.parse(
    readFileSync(join(tsLibDir, "ja", "diagnosticMessages.generated.json"), "utf8"),
);
ts.setLocalizedDiagnosticMessages(messages);

export default {
    base: "/talk-tskaigi-2026/",
};
