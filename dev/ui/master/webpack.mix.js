const mix = require('laravel-mix')
const path = require('path')

const directory = path.basename(path.resolve(__dirname))
const source = `dev/ui/${directory}`
const dist = `public/ui/${directory}`

mix
    .sass(`${source}/assets/sass/style.scss`, `${dist}/css`)
    .js(`${source}/assets/js/master.js`, `${dist}/js`)

if (mix.inProduction()) {
    mix.copy(`${dist}/css/style.css`, `${source}/public/css`)
        .copy(`${dist}/js/master.js`, `${source}/public/js`)
}
