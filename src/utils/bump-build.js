const fs = require("fs");
const path = require("path");
const { execSync } = require("child_process");

const pkgPath = path.resolve(__dirname, "..", "..", "package.json");
const pkg = JSON.parse(fs.readFileSync(pkgPath, "utf8"));

const baseVersion = pkg.version?.split("+")[0] || "1.0.0";

pkg.build = typeof pkg.build === "number" ? pkg.build + 1 : 1;

pkg.version = `${baseVersion}+build${pkg.build}`;

fs.writeFileSync(pkgPath, JSON.stringify(pkg, null, 2) + "\n", "utf8");

console.log(`✅ Build bumped to ${pkg.build}`);
console.log(`📦 Version set to ${pkg.version}`);

try {
  console.log("📦 Uninstalling old global version...");
  execSync("npm uninstall -g protoparser", { stdio: "inherit" });

  const projectRoot = path.resolve(__dirname, "..", "..");
  console.log("📦 Reinstalling new global version...");
  execSync("npm install -g .", { cwd: projectRoot, stdio: "inherit" });

  const output = execSync("protoparser --version", { encoding: "utf8" });
  console.log("🔎 Version output from protoparser:");
  console.log(output);
} catch (err) {
  console.error("❌ npm failed:", err.message || err);
  process.exit(1);
}
