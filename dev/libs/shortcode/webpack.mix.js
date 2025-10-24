const mix = require('laravel-mix')
const path = require('path')

const directory = path.basename(path.resolve(__dirname))
const source = 'dev/libs/' + directory
const dist = 'public/vendor/core/libs/' + directory

mix
    .js(`${source}/resources/js/shortcode-fields.js`, `${dist}/js`)
    .js(`${source}/resources/js/shortcode.js`, `${dist}/js`)
    .sass(`${source}/resources/sass/shortcode.scss`, `${dist}/css`)

if (mix.inProduction()) {
    mix
        .copy(`${dist}/js/shortcode-fields.js`, `${source}/public/js`)
        .copy(`${dist}/js/shortcode.js`, `${source}/public/js`)
        .copy(`${dist}/css/shortcode.css`, `${source}/public/css`)
}
