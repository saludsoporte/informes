process.env.NODE_ENV = process.env.NODE_ENV || 'development'
const { environment } = require('@rails/webpacker')
const environment = require('./environment')
environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        jquery: 'jquery/src/jquery',
        jQuery: 'jquery/src/jquery',
        popper: 'jquery/src/popper',
        selectize: '?'
    })
)

module.exports = environment.toWebpackConfig()