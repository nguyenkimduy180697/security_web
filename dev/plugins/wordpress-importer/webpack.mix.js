const mix = require('laravel-mix')
const path = require('path')

const directory = path.basename(path.resolve(__dirname))
const source = `dev/plugins/${directory}`
const dist = `public/vendor/core/plugins/${directory}`

mix.js(`${source}/resources/js/wordpress-importer.js`, `${dist}/js`)

if (mix.inProduction()) {
    mix.copy(`${dist}/js/wordpress-importer.js`, `${source}/public/js`)
}
