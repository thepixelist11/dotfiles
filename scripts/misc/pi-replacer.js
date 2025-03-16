#!/usr/bin/env node

const fs = require("fs");
const path = require("path");

const inputFile = process.argv[2];

try {
    const stat = fs.statSync(inputFile);
    if (!stat.isFile()) throw new Error("Not a file.");
} catch (err) {
    console.error("Error: ", err);
    process.exit(1);
}

const fileData = fs.readFileSync(inputFile, { encoding: "utf8" });

const pied = fileData.replace(/pi/g, "π").replace(/P[iI]/g, "Π");

fs.writeFileSync(
    `${path.basename(inputFile, path.extname(inputFile))}-pi${path.extname(inputFile)}`,
    pied,
    { encoding: "utf8" }
);
