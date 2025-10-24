const mix = require('laravel-mix')
const path = require('path')

const directory = path.basename(path.resolve(__dirname))
const source = `dev/libs/${directory}`
const dist = `public/vendor/core/libs/${directory}`

mix
    .js(`${source}/resources/js/widget.js`, `${dist}/js`)
    .sass(`${source}/resources/sass/widget.scss`, `${dist}/css`)

if (mix.inProduction()) {
    mix
        .copy(`${dist}/js/widget.js`, `${source}/public/js`)
        .copy(`${dist}/css/widget.css`, `${source}/public/css`)
}
