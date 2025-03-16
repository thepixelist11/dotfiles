// Just some setup and file reading stuff.

const fs = require("fs");

const inputFileName = process.argv[2];
const searchWord = process.argv[3];

if (!searchWord) {
    console.error("No search word defined.");
    process.exit(1);
}

try {
    if (!fs.existsSync(inputFileName))
        throw new Error(`${inputFileName} does not exist.`);
    const stats = fs.statSync(inputFileName);
    if (!stats.isFile())
        throw new Error(`${inputFileName} is not a file.`);
} catch (msg) {
    console.error(msg);
    process.exit(1);
}

const fileData = fs.readFileSync(inputFileName, { encoding: "utf8" });

const lines = fileData.split("\n");
const fileLength = lines.length;

// Finding all lines with the word in it

let instances = [];

for (let i = 0; i < lines.length; i++) {
    if (lines[i].includes(searchWord)) {
        instances.push(i);
    }
}

// Calculating the mean.

let mean = 0;
for (const i of instances)
    mean += i / fileLength;
mean /= instances.length;

// Now the standard deviation and variance.

let variance = 0;
for (const i of instances)
    variance += Math.pow((i / fileLength) - mean, 2);
variance /= instances.length;
const stdev = Math.sqrt(variance);

// Outputting the data.

const instanceLogLineLength = `100% (line ${fileLength}) | `.length;

console.log(`Locations of all "${searchWord}" in ${inputFileName}:\n`);
for (const i of instances) {
    console.log(
        `${((i / fileLength) * 100).toFixed(2)}% (line ${i})`.padEnd(instanceLogLineLength, " ") + `| ${lines[i].trim()}`
    );
}

console.log();
console.log(`Mean Location      : ${(mean * 100).toFixed(2)}%`);
console.log(`Standard Deviation : ${(stdev * 100).toFixed(2)}%`);
