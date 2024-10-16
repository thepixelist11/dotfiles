const { exec } = require('child_process')
const fs = require('fs')
const readline = require('readline')
const path = require('path')

let bookmarks = JSON.parse(fs.readFileSync(path.join('/home/ben/scripts/wofiBookmarks/bookmarks.json')).toString())

function main() {
  const mode = process.argv[2]
  if (mode === "ls") {
    for (const bm in bookmarks) {
      console.log(bm)
    }
  } else if (mode === "go") {
    var rl = readline.createInterface({
      input: process.stdin,
      output: process.stdout,
      terminal: false
    });

    rl.on('line', function(line) {
      if (!bookmarks[line]) {
        console.error(`Bookmark ${line} Not Found!`)
      } else {
        exec(`firefox --no-remote -P "fullscreen" --new-instance "${bookmarks[line].url}"`)
      }
    })
  } else {
    console.log(`Use ls to list bookmarks, use go to go to the piped bookmark`)
  }
}

main()

